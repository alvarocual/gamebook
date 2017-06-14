package es.ucm.fdi.iw.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import es.ucm.fdi.iw.model.Clan;
import es.ucm.fdi.iw.model.Event;
import es.ucm.fdi.iw.model.Game;
import es.ucm.fdi.iw.model.User;

@Controller	
public class RootController {
	
	private static Logger log = Logger.getLogger(RootController.class);
	
	@Autowired
	private EntityManager entityManager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;	
	
	//incluye ${s} en todas las páginas
	@ModelAttribute
	public void addAttributes(Model m) {
		m.addAttribute("s", "/static");
	}
	
	@GetMapping({"/", "/index"})
	public String root(Model model, Principal principal, HttpSession session) {
		if (principal != null) {
			log.info(principal.getName() + " de tipo " + principal.getClass());
			if (session.getAttribute("user") == null) {
				session.setAttribute("user", entityManager.createQuery(
						"from User where login = :login", User.class)
	                            .setParameter("login", principal.getName())
	                            .getSingleResult());
			}
		} else {
			log.info("Anonimo nos visita");
		}
				
		// org.springframework.security.core.userdetails.User
		return "index";
	}
	
	@GetMapping("/clans")
	@Transactional
	String rootClans(Model m) {
		List<Clan> clans = (List<Clan>)entityManager.createQuery("select c from Clan c").getResultList();
		TreeSet<Clan> byElo = new TreeSet<>(new Comparator<Clan>() {
			@Override
			public int compare(Clan o1, Clan o2) {
				int d = o2.getClanELO() - o1.getClanELO();
				return (d == 0) ? (int)(o1.getId() - o2.getId()) : d;
			}
		});
		byElo.addAll(clans);
        m.addAttribute("clans", byElo);
        return "clans";
	}
	
	@GetMapping("viewClan")
    @Transactional
    public String testViewClan(@RequestParam long id, Model m) {
        m.addAttribute("clan", entityManager.find(Clan.class, id));
        return "vclan";
    }
	
	@GetMapping("/vclan")
	String rootVClan() {
		return "vclan";
	}
	
	@RequestMapping(value = "/deleteU", method = RequestMethod.POST)
    @Transactional
    public String deleteU(@RequestParam long id) {
		
		User u = entityManager.find(User.class, id);
		
		entityManager.remove(u);
		
		for (Clan c: u.getClans()) {
			c.getMembers().remove(u);
		}
		
		for(Event e: u.getEvents()) {
			e.getMembers().remove(u);
		}
		
        return "index";
    }
	
	@RequestMapping(value = "/deleteE", method = RequestMethod.POST)
    @Transactional
    public String deleteE(@RequestParam long id) {
		
		Event e = entityManager.find(Event.class, id);
		
		entityManager.remove(e);
		
		for (Clan c: e.getClans()) {
			c.getEvents().remove(e);
		}
		
		for(User u: e.getMembers()) {
			u.getEvents().remove(e);
		}
		
        return "index";
    }
	
	@RequestMapping(value = "/deleteC", method = RequestMethod.POST)
    @Transactional
    public String deleteC(@RequestParam long id) {
		
		Clan c = entityManager.find(Clan.class, id);
		
		entityManager.remove(c);
		
		for (User u: c.getMembers()) {
			u.getClans().remove(c);
		}
		
		for(Event e: c.getEvents()) {
			e.getClans().remove(c);
		}
		
        return "index";
    }
	
	
	@RequestMapping(value = "/joinClan", method = RequestMethod.POST)
    @Transactional
    public String joinClan(@RequestParam long id, HttpSession session) {
		User u = (User)session.getAttribute("user"); // <- usuario "congelado" a partir de sesion
		u = entityManager.find(User.class, u.getId());     // <- consigue version "fresca"
		Clan c = entityManager.find(Clan.class, id);
		if (!u.getClans().contains(c)) {
			c.getMembers().add(u); // <- la parte importante
		}
		entityManager.persist(c);
		
        return "index"; // <- elige una vista mejor
    }
	
	@RequestMapping(value = "/joinEvent", method = RequestMethod.POST)
    @Transactional
    public String joinEvent(@RequestParam long id, HttpSession session) {
		User u = (User)session.getAttribute("user"); 
		u = entityManager.find(User.class, u.getId());     
		Event e = entityManager.find(Event.class, id);
		if (!u.getEvents().contains(e)) {
			int i = 0;
			if(!e.getClans().isEmpty() && !u.getClans().isEmpty()){ // No te vas a meter a un evento si el usuario o el evento no tiene clanes
				while (!u.getClans().contains(e.getClans().get(i))) {
					i++;
				}
			}
			if (i < e.getClans().size()) {
				u.getEvents().add(e);
			}
		}
		entityManager.persist(u);
		
        return "index"; 
    }
	
	@RequestMapping(value = "/leaveClan", method = RequestMethod.POST)
    @Transactional
    public String leaveClan(@RequestParam long id, HttpSession session) {
		User u = (User)session.getAttribute("user"); 
		u = entityManager.find(User.class, u.getId());     
		Clan c = entityManager.find(Clan.class, id);
		if (u.getClans().contains(c)) {
			c.getMembers().remove(u); 
		}
		entityManager.persist(c);
		
        return "index"; 
    }
	
	@RequestMapping(value = "/leaveEvent", method = RequestMethod.POST)
    @Transactional
    public String leaveEvent(@RequestParam long id, HttpSession session) {
		User u = (User)session.getAttribute("user"); 
		u = entityManager.find(User.class, u.getId());     
		Event e = entityManager.find(Event.class, id);
		if (u.getEvents().contains(e)) {
			u.getEvents().remove(e);
		}
		entityManager.persist(u);
		
        return "index"; 
    }
	
	@GetMapping("userRegister")
	public String userRegister() {
		return "userRegister";
	}
	
	@RequestMapping(value = "/userRegister", method = RequestMethod.POST)
	@Transactional
	public String userRegister(
			@RequestParam String login, 
			@RequestParam String password, Model m) {
		User u = new User();
		u.setLogin(login);
		u.setPassword(passwordEncoder.encode(password));
		u.setRoles("USER");
		u.setUserElo(1200);
        u.setClans(new ArrayList<Clan>());
        u.setEvents(new ArrayList<Event>());
        u.setGames(new ArrayList<Game>());
        entityManager.persist(u);
        
		return "index";
	}
	
	//Función para devolver la vista de un perfil de usuario concreto WIP
	@GetMapping("viewUser")
    @Transactional
    public String profileView(@RequestParam long id, Model m) {
        m.addAttribute("user", entityManager.find(User.class, id));
        return "vuser";
    }
	
	@GetMapping("/vuser")
	@Transactional
	String rootVUser(Model m) {
		return "vuser";
	}
	
	@GetMapping("viewEvent")
    @Transactional
    public String testViewEvent(@RequestParam long id, Model m) {
        m.addAttribute("event", entityManager.find(Event.class, id));
        return "vevent";
    }
	
	@GetMapping("/calendario")
	String rootCalendar(Model m) {
		List<Event> events = (List<Event>)entityManager.createQuery("select c from Event c").getResultList();
		StringBuilder jsonEvents = new StringBuilder("[");
		for (Event e : events) jsonEvents.append(e.getJson() + ",");
		m.addAttribute("events", jsonEvents.append("]").toString());
		return "calendario";
	}
	
	@GetMapping("/vevent")
	String rootVEvent() {
		return "vevent";
	}
	
	@GetMapping("/admin")
	String rootAdmin(Model m) {
		//Users
		List<User> users = (List<User>)entityManager.createQuery("select c from User c").getResultList();
        for (User c : users) {
            log.info("user " + c.getLogin());
        }
        m.addAttribute("users", users);
        
        //Clans
        List<Clan> clans = (List<Clan>)entityManager.createQuery("select c from Clan c").getResultList();
        for (Clan c : clans) {
            log.info("clan " + c.getClanName());
        }
        m.addAttribute("clans", clans);
        
        //Events
        List<Event> events = (List<Event>)entityManager.createQuery("select c from Event c").getResultList();
        for (Event c : events) {
            log.info("event " + c.getEventName());
        }
        m.addAttribute("events", events);
		return "admin";
	}
	
	
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}

	
	@GetMapping("/upload")
	public String upload() {
		return "upload";
	}
	
}
