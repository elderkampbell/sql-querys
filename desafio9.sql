SELECT COUNT(USER_ID) AS quantidade_musicas_no_historico
FROM SpotifyClone.PLAYBACK_HISTORY

WHERE USER_ID = 1
GROUP BY USER_ID;
