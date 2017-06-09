package es.ucm.fdi.iw.model;

import java.util.Date;
import java.util.List;

import javax.persistence.*;


@Entity
public class Event {

	private long id;
	private String eventName;
	private String eventDescription;
	private String ini;
	private String fin;
	private Game eventGame;
	private List<User> members;
	private List<Clan> clans;
	
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getEventName(){
		return this.eventName;
	}

	public void setEventName(String name){
		this.eventName = name;
	}
	
	public String getEventDescription(){
		return this.eventDescription;
	}

	public void setEventDescription(String desc){
		this.eventDescription = desc;
	}
	
	public String getIni(){
		return this.ini;
	}

	public void setIni(String ini){
		this.ini = ini;
	}
	
	public String getFin(){
		return this.fin;
	}

	public void setFin(String fin){
		this.fin = fin;
	}
	
	@ManyToOne(targetEntity=Game.class)
	public Game getEventGame() {
		return eventGame;
	}
	
	public void setEventGame(Game eventGame) {
		this.eventGame = eventGame;
	}
	
	@ManyToMany(targetEntity=User.class, mappedBy="events")
	public List<User> getMembers() {
		return members;
	}
	
	public void setMembers(List<User> members) {
		this.members = members;
	}
	
	@ManyToMany(targetEntity=Clan.class)
	public List<Clan> getClans() {
		return clans;
	}
	
	public void setClans(List<Clan> clans) {
		this.clans = clans;
	}
	
	@Transient
	public String getJson() {
		return "{ title: \"" + getEventName() + "\"" // <-- fixme inyeccion de JS!
				+ ",\n\t start: \"" + getIni()
				+ "\",\n\t end: \"" + getFin()
				+ "\",\n\t url: \"" + "????" // <-- fixme
				+ "}\n";
	}
}