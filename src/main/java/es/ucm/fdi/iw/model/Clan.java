package es.ucm.fdi.iw.model;

import java.util.List;

import javax.persistence.*;

@Entity
public class Clan {

	private long id;
	private String clanDescription;
	private int clanELO;
	private String clanName;
	private Game clanGame;
	private List<User> members;
	private List<Event> events;
 	
 	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
 	
 	public void setId(long id){
		this.id = id;
	}
	
	public String getClanName(){
		return this.clanName;
	}
	
	public void setClanName(String name){
		this.clanName = name;
	}

	public String getClanDescription(){
		return this.clanDescription;
	}
	
	public void setClanDescription(String desc){
		this.clanDescription = desc;
	}
	
	@ManyToOne(targetEntity=Game.class)
	public Game getClanGame() {
		return clanGame;
	}
	
	public void setClanGame(Game clanGame) {
		this.clanGame = clanGame;
	}

	public int getClanELO(){
		return this.clanELO;
	}
	
	public void setClanELO(int elo){
		this.clanELO = elo;
	}
	
	@ManyToMany(targetEntity=User.class)
	public List<User> getMembers() {
		return members;
	}
	
	public void setMembers(List<User> members) {
		this.members = members;
	}
	
	@Transient
	public void addMember(User memberID) {
		getMembers().add(memberID);
	}
	
	@Transient
	public int getMemberCount() {
		return members.size();
	}
	
	@Transient
	public int getEventsCount() {
		return events.size();
	}
	
	@ManyToMany(targetEntity=Event.class, mappedBy="clans")
	public List<Event> getEvents() {
		return events;
	}
	
	public void setEvents(List<Event> events) {
		this.events = events;
	}
}
