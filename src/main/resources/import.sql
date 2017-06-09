--INSERT INTO user(id,login,password,roles,user_elo)
INSERT INTO user VALUES (1, 'a', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER', 1200);
INSERT INTO user VALUES (2, 'b', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER,ADMIN', 1200);
INSERT INTO user VALUES (3, 'c', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER', 2300);
INSERT INTO user VALUES (4, 'd', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER', 5000);
INSERT INTO user VALUES (5, 'e', '$2a$04$w9hNQY4WhDNcDVeZ5rVdpO6vhdGuOuU/Fs2B0QOopNRrzuH7wR9XO', 'USER,ADMIN', 1200);


--INSERT INTO clan(id,clanDescription,clanELO,clanGame,clanName);
INSERT INTO clan VALUES (1,'Muchas salchichas',1200,'Salchigame','Salchicha');
INSERT INTO clan VALUES (2,'aouhdufodg',1200,'Counter Strike','DSndfds');
INSERT INTO clan VALUES (3,'Este es el tercer clan',1200,'Starcraft II','Tercer');
INSERT INTO clan VALUES (4,'Ya van 4, mae mia',1200,'Tetris','444');
INSERT INTO clan VALUES (5,'Chachi',2200,'Clash Royale', 'Clash Royale Clan');
INSERT INTO clan VALUES (6,'sdas',100,'Hearthstone', 'XQ vida');
INSERT INTO clan VALUES (7,'Joe',1200,'Cats','Cats');
INSERT INTO clan VALUES (8,'Quiero ver el mundo arder',7000,'League of Legends', 'Loh putoh amoh');
INSERT INTO clan VALUES (9,'Thfsdaf',1200,'Tetris','Pene xddd');
INSERT INTO clan VALUES (10,'Somos un clan serio',5100,'Starcraft II', 'No tonterías');
INSERT INTO clan VALUES (11,'Mucho texto bla bla bla',1700,'Clash Royale','^^');
INSERT INTO clan VALUES (12,'Este no es el tercer clan',1200,'Counter Strike','No-Tercer');
INSERT INTO clan VALUES (13,'Las ratas molan',10,'Call of Duty','Rat power');
INSERT INTO clan VALUES (14,'Buscamos nuevos miembros. Solo diamantes o más',7200,'League of Legends','Royal Army');
INSERT INTO clan VALUES (15,'Buscamos amijos',1000,'World of Warcraft', 'Amiguis 4evah');
INSERT INTO clan VALUES (16,'Nosotros no sembramos',4000,'World of Warcraft','Greyjoy');

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
INSERT INTO event VALUES (1, 'Campeonato', 'Copa Pistón', '2017-04-09 16:00:00','2017-04-09 19:00:00',3);
INSERT INTO event VALUES (2, 'Hearthstone a tope', 'Pelea de taberna', '2017-04-12 17:30:00','2017-04-12 18:30:00',2);
INSERT INTO event VALUES (3, 'Mains Yasuo vs Mains Zed','1v1 me bro', '2017-04-13 07:00:00','2017-04-13 10:00:00',4);
INSERT INTO event VALUES (4, 'Insert coin','8-Bit championship', '2017-04-25 07:00:00','2017-04-27 10:00:00',8);
INSERT INTO event VALUES (5, 'Conquistaremos la tumba de Sdasfiwbort', 'Raid',  '2017-04-25 07:00:00','2017-04-25 10:00:00',1);


--INSERT INTO user_games(member,game);
INSERT INTO user_games VALUES (1,1);
INSERT INTO user_games VALUES (1,2);
INSERT INTO user_games VALUES (1,3);
INSERT INTO user_games VALUES (1,4);
INSERT INTO user_games VALUES (1,5);


--INSERT INTO clan_members(clanID,memberID);
INSERT INTO clan_members VALUES (1,1);
INSERT INTO clan_members VALUES (1,2);
INSERT INTO clan_members VALUES (1,3);
INSERT INTO clan_members VALUES (1,4);
INSERT INTO clan_members VALUES (1,5);
INSERT INTO clan_members VALUES (2,1);
INSERT INTO clan_members VALUES (3,1);
INSERT INTO clan_members VALUES (4,1);
INSERT INTO clan_members VALUES (5,1);
INSERT INTO clan_members VALUES (6,2);
INSERT INTO clan_members VALUES (6,3);


--INSERT INTO user_events(userID,eventID);
INSERT INTO user_events VALUES (1,1);
INSERT INTO user_events VALUES (1,2);
INSERT INTO user_events VALUES (1,3);
INSERT INTO user_events VALUES (1,4);
INSERT INTO user_events VALUES (1,5);


--INSERT INTO event_clans(eventID,clanID);
INSERT INTO event_clans VALUES (1,1);
INSERT INTO event_clans VALUES (1,2);
INSERT INTO event_clans VALUES (1,3);
INSERT INTO event_clans VALUES (1,4);
INSERT INTO event_clans VALUES (1,5);