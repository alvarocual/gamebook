package es.ucm.fdi.iw.controller;

import es.ucm.fdi.iw.model.Clan;
import es.ucm.fdi.iw.model.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mfreire on 2/06/17.
 */
@Controller
@RequestMapping("clans/")
public class ClansController {

    @ModelAttribute
    public void addAttributes(Model m) {
        m.addAttribute("s", "/static");
    }


    private static Logger log = Logger.getLogger(RootController.class);

    @Autowired
    private EntityManager entityManager;

    private User createUser(String login, String pass, int elo) {
        User u = new User();
        u.setLogin(login);
        u.setPassword(pass);
        u.setRoles("USER");
        u.setUserElo(elo);
        u.setClans(new ArrayList<Clan>());
        entityManager.persist(u);
        return u;
    }

    @GetMapping("add")
    @Transactional
    @ResponseBody
    public String testAdd() {

        User u1 = createUser("x1",
                "$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO",
                2024);
        User u2 = createUser("x2",
                "$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO",
                2024);
        User u3 = createUser("x3",
                "$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO",
                2024);
        entityManager.flush();

        Clan c = new Clan();
        c.setClanName("los x");
        c.setClanDescription("Semos los x");
        entityManager.persist(c);

        u1.getClans().add(c);
        u2.getClans().add(c);
        u3.getClans().add(c);

        return "ok";
    }

    @GetMapping("list")
    @Transactional
    public String testList(Model m) {
        List<Clan> clans = (List<Clan>)entityManager.createQuery("select c from Clan c").getResultList();
        for (Clan c : clans) {
            log.info("clan " + c.getClanName() + " " + c.getMembers().size());
        }
        m.addAttribute("clans", clans);
        return "clans";
    }

    @GetMapping("view")
    @Transactional
    public String testView(@RequestParam long id, Model m) {
        m.addAttribute("clan", entityManager.find(Clan.class, id));
        return "vclan";
    }
}
