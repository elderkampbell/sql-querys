DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.Planos(
  plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	plano CHAR(25) NOT NULL,
	valor_plano DECIMAL(6, 2)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Planos (plano, valor_plano)
  VALUES
    ('gratuito', '0.00'),
    ('pessoal', '6.99'),
    ('familiar', '7.99'),
    ('universitário', '5.99');

  CREATE TABLE SpotifyClone.Artistas(
	artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artista CHAR(255) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Artistas (artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  CREATE TABLE SpotifyClone.Albuns(
	artista_id INTEGER,
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album CHAR(255),
    ano_lancamento YEAR,
		FOREIGN KEY (artista_id) REFERENCES Artistas (artista_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Albuns (artista_id, album, ano_lancamento)
  VALUES
    ('1', 'Renaissance', '2022'),
    ('2', 'Hot Space', '1978'),
    ('2', 'Jazz', '1982'),
	  ('3', 'Falso Brilhante', '1998'),
    ('3', 'Vento de Maio', '2001'),
    ('4', 'QVVJFA?', '2003'),
    ('5', 'Somewhere Far Beyond', '2007'),
    ('6', 'I Put A Spell On You', '2012');

  CREATE TABLE SpotifyClone.Usuarios(
	usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	usuario VARCHAR(100) NOT NULL,
	idade INT NOT NULL,
	data_assinatura DATE,
  plano_id INTEGER,
		FOREIGN KEY (plano_id) REFERENCES Planos(plano_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Usuarios (usuario, idade, data_assinatura, plano_id)
  VALUES
    ('Ada Lovelace', '37', '2017-12-30', '3'),
    ('Barbara Liskov', '82', '2019-10-20', '1'),
    ('Bell Hooks', '26', '2018-01-05', '4'),
    ('Christopher Alexander', '85', '2019-06-05', '2'),
    ('Robert Cecil Martin', '58', '2017-01-06', '1'),
    ('Martin Fowler', '46', '2017-01-17', '3'),
    ('Sandi Metz', '58', '2018-04-29', '3'),
    ('Paulo Freire', '19', '2018-02-14', '4'),
    ('Judith Butler', '45', '2020-05-13', '2'),
    ('Jorge Amado', '58', '2017-02-17', '2');

  CREATE TABLE SpotifyClone.cancoes(
	  album_id INTEGER,
	  cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cancao TEXT(200) NOT NULL,
    duracao_segundos INT,
		FOREIGN KEY (album_id) REFERENCES Albuns (album_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.cancoes (album_id, cancao, duracao_segundos)
  VALUES
	  ('1', 'BREAK MY SOUL', '279'),
    ('1', 'VIRGO’S GROOVE', '369'),
    ('1', 'ALIEN SUPERSTAR', '116'),
    ('2', 'Don’t Stop Me Now', '203'),
    ('3', 'Under Pressure', '152'),
    ('4', 'Como Nossos Pais', '105'),
    ('5', 'O Medo de Amar é o Medo de Ser Livre', '207'),
    ('6', 'Samba em Paris', '267'),
    ('7', 'The Bard’s Song', '244'),
    ('8', 'Feeling Good', '100');

  CREATE TABLE SpotifyClone.historico(
	usuario_id INTEGER,
	data_reproducao DATETIME,
	historico_de_reproducoes INTEGER,
	CONSTRAINT PRIMARY KEY(usuario_id, historico_de_reproducoes),
		FOREIGN KEY (usuario_id) REFERENCES Usuarios (usuario_id),
        FOREIGN KEY (historico_de_reproducoes) REFERENCES cancoes (cancao_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.historico (usuario_id, data_reproducao, historico_de_reproducoes)
  VALUES
    ('1', '2022-02-28 10:45:55', 8),
    ('1', '2020-05-02 05:30:35', 2),
	  ('1', '2020-03-06 11:22:33', 10),
    ('2', '2022-08-05 08:05:17', 10),
    ('2', '2020-01-02 07:40:33', 7),
    ('3', '2020-11-13 16:55:13', 10),
    ('3', '2020-12-05 18:38:30', 2),
    ('4', '2021-08-15 17:10:10', 8),
    ('5', '2022-01-09 01:44:33', 8),
    ('5', '2020-08-06 15:23:43', 5),
    ('6', '2017-01-24 00:31:17', 7),
    ('6', '2017-10-12 12:35:20', 1),
    ('7', '2011-12-15 22:30:49', 4),
    ('8', '2012-03-17 14:56:41', 4),
	  ('9', '2022-02-24 21:14:22', 9),
    ('10', '2015-12-13 08:30:22', 3);

  CREATE TABLE SpotifyClone.Seguindo(
	usuario_id INTEGER,
    artista_id INTEGER,
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
		FOREIGN KEY (usuario_id) REFERENCES Usuarios (usuario_id),
        FOREIGN KEY (artista_id) REFERENCES Artistas (artista_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Seguindo (usuario_id, artista_id)
    VALUES
      (1, 1),
      (1, 2),
      (1, 3),
      (2, 1),
      (2, 3),
      (3, 2),
      (4, 4),
      (5, 5),
      (5, 6),
      (6, 6),
      (6, 1),
      (7, 6),
      (9, 3),
      (10, 2);
