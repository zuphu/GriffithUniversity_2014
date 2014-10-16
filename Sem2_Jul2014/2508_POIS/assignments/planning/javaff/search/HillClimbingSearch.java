/************************************************************************
 * Strathclyde Planning Group,
 * Department of Computer and Information Sciences,
 * University of Strathclyde, Glasgow, UK
 * http://planning.cis.strath.ac.uk/
 * 
 * Copyright 2007, Keith Halsey
 * Copyright 2008, Andrew Coles and Amanda Smith
 *
 * (Questions/bug reports now to be sent to Andrew Coles)
 *
 * This file is part of JavaFF.
 * 
 * JavaFF is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 * 
 * JavaFF is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with JavaFF.  If not, see <http://www.gnu.org/licenses/>.
 * 
 ************************************************************************/

package javaff.search;

import javaff.planning.State;
import javaff.planning.Filter;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.LinkedList;
import java.util.Comparator;
import java.math.BigDecimal;
import java.util.Hashtable;
import java.util.Iterator;

public class HillClimbingSearch extends Search
{
	protected BigDecimal bestHValue;

	protected Hashtable closed;
	protected LinkedList open;
	protected Filter filter = null;
	
	public HillClimbingSearch(State s)
	{
		this(s, new HValueComparator());
	}

	public HillClimbingSearch(State s, Comparator c)
	{
		super(s);
		setComparator(c);
		
		closed = new Hashtable();
		open = new LinkedList();
	}

	public void setFilter(Filter f)
	{
		filter = f;
	}

	public State removeNext()
	{
			
		return (State) ((LinkedList) open).removeFirst();
	}
	
	public boolean needToVisit(State s) {
		Integer Shash = new Integer(s.hashCode()); // compute hash for state
		State D = (State) closed.get(Shash); // see if its on the closed list
		
		if (closed.containsKey(Shash) && D.equals(s)) return false;  // if it is return false
		
		closed.put(Shash, s); // otherwise put it on
		return true; // and return true
	}
	public State search() {
		   
		   if (start.goalReached()) {  return start;  }
		     
		   needToVisit(start); // dummy call (adds start to the list of 'closed' states so we don't visit it again
		   
		   State s = start;
		   open.add(s);
		   
		   System.out.println("1");
		   while (!open.isEmpty())
		   {
		   System.out.println("2");
		     Set successors = s.getNextStates(filter.getActions(s));
		     List<State> bestSuccessors = new ArrayList<State>();
		     BigDecimal bestHvalue = s.getHValue();
		     
		     Iterator succItr = successors.iterator();
		       
		     while (succItr.hasNext()) 
		     {
		       System.out.println("3");
		       State succ = (State) succItr.next();
		       
		       if (needToVisit(succ)) 
		       {
		    	   System.out.println("4");
		         if (succ.goalReached()) {      
		    	   System.out.println("5");
		        	 return succ;
		         }
		       
		         if (succ.getHValue().compareTo(bestHvalue) < 0) {
		    	   System.out.println("6");
		           System.out.println("DUDE");
		           bestHvalue = succ.getHValue();
		           bestSuccessors.clear();
		           bestSuccessors.add(succ);
		         }
		         else if (succ.getHValue().compareTo(bestHvalue) == 0) {
		    	   System.out.println("7");
		           bestSuccessors.add(succ);
		         }
		       }
			   }
		       
		       if (bestSuccessors.isEmpty())
		       {
		    	   System.out.println("8");
		         open = new LinkedList();
		       }
		       else
		       {
		         int r = javaff.JavaFF.generator.nextInt(bestSuccessors.size());
		         open = new LinkedList();
		         open.add(bestSuccessors.get(r));
		       }
		     }
		   return null;
		 }
	
}
