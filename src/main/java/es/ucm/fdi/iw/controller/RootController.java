package es.ucm.fdi.iw.controller;

import java.security.Principal;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import es.ucm.fdi.iw.model.User;

@Controller	
public class RootController {
	
	private static Logger log = Logger.getLogger(RootController.class);
	
	@Autowired
	private EntityManager entityManager;
	
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
	
	@GetMapping("/otro")
	String rootOtro() {
		return "otro";
	}
	
	@GetMapping("/clans")
	String rootClans() {
		return "clans";
	}
	
	@GetMapping("/vclan")
	String rootVClan() {
		return "vclan";
	}
	
	@GetMapping("/vuser")
	String rootVUser() {
		return "vuser";
	}
	
	@GetMapping("/calendario")
	String rootCalendar() {
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
	
	
	//Esto está mal, pero no recuerdo cómo era
	//Se supone que es para el manejo de sesión con distintos perfiles
	//También hace falta un "logout" para borrar el perfil actual
	/*
	public String login (HttpSession session) {
		session.setAttribute("user", "user");
		
		return "login";
	}*/
}
