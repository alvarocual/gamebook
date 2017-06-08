package es.ucm.fdi.iw.model;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;


@Entity
public class Game {

	private long id;
	private String gameName;
	private String gameDescription;
	private double price;
	private List<User> gameUsers;
	private List<Event> gameEvents;
	
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getGameName(){
		return this.gameName;
	}

	public void setGameName(String name){
		this.gameName = name;
	}
	
	public String getGameDescription(){
		return this.gameDescription;
	}

	public void setGameDescription(String desc){
		this.gameDescription = desc;
	}
	
	public double getPrice(){
		return this.price;
	}

	public void setPrice(double price){
		this.price = price;
	}
	
	@ManyToMany(targetEntity=User.class, mappedBy="games")
	public List<User> getMembers() {
		return gameUsers;
	}
	
	public void setMembers(List<User> users) {
		this.gameUsers = users;
	}
	
	@OneToMany(targetEntity=Event.class)
	@JoinColumn(name="id") // <-- this avoids creating an extra User_Book table
	public List<Event> getGameEvents() {
		return gameEvents;
	}
	public void setGameEvents(List<Event> gameEvents) {
		this.gameEvents = gameEvents;
	}
}

