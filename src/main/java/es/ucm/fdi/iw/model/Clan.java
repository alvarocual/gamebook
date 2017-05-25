package es.ucm.fdi.iw.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Clan {

	private long id;
	private String clanName;
	private String clanDescription;
	private int clanELO;
	private List<User> members;
 	
 	
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

	public int getClanELO(){
		return this.clanELO;
	}
	
	public void setClanELO(int elo){
		this.clanELO = elo;
	}

}
