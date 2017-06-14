--INSERT INTO user(id,login,password,roles,user_elo)
INSERT INTO user VALUES (1, 'a', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER', 1200);
INSERT INTO user VALUES (2, 'b', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER,ADMIN', 1200);
INSERT INTO user VALUES (3, 'c', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER', 2300);
INSERT INTO user VALUES (4, 'd', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER', 5000);


--INSERT INTO game(id,description,name,price);
INSERT INTO game VALUES (1,'Fantasy MMO', 'World of Warcraft', 11.99);
INSERT INTO game VALUES (2,'CCG online', 'Hearthstone', 00.00);
INSERT INTO game VALUES (3,'Strategic', 'Starcraft II', 11.99);
INSERT INTO game VALUES (4,'MOBA', 'League of Legends', 11.99);
INSERT INTO game VALUES (5,'1v1 mobile game', 'Clash Royale', 11.99);
INSERT INTO game VALUES (6,'FPS', 'Call of Duty', 11.99);
INSERT INTO game VALUES (7,'Number 1 FPS', 'Counter Strike', 11.99);
INSERT INTO game VALUES (8,'It is tetris. You know tetris, right?', 'Tetris', 11.99);
INSERT INTO game VALUES (9,'El juego de las salchichas', 'Salchigame', 1.99);
INSERT INTO game VALUES (10,'Miau', 'Cats', 11.99);


--INSERT INTO event(id,description,name,ini,fin,game);
INSERT INTO event VALUES (1, 'Campeonato', 'Copa Pistón', '2017-04-09 19:00:00', '2017-04-09 16:00:00',3);
INSERT INTO event VALUES (2, 'Hearthstone a tope', 'Pelea de taberna', '2017-04-12 18:30:00', '2017-04-12 17:30:00',2);
INSERT INTO event VALUES (3, 'Mains Yasuo vs Mains Zed','1v1 me bro', '2017-04-13 10:00:00','2017-04-13 07:00:00',4);
INSERT INTO event VALUES (4, 'Insert coin','8-Bit championship', '2017-04-27 10:00:00','2017-04-25 07:00:00',8);
INSERT INTO event VALUES (5, 'Conquistaremos la tumba de Sdasfiwbort', 'Raid', '2017-04-25 10:00:00','2017-04-25 07:00:00',1);


--INSERT INTO clan(id,clanDescription,clanELO,clanName,game);
INSERT INTO clan VALUES (1,'Muchas salchichas',1200,'Salchicha',1);
INSERT INTO clan VALUES (2,'aouhdufodg',1200,'DSndfds',2);
INSERT INTO clan VALUES (3,'Este es el tercer clan',1200,'Tercer',3);
INSERT INTO clan VALUES (4,'Ya van 4, mae mia',1200,'444',4);
INSERT INTO clan VALUES (5,'Chachi',2200,'Clash Royale Clan',5);
INSERT INTO clan VALUES (6,'sdas',100,'XQ vida',6);
INSERT INTO clan VALUES (7,'Joe',1200,'Cats',7);
INSERT INTO clan VALUES (8,'Quiero ver el mundo arder',7000,'Loh putoh amoh',8);
INSERT INTO clan VALUES (9,'Thfsdaf',1200,'Pene xddd',9);
INSERT INTO clan VALUES (10,'Somos un clan serio',5100,'No tonterías',10);


--INSERT INTO user_games(member,game);
INSERT INTO user_games VALUES (1,1);
INSERT INTO user_games VALUES (1,2);
INSERT INTO user_games VALUES (1,3);
INSERT INTO user_games VALUES (1,4);
INSERT INTO user_games VALUES (1,5);


--INSERT INTO clan_members(clanID,memberID);
INSERT INTO clan_members VALUES (1,1);
INSERT INTO clan_members VALUES (1,2);
INSERT INTO clan_members VALUES (2,1);
INSERT INTO clan_members VALUES (2,4);
INSERT INTO clan_members VALUES (3,3);
INSERT INTO clan_members VALUES (4,4);
INSERT INTO clan_members VALUES (5,3);
INSERT INTO clan_members VALUES (6,4);
INSERT INTO clan_members VALUES (7,3);
INSERT INTO clan_members VALUES (8,3);
INSERT INTO clan_members VALUES (9,1);
INSERT INTO clan_members VALUES (10,2);


--INSERT INTO user_events(userID,eventID);
INSERT INTO user_events VALUES (4,2);
INSERT INTO user_events VALUES (3,3);
INSERT INTO user_events VALUES (3,1);


--INSERT INTO event_clans(eventID,clanID);
INSERT INTO event_clans VALUES (5,1);
INSERT INTO event_clans VALUES (4,2);
INSERT INTO event_clans VALUES (3,3);
INSERT INTO event_clans VALUES (2,4);
INSERT INTO event_clans VALUES (1,5);