--Q1:
SELECT * 
	FROM lieu 
	WHERE nom_lieu 
	LIKE "%um";

--Q2:
SELECT nom_lieu, COUNT(id_personnage) AS nombre_habitants
	FROM personnage
	JOIN lieu USING(id_lieu)
	GROUP BY id_lieu 
	ORDER BY COUNT(id_personnage) DESC;

--Q3:
SELECT nom_personnage, nom_specialite, adresse_personnage, nom_lieu
	FROM personnage
	JOIN specialite USING(id_specialite)
	JOIN lieu USING(id_lieu)
	ORDER BY id_lieu, nom_personnage;

--Q4:
SELECT nom_specialite, COUNT(id_personnage) AS nombre
	FROM personnage
	JOIN specialite USING (id_specialite)
	GROUP BY id_specialite
	ORDER BY COUNT(id_personnage) DESC;

--Q5:
SELECT nom_bataille, DATE_FORMAT(date_bataille, "%d/ %m/-%y"), nom_lieu
	FROM bataille
	JOIN lieu USING (id_lieu)
	ORDER BY date_bataille DESC;

--Q6:
SELECT nom_potion, SUM(cout_ingredient*qte) AS cout_potion
	FROM potion
	JOIN composer USING (id_potion)
	JOIN ingredient USING(id_ingredient)
	GROUP BY id_potion
	ORDER BY cout_potion DESC;

--Q7:
SELECT nom_ingredient, cout_ingredient, qte
	FROM ingredient
	JOIN composer USING (id_ingredient)
	JOIN potion USING(id_potion)
	WHERE nom_potion LIKE "Santé"
	ORDER BY qte DESC;

--Q8:
SELECT nom_personnage, SUM(qte) AS qte_totale
	FROM prendre_casque
	JOIN personnage USING (id_personnage)
	JOIN bataille USING(id_bataille)
	WHERE nom_bataille LIKE "Bataille du village gaulois"
	GROUP BY id_personnage
	ORDER BY qte_totale DESC;

--Q9:
SELECT nom_personnage, SUM(dose_boire) AS qte_totale
	FROM boire
	JOIN personnage USING (id_personnage)
	GROUP BY id_personnage
	ORDER BY qte_totale DESC;

--Q10:
SELECT nom_bataille, SUM(qte) AS qte_totale
	FROM prendre_casque
	JOIN bataille USING (id_bataille)
	GROUP BY id_bataille
	ORDER BY qte_totale DESC
	LIMIT 1;

--Q11:
SELECT nom_type_casque, SUM(id_type_casque) AS nombre, SUM(cout_casque) AS cout_total
	FROM casque
	JOIN type_casque USING (id_type_casque)
	GROUP BY id_type_casque
	ORDER BY nombre DESC;

--Q12:
SELECT nom_potion AS potion_poisson_frais
	FROM potion
	JOIN composer USING (id_potion)
	JOIN ingredient USING (id_ingredient)
	WHERE nom_ingredient LIKE "Poisson frais";

--Q13:
SELECT nom_lieu, COUNT(id_personnage) AS population
	FROM lieu
	JOIN personnage USING (id_lieu)
	WHERE nom_lieu NOT LIKE "Village gaulois"
	GROUP BY id_lieu
	ORDER BY population DESC;

--Q14:
SELECT DISTINCT nom_personnage
	FROM boire
	JOIN personnage USING (id_personnage);

--Q15:
SELECT nom_personnage
	FROM personnage
	WHERE id_personnage NOT IN
	(
		SELECT id_personnage 
			FROM autoriser_boire 
			WHERE id_potion = 1
	);


--QA:
INSERT INTO personnage (id_personnage, nom_personnage, adresse_personnage, image_personnage, id_lieu, id_specialite)
	VALUES(46, "Champdeblix", "ferme Hantassion", "indisponible.jpg", 6, 12);

--QB:
INSERT INTO autoriser_boire (id_potion, id_personnage)
	VALUES(1, 12);

--QC:
DELETE FROM casque
	WHERE id_type_casque = 2 AND id_casque NOT IN
		(
			SELECT id_casque
				FROM prendre_casque
		);

--QD:
UPDATE personnage
	SET id_lieu = 9
	WHERE nom_personnage = "Zérozérosix"

--QE:
DELETE FROM composer
	WHERE id_potion = 9 AND id_ingredient = 19;

--QF:
UPDATE prendre_casque
	SET id_casque = 10
	WHERE id_personnage = 5 AND id_bataille = 2 AND id_casque = 14;
