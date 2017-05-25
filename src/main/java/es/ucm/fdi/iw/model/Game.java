package es.ucm.fdi.iw.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


@Entity
public class Game {

	private long id;
	private String gameName;
	private String gameDescription;
	private double price;
	
	
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
}

