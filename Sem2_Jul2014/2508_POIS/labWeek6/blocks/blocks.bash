#! /bin/bash

#############################################################################
#                       Propositional Blocks Domain                         #
#############################################################################
#	Copyright (C) 2006 by Muhammad Abdul Hakim Newton mahnewton@gmail.com	#
#	                                                                     	#
#	This program is free software; you can redistribute it and/or modify	#
#	it under the terms of the GNU General Public License as published by	#
#	the Free Software Foundation; either version 2 of the License, or     	#
#	(at your option) any later version.                                   	#
#	                                                                      	#
#	This program is distributed in the hope that it will be useful,       	#
#	but WITHOUT ANY WARRANTY; without even the implied warranty of        	#
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         	#
#	GNU General Public License for more details.                          	#
#	                                                                      	#
#	You should have received a copy of the GNU General Public License     	#
#	along with this program; if not, write to the                         	#
#	Free Software Foundation, Inc.,                                       	#
#	59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             	#
#############################################################################

# This blocksworld generator uses the random bw state generator algorithm provided
# by John Slaney and Sylvie Thiebaux. 



#	global variables
declare PROGRAM=$0		#	program name
declare -i COUNT=$#		#	parameter count
declare DOMAIN=$(basename $0 | sed -r s/\.[[:alnum:]_-]+$//)	#	domain and file names are same
declare OPTION=$1		#	generate the domain (-d) or a problem (-p) or usage ()

#	global functions
declare -f explain
declare -f domain
declare -f getposition
declare -f makeratios
declare -f getratio
declare -f makestate
declare -f problem

#	explain usage and game rules
function explain
{
	echo
	echo "Usage for domain:"
	echo "	$PROGRAM -d [ey|en]"
	echo "		ey	:	use object equality (default)"
	echo "		en	:	do not use object equality"
	echo "Usage for problem:"
	echo "	$PROGRAM -p #block [#seed]"
	echo "		#block	:	number of blocks (>= 2)"
	echo "		#seed	:	optional seed for random number generation" 
	echo "Description:"
	echo "	> The blocks stacked on a table are to be re-stacked."
	echo "	> This domain have 4 operators: pick, drop, stack, and unstack."
	echo "	> The problem generator algorithm is from John Slaney and Sylvie Thiebaux."
	echo
	return 2
}


#	generate the domain
function domain
{
	echo 
	echo "(define"
	echo "	(domain $DOMAIN)"
	echo "	(:requirements"
	if [[ -z $EQUALITY || $EQUALITY == "ey" ]]
	then
		echo "		:strips :typing :equality"
	else
		echo "		:strips :typing"
	fi
	echo "	)"
	echo "	(:types"
	echo "		block"
	echo "	)"
	echo "	(:predicates"
	echo "		(arm-free)"
	echo "		(clear ?b - block)"
	echo "		(on ?ab ?ub - block)"
	echo "		(on-table ?b - block)"
	echo "		(holding ?b - block)"
	echo "	)"
	echo "	(:action pick"
	echo "		:parameters (?b - block)"
	echo "		:precondition"
	echo "			(and"
	echo "				(arm-free)"
	echo "				(clear ?b)"
	echo "				(on-table ?b)"
	echo "			)"
	echo "		:effect"
	echo "			(and"
	echo "				(holding ?b)"
	echo "				(not (arm-free))"
	echo "				(not (clear ?b))"
	echo "				(not (on-table ?b))"
	echo "			)"
	echo "	)"
	echo "	(:action drop"
	echo "		:parameters (?b - block)"
	echo "		:precondition"
	echo "			(and"
	echo "				(holding ?b)"
	echo "			)"
	echo "		:effect"
	echo "			(and"
	echo "				(arm-free)"
	echo "				(clear ?b)"
	echo "				(on-table ?b)"
	echo "				(not (holding ?b))"
	echo "			)"
	echo "	)"
	echo "	(:action stack"
	echo "		:parameters (?ab ?ub - block)"
	echo "		:precondition"
	echo "			(and"
	echo "				(clear ?ub)"
	echo "				(holding ?ab)"
	if [[ -z $EQUALITY || $EQUALITY == "ey" ]]
	then
		echo "				(not (= ?ab ?ub))"
	fi
	echo "			)"
	echo "		:effect"
	echo "			(and"
	echo "				(arm-free)"
	echo "				(clear ?ab)"
	echo "				(holding ?ab ?ub)"
	echo "				(not (holding ?ab))"
	echo "				(not (clear ?ub))"
	echo "			)"
	echo "	)"
	echo "	(:action unstack"
	echo "		:parameters (?ab ?ub - block)"
	echo "		:precondition"
	echo "			(and"
	echo "				(arm-free)"
	echo "				(clear ?ab)"
	echo "				(holding ?ab ?ub)"
	if [[ -z $EQUALITY || $EQUALITY == "ey" ]]
	then
		echo "				(not (= ?ab ?ub))"
	fi
	echo "			)"
	echo "		:effect"
	echo "			(and"
	echo "				(clear ?ub)"
	echo "				(holding ?ab)"
	echo "				(not (arm-free))"
	echo "				(not (clear ?ab))"
	echo "				(not (holding ?ab ?ub))"
	echo "			)"
	echo "	)"
	echo ")"
	echo
	return 0
}

declare -i ONE=9999

#returns value in $POSITION
declare -i POSITION
function getposition	#(int x, int y)
{
	declare -i x=$1
	declare -i y=$2
    POSITION=$((x * (BLOCK + 2 - x) + y))
}

#returns value in $RATIO
declare -i RATIOS
function makeratios
{
	declare -i TEMP
	for(( k = 0; k <= BLOCK; k++))
	do
		TEMP[$k]=$ONE 
	done
	for ((n=0; n<= BLOCK; n++))
	do
    	for ((k=0; (k + n) <= BLOCK; k++))
		do 
			if ((n == 0))
			then
				getposition $n $k
				RATIOS[$POSITION]=$ONE
			else
				TEMP[$k]=$(((${TEMP[$k]} * (${TEMP[$((k+1))]} + ($n + $k) * $ONE)) / (${TEMP[$k]} + ($n + $k - 1) * $ONE)))
	      		if (((n % 2) == 0))
				then 
					getposition $((n/2)) $k
					RATIOS[$POSITION]=${TEMP[$k]}
				fi
			fi
		done
	done      
}

#returns values in $RATIO
declare -i RATIO
function getratio	#(int x, int y)
{
	declare -i x=$1
	declare -i y=$2
	getposition $((x / 2)) $y
    if ((x % 2 != 0))
	then
		RATIO=$(((RATIOS[$((POSITION + 1))] + ($x + $y) * $ONE)  * ${RATIOS[$POSITION]} / ($ONE * ($x + $y - 1) + ${RATIOS[$POSITION]})))
    else
		RATIO=${RATIOS[$POSITION]}
	fi
}

#returns value in 
declare -i STATE
function makestate
{
	declare -i ROOTEDTOP		# The towers which are on the table (top bottom)
	declare -i ROOTEDBOTTOM
	declare -i FLOATINGTOP
	declare -i FLOATINGBOTTOM
	declare -i ROOTEDCOUNT
	declare -i FLOATINGCOUNT

    declare -i NRANDOM      # The randomly generated number
    declare -i NRATIO		# The relevant ratio from the array 
    declare -i PROBABILITY  # The probability that the block goes on the table
    declare -i CHOICE       # Abbreviates (n + k) 
    declare -i DESTBLOCK   # The destination block 
    
    for ((i = 0; i < BLOCK; i++)) 
	do
		ROOTEDTOP[$i]=-1
		ROOTEDBOTTOM[$i]=-1
		FLOATINGTOP[$i]=$i
		FLOATINGBOTTOM[$i]=$i
		STATE[$i]=-1;
    done                 # Initially, each block is a floating tower 
    ROOTEDCOUNT=0
    FLOATINGCOUNT=$BLOCK
    while ((FLOATINGCOUNT--)) 
	do
		NRANDOM=$((ONE * RANDOM / 32767));
	    CHOICE=$((FLOATINGCOUNT + ROOTEDCOUNT))
		getratio FLOATINGCOUNT ROOTEDCOUNT
		NRATIO=$RATIO
		PROBABILITY=$((ONE * NRATIO / (NRATIO + ONE * CHOICE)))
		if ((NRANDOM <= PROBABILITY)) 
		then                 # Put the next block on the table 
	    	ROOTEDTOP[$ROOTEDCOUNT]=${FLOATINGTOP[$FLOATINGCOUNT]}
	    	ROOTEDBOTTOM[$ROOTEDCOUNT]=${FLOATINGBOTTOM[$FLOATINGCOUNT]}
	    	((ROOTEDCOUNT++))
		else             # Put the next block on some b 
	    	DESTBLOCK=$((CHOICE * (NRANDOM - PROBABILITY) / (ONE - PROBABILITY)))
	    	if ((DESTBLOCK < ROOTEDCOUNT)) 
			then     # Destination is a rooted tower 
				STATE[${FLOATINGBOTTOM[$FLOATINGCOUNT]}]=${ROOTEDTOP[$DESTBLOCK]}
				ROOTEDTOP[$DESTBLOCK]=${FLOATINGTOP[$FLOATINGCOUNT]}
	    	else 
			                    # Destination is a floating tower
				((DESTBLOCK -= ROOTEDCOUNT))
				STATE[${FLOATINGBOTTOM[$FLOATINGCOUNT]}]=${FLOATINGTOP[$DESTBLOCK]}
				FLOATINGTOP[$DESTBLOCK]=${FLOATINGTOP[$FLOATINGCOUNT]}
      		fi
    	fi
  	done
}

function problem
{
	if (( SEED != 0 ))				#	if a seed is given, use it
	then
		RANDOM=$SEED
	fi
	echo
	echo "(define"
	echo "	(problem $DOMAIN-$BLOCK)"
	echo "	(:domain $DOMAIN)"
	echo "	(:objects"
	for (( i = 0; i < BLOCK; i++ ))
	do
		echo "		b$i"				#	blocks
	done
	echo "			- block"
	echo "	)"
	makeratios

	declare -i INITSTATE
	makestate
	for(( i = 0; i < BLOCK; i++ ))
	do
		INITSTATE[$i]=${STATE[$i]}
	done
	echo "	(:init"
	echo "		(arm-free)"
	for (( i = 0; i< BLOCK; i++))
	do
		if ((INITSTATE[i] == -1))
		then 
			echo "		(on-table b$i)"
		else 
			echo "		(holding b$i b${STATE[i]})"
		fi
		declare -i j=0 
		while((j < BLOCK && (i==j ||  INITSTATE[j] != i) ))
		do
				((j++))
   		done              
   		if ((j == BLOCK))
		then
   			echo "		(clear b$i)"
		fi
	done
	echo "	)"
	declare -i GOALSTATE
	declare INITGOALDIFF=FALSE
	while [[ $INITGOALDIFF == "FALSE" ]]
	do
		makestate
		for(( i = 0; i < BLOCK; i++ ))
		do
			GOALSTATE[$i]=${STATE[$i]}
			if ((INITSTATE[i] != GOALSTATE[i]))
			then
				INITGOALDIFF=TRUE
			fi		
		done
	done
	echo "	(:goal"
	echo "		(and"
	for (( i = 0; i< BLOCK; i++))
	do
		if ((GOALSTATE[i] == -1))
		then 
			echo "			(on-table b$i)"
		else 
			echo "			(holding b$i b${STATE[i]})"
		fi
		declare -i j=0 
		while((j < BLOCK && (i==j || GOALSTATE[j] != i) ))
		do
				((j++))
    	done
    	if ((j == BLOCK))
		then
    		echo "			(clear b$i)"
		fi
	done
	echo "		)"
	echo "	)"
	echo ")"
	echo
	return 0
}



#	main body

if [[ $OPTION == "-p" ]] 
then
	declare -i BLOCK=$2		#	number of blocks
	declare -i SEED=$3		#	optional seed for random number generation
	if (( ($COUNT == 2 || $COUNT == 3) && $BLOCK >= 2)) 
	then
		problem
	else
		echo
		echo "	Error in parameter count or parameter values."
		echo
		explain
	fi
elif [[ $OPTION == "-d" ]]
then
	declare EQUALITY=$2		#	optional equality (ey) no-equality (en)
	if [[ $COUNT -eq 1 || $COUNT -eq 2 && $EQUALITY == e[yn] ]] 
	then
		domain
	else
		echo
		echo "	Error in parameter count or parameter values."
		echo
		explain
	fi
else
	explain
fi
exit $?	
