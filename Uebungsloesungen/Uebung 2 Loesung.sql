-- Übung 2: SQL JOIN Operator anwenden
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
-- Verbindung der Tabellen banks und accounts
-- über einen INNER JOIN
SELECT a.name, a.zipcode, a.place, b.id ACCNTID, b.created FROM banks AS a INNER JOIN accounts AS b
ON a.bic = b.bnk_bic;

-- Verbindung der Tabellen banks und accounts
-- per LEFT OUTER JOIN
SELECT a.name, a.zipcode, a.place, b.id ACCNTID, b.created FROM banks AS a LEFT OUTER JOIN accounts AS b
ON a.bic = b.bnk_bic;

-- Verbindung der Tabellen banks und accounts
-- per RIGHT OUTER JOIN
SELECT a.name, a.zipcode, a.place, b.id ACCNTID, b.created FROM banks AS a RIGHT OUTER JOIN accounts AS b
ON a.bic = b.bnk_bic;