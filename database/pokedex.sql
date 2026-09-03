use dbPokedex;

create table pokemon(
pokemon_id int auto_increment primary key,
nome varchar(50),
altura decimal(4,2),
peso decimal(5,1),
descricao text,
imagem varchar(255)
);
INSERT INTO pokemon VALUES(1, "Treecko", 0.50, 5.0, "Possui pequenos ganchos na sola dos pés que o permitem andar em paredes e tetos. Ataca batendo sua cauda forte.");
INSERT INTO pokemon VALUES(2, "Grovyle", 0.90, 21.6, "As folhas que crescem em seu corpo são uma ótima camuflagem na floresta. É um mestre em saltar de galho em galho.");
INSERT INTO pokemon VALUES(3, "Sceptile", 1.70, 52.2, "As folhas em seus braços são afiadas como espadas. Ele se move agilmente pelas árvores para fatiar seus inimigos.");
INSERT INTO pokemon VALUES(4, "Torchic", 0.40, 2.5, "Dentro de seu corpo há um lugar onde o fogo queima. Se você o abraçar, sentirá um calor muito aconchegante.");
INSERT INTO pokemon VALUES(5, "Combusken", 0.90, 19.5, "Treina suas pernas correndo por campos e montanhas. Suas pernas possuem velocidade e poder destrutivo impressionantes.");
INSERT INTO pokemon VALUES(6, "Blaziken", 1.90, 52.0, "Em combate, sopra chamas intensas de seus pulsos e ataca o inimigo com coragem. Suas pernas podem saltar prédios.");
INSERT INTO pokemon VALUES(7, "Mudkip", 0.40, 7.6, "A barbatana em sua cabeça funciona como um radar altamente sensível, permitindo que sinta o movimento da água e do ar.");
INSERT INTO pokemon VALUES(8, "Marshtomp", 0.70, 28.0, "Seu corpo é coberto por uma película fina que evita a desidratação. Ele se move muito mais rápido na lama do que na terra.");
INSERT INTO pokemon VALUES(9, "Swampert", 1.50, 81.9, "Tem uma força física impressionante, sendo capaz de arrastar pedregulhos de mais de uma tonelada com facilidade.");
INSERT INTO pokemon VALUES(10, "Poochyena", 0.50, 13.6, "Tem uma natureza persistente. Persegue sua presa até que ela fique exausta, mas pode fugir se a presa contra-atacar.");
INSERT INTO pokemon VALUES(11, "Mightyena", 1.00, 37.0, "Vive em matilhas na natureza. Sempre obedece aos comandos de um treinador experiente que ele reconheça como líder.");
insert into pokemon values(012, "Zigzagoon", 0.41, 17.5, "Sempre se movendo para frente e pra trás esfregando o nariz contra o chão em busca de algo. é facil identificar pelas pegadas em zigzag que deixa.");

select * from pokemon;