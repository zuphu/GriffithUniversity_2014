import java.util.LinkedList;

/**
 * Write a description of class TreeNode here.
 * 
 * @author (your name)
 * @version (a version number or a date)
 */
public class TreeNode {
	private String name;
	private TreeNode parent;
	private LinkedList<TreeNode> children;
	private int pathCost;
	private boolean haveExplored = false;

	/**
	 * Constructor for objects of class TreeNode
	 */
	public TreeNode(String name, TreeNode parent, int pathCost) {
		// initialize instance variables
		this.name = name;
		this.parent = parent;
		this.pathCost = pathCost;
		this.children = new LinkedList<TreeNode>();
	}

	public TreeNode() {
		// TODO Auto-generated constructor stub
	}

	public void addChildren(TreeNode... nodes) {
		for (TreeNode node : nodes)
			children.add(node);
	}

	public LinkedList<TreeNode> getChildren() {
		if (children.isEmpty())
			return null;
		else
			return children;
	}

	public TreeNode getParent() {
		return parent;
	}

	public String getName() {
		return name;
	}

	public int getPathCost() {
		return pathCost;
	}

}