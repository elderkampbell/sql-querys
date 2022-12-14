SELECT s.SONG_NAME AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.SONGS AS s

INNER JOIN SpotifyClone.PLAYBACK_HISTORY AS h
ON s.SONG_ID = h.SONG_ID

GROUP BY s.SONG_NAME
ORDER BY reproducoes DESC , cancao LIMIT 2;
