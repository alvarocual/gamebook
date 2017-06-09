<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Ahora sí</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/main.css" />">
</head>
<body>
	<%@ include file="../jspf/header.jspf" %>
	<ww>Esto es OTRA página de prueba.</ww>
</body>
</html>

<!--  private User createUser(String login, String pass, int elo) {
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
    
    
    
    @GetMapping("joinClan")
    @Transactional
    @ResponseBody
    public String testAdd() {

        User u1 = createUser("x1",
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
    }-->