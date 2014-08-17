import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Stack;
import java.util.Comparator;

/**
 * Write a description of class TreeSearch here.
 * 
 * @author (your name)
 * @version (a version number or a date)
 */
public class TreeSearch {
	private static TreeNode tree;
	private static Queue<TreeNode> frontier;
	private static Stack<TreeNode> stackFrontier;
	/**
	 * Constructor for objects of class TreeSearch
	 */

	public static void createTree() {
		tree = new TreeNode();
		TreeNode a   = new TreeNode("A", null, 0);
		TreeNode a2b = new TreeNode("B", a, 2);
		TreeNode a2c = new TreeNode("C", a, 9);
		TreeNode a2d = new TreeNode("D", a, 3);
		
		TreeNode b   = new TreeNode("B", null, 2);
		TreeNode b2a = new TreeNode("A", b, 2);
		TreeNode b2d = new TreeNode("D", b, 2);
		TreeNode b2c = new TreeNode("C", b, 6);
	 	
		TreeNode c   = new TreeNode("C", null, 0);
		TreeNode c2a = new TreeNode("A", c, 9);
		TreeNode c2b = new TreeNode("B", c, 6);
		TreeNode c2d = new TreeNode("D", c, 7);
		TreeNode c2f = new TreeNode("F", c, 3);
		TreeNode c2g = new TreeNode("G", c, 6);
		
		TreeNode d   = new TreeNode("D", null, 0);
		TreeNode d2a = new TreeNode("A", d, 3);
		TreeNode d2b = new TreeNode("B", d, 2);
		TreeNode d2c = new TreeNode("C", d, 7);
		TreeNode d2e = new TreeNode("E", d, 4);
		
		TreeNode e   = new TreeNode("E", null, 0);
		TreeNode e2d = new TreeNode("D", c, 4);
		TreeNode e2f = new TreeNode("F", c, 7);
		TreeNode e2g = new TreeNode("G", c, 3);
		TreeNode e2h = new TreeNode("H", c, 2);
		
		TreeNode f   = new TreeNode("F", null, 0);
		TreeNode f2e = new TreeNode("E", f, 7);
		TreeNode f2c = new TreeNode("C", f, 2);

		TreeNode g   = new TreeNode("G", null, 0);
		TreeNode g2e = new TreeNode("E", g, 3);
		TreeNode g2c = new TreeNode("C", g, 3);
		
		TreeNode h = new TreeNode("H", null, 0);
		TreeNode h2e = new TreeNode("E", e, 2);

		// Continue to build the tree here ...
		a.addChildren(a2b, a2c, a2d);
		a2b.addChildren(b2a, b2d, b2c); a2c.addChildren(c2a, c2b, c2d, c2f, c2g); a2d.addChildren(d2a, d2b, d2c, d2e);
		b.addChildren(b2a, b2d, b2c);
		b2a.addChildren(b2a, b2c, b2d); b2d.addChildren(d2a, d2b, d2c, d2e); b2c.addChildren(c2a, c2b, c2d, c2f, c2g);
		c.addChildren(c2a, c2b, c2d, c2f, c2g);
		c2a.addChildren(a2b, a2c, a2d); c2b.addChildren(b2a, b2c, b2d); c2d.addChildren(d2a, d2b, d2c, d2e); c2f.addChildren(f2c, f2e); c2g.addChildren(g2c, g2e);
		d.addChildren(d2a, d2b, d2c, d2e);
		d2a.addChildren(a2b, a2c, a2d); d2b.addChildren(b2a, b2c, b2d); d2c.addChildren(c2a, c2b, c2d, c2f, c2g); d2e.addChildren(e2d, e2f, e2g, e2h);
		e.addChildren(e2d, e2h, e2g, e2f); 
		e2d.addChildren(d2a , d2b, d2c, d2e); e2h.addChildren(h2e); e2g.addChildren(g2c, g2e); e2f.addChildren(f2c, f2e);
		f.addChildren(f2c, f2e);
		f2c.addChildren(c2a, c2b, c2d, c2f, c2g); f2e.addChildren(e2d, e2f, e2g);
		g.addChildren(g2e, g2c);
		g2e.addChildren(e2d, e2f, e2g, e2h);
		h.addChildren(h2e);
		h2e.addChildren(e2d, e2f, e2g, e2h);
		tree = a;
	}

	public static void BFS(TreeNode root) {
		frontier = new LinkedList<TreeNode>();
		ArrayList<TreeNode> closedList = new ArrayList<TreeNode>();
		ArrayList<TreeNode> openList = new ArrayList<TreeNode>();
		HashMap<String, TreeNode> explored = new HashMap<String, TreeNode>();
		
		if (root.getName() == "G") {
			System.out.println("Solution has been found in root node.");
		}

		// Initialize the frontier with the root node
		frontier.add(root);

		TreeNode goal = null;
		// Expand the head of the list until there are no more elements in the
		// list or a solution is found
		do {
			TreeNode parent = frontier.remove();
			if ( !explored.containsKey ( parent.getName() ) ) {
                explored.put(parent.getName(), parent);
                closedList.add(parent);
                System.out.print("Closed list:\t");

                for (TreeNode tn:closedList){
                        System.out.print("[" + tn.getName() + "]");
                } System.out.print("\n");

                if (parent.getName() == "G") {
                        goal = parent;
                        continue;
                }
                
                LinkedList<TreeNode> children = parent.getChildren();

                System.out.println(parent.getName());
                for (TreeNode tn:children) {
                        openList.add(tn);
                        frontier.add(tn);
                }
                
                System.out.print("Open List:\t");
                for (TreeNode tn:openList) {
                        System.out.print("{" + tn.getName() + "}");
                }
                System.out.print("\n");
			}
				

		} while (goal == null && !frontier.isEmpty());

		if (goal != null && goal.getParent() != null) {
			System.out.println( "The solution has been found at " + goal.getName() );
		} else
			System.out.print("No solution found!");
		return;
	}
	
	public static void DFS(TreeNode root) {
		stackFrontier = new Stack<TreeNode>();
		ArrayList<TreeNode> closedList = new ArrayList<TreeNode>();
		HashMap<String, TreeNode> explored = new HashMap<String, TreeNode>();
		
		if (root.getName() == "G") {
			System.out.println("Solution has been found in root node.");
		}

		// Initialize the frontier with the root node
		stackFrontier.add(root);

		TreeNode goal = null;
		// Expand the head of the list until there are no more elements in the
		// list or a solution is found
		do {
			TreeNode parent = stackFrontier.pop();
            if (!explored.containsKey(parent.getName()))
            {
            	closedList.add(parent);
                explored.put(parent.getName(), parent);
            }

            System.out.print("Closed list:\t");

            for (TreeNode tn:closedList){
                    System.out.print("[" + tn.getName() + "]");
            } System.out.print("\n");

            LinkedList<TreeNode> children = parent.getChildren();

            for (TreeNode tn:children)
                    System.out.println(tn.getName());

            if (parent.getName() == "G") {
                    goal = parent;
                    continue;
            }

            boolean hasChild = false;
            for (TreeNode tn:children) {
            	if ( !explored.containsKey(tn.getName() ) ) {
            		stackFrontier.add(tn);
            		hasChild = true;
            		break;
            	}
            }

            if ( explored.containsKey( parent.getName() ) && !hasChild ) {
                stackFrontier.add(parent.getParent());
            }

		} while (goal == null && !stackFrontier.isEmpty());

		if (goal != null && goal.getParent() != null) {
			System.out.println( "The solution has been found at " + goal.getName() );
		} else
			System.out.print("No solution found!");
		return;
	}
	
	public static void UCS(TreeNode root) {
		frontier = new LinkedList<TreeNode>();
		ArrayList<TreeNode> closedList = new ArrayList<TreeNode>();
		ArrayList<TreeNode> openList = new ArrayList<TreeNode>();
     	Comparator<TreeNode> comparator = new PathCostComparator();
		HashMap<String, TreeNode> explored = new HashMap<String, TreeNode>();
     	PriorityQueue<TreeNode> queue = new PriorityQueue<TreeNode>(100, comparator);
		
		if (root.getName() == "G") {
			System.out.println("Solution has been found in root node.");
		}

		// Initialize the frontier with the root node
		queue.add(root);

		TreeNode goal = null;
		// Expand the head of the list until there are no more elements in the
		// list or a solution is found
		do {
			if (queue.isEmpty()) {
				System.out.println("Queue is empty!");
				try {
					Thread.sleep(4000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				continue;
			}

			TreeNode parent = queue.remove();
			if ( !explored.containsKey ( parent.getName() ) ) {
                explored.put(parent.getName(), parent);
                closedList.add(parent);
                System.out.print("Closed list:\t");

                for (TreeNode tn:closedList){
                        System.out.print("[" + tn.getName() + "]");
                        System.out.print(tn.getPathCost());
                } System.out.print("\n");

                if (parent.getName() == "G") {
                        goal = parent;
                        continue;
                }
                
                LinkedList<TreeNode> children = parent.getChildren();

                System.out.println(parent.getName());
               	System.out.print("Children:");
                for (TreeNode tn:children) {
                	System.out.print(tn.getName());
                        openList.add(tn);
                        if ( !explored.containsKey( tn.getName() ) )
                        {
                        	queue.add(tn);
                        }
                        else if ( explored.containsKey( tn.getName() ) && 
                        		  explored.get(tn.getName()).getPathCost() > tn.getPathCost() ) {
                        	explored.remove(tn.getName());
                        	explored.put(tn.getName(), tn);
                        }
                        
                }
               System.out.println("\n");
               
               System.out.print("Queue:");
               for (TreeNode tn:queue)
               {
            	   System.out.print(tn.getName() + "(" + tn.getPathCost() + ") ");
               }
               System.out.println("\n");
                
                System.out.print("Open List:\t");
                for (TreeNode tn:openList) {
                        System.out.print("{" + tn.getName() + "}");
                        System.out.print(tn.getPathCost());
                }
                System.out.print("\n");
			}
				

		} while (goal == null && !queue.isEmpty());

		if (goal != null && goal.getParent() != null) {
			System.out.println( "The solution has been found at " + goal.getName() );
		} else
			System.out.print("No solution found!");
		return;
	}
	
	
	public static void main(String[] args) throws Exception {
		createTree();
		BFS(tree);
		DFS(tree);
		UCS(tree);

		return;
	}
}

class PathCostComparator implements Comparator<TreeNode>
{
    @Override
    public int compare(TreeNode x, TreeNode y)
    {
        // Assume neither string is null. Real code should
        // probably be more robust
        // You could also just return x.length() - y.length(),
        // which would be more efficient.
        if (x.getPathCost() < y.getPathCost())
            return -1;
        if (x.getPathCost() > y.getPathCost())
            return 1;
        return 0;
    }
}	