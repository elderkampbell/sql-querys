SELECT
	s.SONG_NAME AS nome,
  COUNT(h.SONG_ID) AS reproducoes
FROM SpotifyClone.SONGS AS s
INNER JOIN SpotifyClone.PLAYBACK_HISTORY AS h
ON s.SONG_ID = h.SONG_ID

INNER JOIN SpotifyClone.USERS AS u
ON h.USER_ID = u.USER_ID

WHERE u.PLAN_ID = 1 OR u.PLAN_ID = 4
GROUP BY s.SONG_NAME
ORDER BY nome;