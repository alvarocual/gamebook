package es.ucm.fdi.iw.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


@Entity
public class User {

	private long id;
	private String login;
	private String password;
	private int userElo;
	private List<Game> userGames;
	private List<Clan> userClans;
	private List<Event> userEvents;
	private String roles; // split by , to separate roles
	
	
 	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
 	
 	public void setId(long id){
		this.id = id;
	}	

	@Column(unique=true)
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void setPassword(String pass){
		this.password = pass;
	}

	public int getUserElo(){
		return this.userElo;
	}
	
	public void setUserElo(int elo){
		this.userElo = elo;
	}


	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}
	
	@ManyToMany(targetEntity=Clan.class)
	public List<Clan> getClans() {
		return userClans;
	}
	
	public void setClans(List<Clan> clans) {
		this.userClans = clans;
	}
	
	@ManyToMany(targetEntity=Game.class)
	public List<Game> getGames() {
		return userGames;
	}
	
	public void setGames(List<Game> games) {
		this.userGames = games;
	}
	
	@ManyToMany(targetEntity=Event.class)
	public List<Event> getEvents() {
		return userEvents;
	}
	
	public void setEvents(List<Event> events) {
		this.userEvents = events;
	}
}





