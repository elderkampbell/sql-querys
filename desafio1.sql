DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.PLANS(
    PLAN_ID INT PRIMARY KEY AUTO_INCREMENT,
    PLAN_NAME VARCHAR(50) NOT NULL,
    PLAN_VALUE DECIMAL(5,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.USERS(
      USER_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      USER_NAME VARCHAR(45) NOT NULL,
      USER_AGE INT NOT NULL,
      PLAN_ID INT NOT NULL,
      SUBSCRIBE_DATE DATE NOT NULL DEFAULT(CURRENT_DATE),
      FOREIGN KEY (PLAN_ID) REFERENCES PLANS (PLAN_ID)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.ARTISTS (
    ARTIST_ID INT AUTO_INCREMENT PRIMARY KEY,
    ARTIST_NAME VARCHAR(100) NOT NULL
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.ALBUNS (
    ALBUM_ID INT AUTO_INCREMENT PRIMARY KEY,
    ALBUM_NAME VARCHAR(100) NOT NULL,
    ARTIST_ID INT NOT NULL,
    ALBUM_RELEASE_YEAR YEAR NOT NULL,
    FOREIGN KEY (ARTIST_ID) REFERENCES ARTISTS (ARTIST_ID)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.SONGS (
    SONG_ID INT AUTO_INCREMENT PRIMARY KEY,
    SONG_NAME VARCHAR(100) NOT NULL,
    SONG_DURATION INT(4) NOT NULL,
    ALBUM_ID INT NOT NULL,
    ARTIST_ID INT NOT NULL,
    FOREIGN KEY (ALBUM_ID) REFERENCES ALBUNS (ALBUM_ID),
    FOREIGN KEY (ARTIST_ID) REFERENCES ARTISTS (ARTIST_ID)
  ) engine = InnoDB;

 CREATE TABLE SpotifyClone.PLAYBACK_HISTORY(
      USER_ID INT NOT NULL,
      SONG_ID INT NOT NULL,
      PRIMARY KEY (USER_ID, SONG_ID),
      PLAYBACK_DATE DATETIME,
      FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID),
      FOREIGN KEY (SONG_ID) REFERENCES SONGS (SONG_ID)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.FOLLOWING_ARTISTS(
      USER_ID INT,
      ARTIST_ID INT,
      PRIMARY KEY (USER_ID, ARTIST_ID),
      FOREIGN KEY (ARTIST_ID) REFERENCES ARTISTS (ARTIST_ID),
      FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.PLANS (PLAN_NAME, PLAN_VALUE)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.USERS (USER_NAME, USER_AGE, PLAN_ID, SUBSCRIBE_DATE)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

  INSERT INTO SpotifyClone.ARTISTS (ARTIST_NAME)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.ALBUNS (ALBUM_NAME, ARTIST_ID, ALBUM_RELEASE_YEAR)
  VALUES
    ('Renaissance', 1, '2022'),
    ('Jazz', 2, '1978'),
    ('Hot Space', 2, '1982'),
    ('Falso Brilhante', 3, '1998'),
    ('Vento de Maio', 3, '2001'),
    ('QVVJFA?', 4, '2003'),
    ('Somewhere Far Beyond', 5, '2007'),
    ('I Put A Spell On You', 6, '2012');
  
  INSERT INTO SpotifyClone.SONGS (SONG_NAME, SONG_DURATION, ARTIST_ID, ALBUM_ID)
  VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 2, 3),
    ('Como Nossos Pais', 105, 3, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
    ('Samba em Paris', 267, 4, 6),
    ('The Bard’s Song', 244, 5, 7),
    ('Feeling Good', 100, 6, 8);

  INSERT INTO SpotifyClone.PLAYBACK_HISTORY (USER_ID, SONG_ID, PLAYBACK_DATE)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.FOLLOWING_ARTISTS (USER_ID, ARTIST_ID)
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
