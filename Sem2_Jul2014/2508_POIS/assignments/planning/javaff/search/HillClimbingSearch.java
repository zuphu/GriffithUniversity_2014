package javaff.search;

import javaff.planning.State;
import javaff.planning.Filter;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.LinkedList;
import java.util.Comparator;
import java.math.BigDecimal;

import java.util.*;

public class HillClimbingSearch extends Search
{

 protected Hashtable closed;
 protected LinkedList open;
 protected Filter filter = null;
 public static int maxDepth;
 public static int probability;
 
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
 
 public void setmaxDepth(int max)
 {
 maxDepth = max;
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
     
   State s = start;
   open.add(s);
   int depth = 0;
   
   while (!open.isEmpty() && depth != maxDepth)
   {
     Set successors = s.getNextStates(filter.getActions(s));
     List<State> bestSuccessors = new ArrayList<State>();
     BigDecimal bestHvalue = s.getHValue();
     
     Iterator succItr = successors.iterator();
     probability = javaff.JavaFF.generator.nextInt(100);
       
     while (succItr.hasNext()) 
     {
       State succ = (State) succItr.next();
       
       if (needToVisit(succ)) 
       {
         if (succ.goalReached()) {      return succ;        }
       
         if (succ.getHValue().compareTo(bestHvalue) < 0) 
         {
           bestHvalue = succ.getHValue();
           bestSuccessors.clear();
           bestSuccessors.add(succ);

     break;
         }
         else if (succ.getHValue().compareTo(bestHvalue) == 0)
         {
           bestSuccessors.add(succ);
         }
       }
    }
       
       if (bestSuccessors.isEmpty())
       {
         open = new LinkedList();
       }
       else
       {
         if (probability < 50)
         {
           Collections.sort(bestSuccessors, new HValueComparator());
           Collections.reverse(bestSuccessors);
           open = new LinkedList();
           open.add(bestSuccessors.get(0));
           s = bestSuccessors.get(0);           
         }
         else
         {
           int r = javaff.JavaFF.generator.nextInt(bestSuccessors.size());
           open = new LinkedList();
           open.add(bestSuccessors.get(r));
           s = bestSuccessors.get(r);
         }
       }
    depth++;
     }
   return null;
 }
 
}