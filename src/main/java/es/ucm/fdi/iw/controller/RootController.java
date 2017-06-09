package es.ucm.fdi.iw.controller;

import java.security.Principal;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import es.ucm.fdi.iw.model.Clan;
import es.ucm.fdi.iw.model.Event;

/* API Steam
import com.github.koraktor.steamcondenser.exceptions.SteamCondenserException;
import com.github.koraktor.steamcondenser.steam.community.GameStats;
import com.github.koraktor.steamcondenser.steam.community.SteamId;
*/

import es.ucm.fdi.iw.model.User;

@Controller	
public class RootController {
	
	private static Logger log = Logger.getLogger(RootController.class);
	
	@Autowired
	private EntityManager entityManager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	// ejemplo de uso: https://github.com/manuel-freire/iw-base/blob/master/src/main/java/es/ucm/fdi/iw/controller/AdminController.java#L62


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
		
		/* STEAM
		String info = null;
		try {
			SteamId id = SteamId.create("demomenz");
			GameStats stats = id.getGameStats("tf2");
			info = "" + stats.getAchievements();
		} catch (SteamCondenserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("steamInfo", info);
		*/
		
		
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
		List<Event> events = (List<Event>)entityManager.createQuery("select c from Event c").getResultList();
        for (Event c : events) {
            log.info("event " + c.getEventName() + " " + c.getEventGame() + " " + c.getMembers().size());
        }
        m.addAttribute("events", events);
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
	String rootAdmin() {
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
