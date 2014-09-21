#! /bin/bash

#################################################################################
#                        Propositional Carrier Domain                       	#
#################################################################################
#	Copyright (C) 2006 by M.A.Hakim Newton mahnewton@gmail.com					#
#	                                                                     		#
#	This program is free software; you can redistribute it and/or modify		#
#	it under the terms of the GNU General Public License as published by		#
#	the Free Software Foundation; either version 2 of the License, or     		#
#	(at your option) any later version.                                   		#
#	                                                                      		#
#	This program is distributed in the hope that it will be useful,       		#
#	but WITHOUT ANY WARRANTY; without even the implied warranty of        		#
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         		#
#	GNU General Public License for more details.                          		#
#	                                                                      		#
#	You should have received a copy of the GNU General Public License     		#
#	along with this program; if not, write to the                         		#
#	Free Software Foundation, Inc.,                                       		#
#	59 Temple room - Suite 330, Boston, MA  02111-1307, USA.             		#
#################################################################################

# carriers and rooms are constant for the domain; not problem objects

#	global variables
declare PROGRAM=$0	#	program name
declare -i COUNT=$#	#	parameter count
declare DOMAIN=$(basename $0 | sed -r s/\.[[:alnum:]_-]+$//)	# domain and file names are same
declare OPTION=$1	#	generate the domain (-d) or a problem (-p) or usage ()

#	global functions
declare -f explain
declare -f domain
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
	echo "	$PROGRAM -p #ball [#seed]"
	echo "		#ball	:	number of balls (>= 1)"
	echo "		#seed	:	optional seed for random number generation" 
	echo "Description:"
	echo "	> Balls from one room are to be taken to another and vice versa."
	echo "	> The robot has two arms to carry two balls at a time while moving."
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
	echo "		ball arm room"
	echo "	)"
	echo "	(:constants"
	echo "		left right - arm"
	echo "		rooma roomb - room"
	echo "	)"
	echo "	(:predicates"
	echo "		(free ?a - arm)"
	echo "		(robot-at ?r - room)"
	echo "		(ball-at ?b - ball ?r - room)"
	echo "		(holding ?a - arm ?b - ball)"
	echo "	)"
	echo "	(:action pick"
	echo "		:parameters (?b - ball ?a - arm ?r - room)"
	echo "		:precondition"
	echo "			(and"
	echo "				(ball-at ?b ?r)"
	echo "				(robot-at ?r)"
	echo "				(free ?a)"
	echo "			)"
	echo "		:effect"
	echo "			(and"
	echo "				(not (ball-at ?b ?r))"
	echo "				(not (free ?a))"
	echo "				(holding ?a ?b)"
	echo "			)"
	echo "	)"
	echo "	(:action drop"
	echo "		:parameters (?b - ball ?a - arm ?r - room)"
	echo "		:precondition"
	echo "			(and"
	echo "				(holding ?a ?b)"
	echo "				(robot-at ?r)"
	echo "			)"
	echo "		:effect"
	echo "			(and"
	echo "				(not (holding ?a ?b))"
	echo "				(ball-at ?b ?r)"
	echo "				(free ?a)"
	echo "			)"
	echo "	)"
	echo "	(:action move"
	echo "		:parameters (?f ?t - room)"
	echo "		:precondition"
	echo "			(and"
	echo "				(robot-at ?f)"
	if [[ -z $EQUALITY || $EQUALITY == "ey" ]]
	then
		echo "				(not (= ?fp ?tp))"
	fi
	echo "			)"
	echo "		:effect"
	echo "			(and"
	echo "				(not (robot-at ?f))"
	echo "				(robot-at ?t)"
	echo "			)"
	echo "	)"
	echo ")"
	echo
	return 0
}

function problem
{
	if (( SEED != 0 ))		#	if a seed is given, use it
	then
		RANDOM=$SEED
	fi
	echo
	echo "(define"
	echo "	(problem $DOMAIN-$BALL)"
	echo "	(:domain $DOMAIN)"
	echo "	(:objects"
	for (( i = 0; i < BALL; i++ ))
	do
		echo "		b$i"		#	ball
	done
	echo "			- ball"
	echo "	)"
	declare -a BALLroom
	for((k = 0; k < BALL; k++))
	do
		BALLroom[$k]=$RANDOM	# initially even for rooma and odd for roomb
					# in the goal just the opposite
	done	
	echo "	(:init"
	if (( BALLroom[k] % 2 == 0 ))
	then
		echo "		(robot-at rooma)"
	else
		echo "		(robot-at roomb)"
	fi
	echo "		(free left)"
	echo "		(free right)"
	for((k = 0; k < BALL; k++))
	do
		if (( BALLroom[k] % 2 == 0 ))
		then
			echo "		(ball-at b$k rooma)"
		else
			echo "		(ball-at b$k roomb)"
		fi
	done
	echo "	)"
	echo "	(:goal"
	echo "		(and"
	for((k = 0; k < BALL; k++))
	do
		if (( BALLroom[k] % 2 == 0 ))
		then
			echo "			(ball-at b$k roomb)"
		else
			echo "			(ball-at b$k rooma)"
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
	declare -i BALL=$2		#	number of balls
	declare -i SEED=$3		#	optional seed for random number generation
	if (( ($COUNT == 2 || $COUNT == 3) && $BALL >= 1)) 
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
