SELECT u.USER_NAME AS 'usuario',
        COUNT(h.SONG_ID) AS "qt_de_musicas_ouvidas",
        ROUND(SUM(c.SONG_DURATION)/60, 2) AS 'total_minutos'
   FROM SpotifyClone.USERS AS u
   INNER JOIN SpotifyClone.PLAYBACK_HISTORY AS h
        ON u.USER_ID = h.USER_ID
    INNER JOIN SpotifyClone.SONGS AS c
        ON h.SONG_ID = c.SONG_ID
    GROUP BY USER_NAME
    ORDER BY USER_NAME ASC;