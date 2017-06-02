package es.ucm.fdi.iw.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


@Entity
public class Event {

	private long id;
	private String eventName;
	private String eventDescription;
	private Date date;
	private List<User> members;
	
	
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
	
	public Date date(){
		return this.date;
	}

	public void setDate(Date date){
		this.date = date;
	}
	
	@ManyToMany(targetEntity=User.class, mappedBy="login")
	public List<User> getMembers() {
		return members;
	}
	
	public void setMembers(List<User> members) {
		this.members = members;
	}

}