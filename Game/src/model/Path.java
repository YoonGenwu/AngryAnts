/**
 * @author Paul Shen
 * 
 * The Path class represents the ordered collection of clicks a user performed on a video.
 */

package model;

import java.io.Serializable;
import java.util.LinkedList;

public class Path implements Serializable {

	private static final long serialVersionUID = -8642236431388978877L;
	private String name;
	private LinkedList<Click> path;
	private Ant assgAnt; 
	private String vName;
	
	/**
	 * Initializes the list of clicks.
	 * 
	 * @param start The ant that was assigned
	 * @param vName Associate path with a video by file name
	 */
	public Path(Ant assgAnt, String vName) {
		this.assgAnt = assgAnt;
		this.vName = vName;
		path = new LinkedList<Click>();
	}
	
	public Click getClick(int index) {
		return path.get(index);
	}
	
	public String getName() {
		return name;
	}
	
	/**
	 * @return The ordered collection of clicks that make up the path
	 */
	public LinkedList<Click> getPath() {
		return path;
	}
	
	public Ant getAnt() {
		return assgAnt;
	}
	
	public String getVideoName() {
		return vName;
	}
	
	public void addClick(Click click) {
		path.add(click);
	}
	
	public int size() {
		return path.size();
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void removeLast() {
		path.removeLast();
	}
}