-- Afficher les sessions de formation à venir qui se chevauchent pas avec une session donnée
SELECT *
FROM session
WHERE date_debut > [DATE_FIN_SESSION_DONNEE] OR date_fin < [DATE_DEBUT_SESSION_DONNEE]
-- Afficher les sessions de formation à venir avec des places encore disponibles
SELECT *
FROM session
WHERE date_debut > NOW() AND nombre_places_max > 0

-- Afficher le nombre des inscrits par session de formation

SELECT 	id_session, COUNT(id_sinscrire) AS nb_inscrits
FROM session
LEFT JOIN sinscrire ON id_session = sinscrire.session_id
GROUP BY id_session
-- Afficher l'historique des sessions de formation d'un apprenant donné
SELECT session.*
FROM session
INNER JOIN sinscrire ON id_session = sinscrire.session_id
WHERE sinscrire.apprenant_id = [id_apprenant]

-- Afficher la liste des sessions qui sont affectées à un formateur donné, triées par date de début
SELECT *
FROM session
WHERE id_formateur = [id_formateur]
ORDER BY date_debut ASC

-- Afficher la liste des apprenants d'une session donnée d'un formateur donné
SELECT apprenant.*
FROM apprenant
INNER JOIN sinscrire ON apprenant.id = sinscrire.apprenant_id
INNER JOIN session ON id_session = sinscrire.session_id
WHERE id_session = [id_session] AND session.id_formateur = [id_formateur]

-- Afficher l'historique des sessions de formation d'un formateur donné
SELECT session.*
FROM session
WHERE session.id_formateur = [id_formateur]
ORDER BY date_debut ASC

-- Afficher les formateurs qui sont disponibles entre 2 dates
SELECT *
FROM formateur
WHERE id NOT IN (
  SELECT DISTINCT id_formateur
  FROM session
  WHERE date_debut BETWEEN [DATE_DE_DÉBUT] AND [DATE_DE_FIN]
)

-- Afficher toutes les sessions d'une formation donnée
SELECT *
FROM session
WHERE formation_id = [id_formateur]

-- Afficher le nombre total des sessions par cétegorie de formation
SELECT Catégorie.nom AS Catégorie, COUNT(*) AS nombre_de_sessions
FROM session
INNER JOIN Catégorie ON session.categorie_id = categorie_id
GROUP BY Catégorie

-- Afficher le nombre total des inscrits par catégorie formation
SELECT Catégorie.nom AS Catégorie, COUNT(*) AS nombre_d_inscrits
FROM sinscrire
INNER JOIN session ON sinscrire.session_id = id_session
INNER JOIN Catégorie ON session.Catégorie_id = Catégorie.id
GROUP BY Catégorie