SELECT u.USER_NAME AS usuario,
IF(MAX(YEAR(h.PLAYBACK_DATE) >= 2021), "Usuário ativo", "Usuário inativo") as status_usuario
FROM SpotifyClone.USERS AS u
INNER JOIN SpotifyClone.PLAYBACK_HISTORY AS h
ON h.USER_ID = u.USER_ID
GROUP BY usuario
ORDER BY u.USER_NAME
