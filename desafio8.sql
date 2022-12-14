SELECT a.ARTIST_NAME AS artista, ALBUNS.ALBUM_NAME AS album
FROM SpotifyClone.ARTISTS AS a

INNER JOIN SpotifyClone.ALBUNS
ON a.ARTIST_ID = ALBUNS.ARTIST_ID

GROUP BY album, artista
HAVING artista = 'Elis Regina'
ORDER BY album;
