SELECT nom, prenom FROM client;
SELECT DISTINCT prenom FROM client; --Sans doublon
SELECT client, SUM(tarif) FROM achat GROUP BY client; --Obtenir la somme des tarifs pour chaque client
SELECT * FROM client WHERE ville = "Paris"; -- IN IS NULL LIKE BETWEEN
SELECT * FROM client WHERE ville LIKE "N%"; -- Par rapport a la premiere lettre de la ville
SELECT * FROM utilisateur WHERE date_inscription BETWEEN "2012-04-01" AND "2012-04-20";
SELECT * FROM Customers ORDER BY Country, City; --(ASC/DESC)
SELECT * FROM Customers WHERE x = "zzz" AND y = "zz";
SELECT * FROM Customers WHERE NOT city = "Berlin"; --non egal

INSERT INTO Customers (nom, prenom) VALUES ("Nom", "Prenom");
WHERE PostalCode IS NULL; -- Pas de valeur (NOT NULL)
UPDATE Customers SET City = "Oslo" WHERE Country = "Norway"; -- Change pour tous
DELETE FROM Customers WHERE City = "Oslo";
DELETE FROM Customers; -- Supprime tout

SELECT MIN(Price) FROM produits; --MAX()
SELECT COUNT(*) FROM Products WHERE Price = 18; --Compte le nombre de produits avec un prix de 18.
SELECT AVG(Price) FROM Products; -- Moyenne
WHERE NOT City LIKE "a%" -- La ville ne commence pas par a.
WHERE City LIKE "_a%" -- La seconde lettre est un a.
SELECT * FROM Customers WHERE City LIKE '[acs]%'; -- LA premiere lettre est un a, c ou s [a-f] pour l'interval [!acf] pour l'inverse.
SELECT * FROM Customers WHERE Country IN ("Norway", 'France'); -- NOT IN()
WHERE Price BETWEEN 10 AND 20;
SELECT * FROM Products WHERE ProductName BETWEEN 'Geitost' AND 'Pavlova'; --Alphabetique
SELECT PostalCode AS Pno; -- Utiliser un alias. (aussi pour les tables)
SELECT * FROM table LIMIT 10 -- Limite l'ovtention des 10 premiers resultats. OFFSET 5 peut etre ajoute
SELECT * FROM Orders LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID; --Joindre deux tables par une de leurs clefs
-- Choose the correct JOIN clause to select all the records from the Customers table plus all the matches in the Orders table.
SELECT * FROM Orders INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country;--Classifie par pays le nombre de customers.
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC; -- Classifie en ordre decroissant


CREATE DATABASE testDB; --DROP sinon
CREATE TABLE sable;
DROP TABLE sable;

ALTER TABLE Persons ADD Birthday DATE; --Ajouter supprimer colonne
ALTER TABLE Persons DROP COLUMN Birthday;