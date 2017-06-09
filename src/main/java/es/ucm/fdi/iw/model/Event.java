package es.ucm.fdi.iw.model;

import java.util.List;

import javax.persistence.*;

import org.apache.commons.lang3.StringEscapeUtils;


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
	
	
	//La función escapeEcmaScript sirve para escapar los caracteres del
	//nombre, la fecha de inicio y la fecha de fin de los eventos.
	//De esta forma evitamos vulnerabilidades por inyección de JS.
	@Transient
	public String getJson() {
		return "{ title: \"" + StringEscapeUtils.escapeEcmaScript(getEventName()) + "\""
				+ ",\n\t start: \"" + StringEscapeUtils.escapeEcmaScript(getIni())
				+ "\",\n\t end: \"" + StringEscapeUtils.escapeEcmaScript(getFin())
				+ "\",\n\t url: \"" + "/viewEvent?id=" + getId()
				+ "\"}\n";
	}
}