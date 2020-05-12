-- Übung 3: SQL SET Operator anwenden
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Ermittlung aller BICs aus der Tabelle banks, ohne Konto in der Tabelle accounts
SELECT bic FROM banks
EXCEPT
SELECT bnk_bic AS bic FROM accounts;

-- INTERSECT über das Feld Kontonr. der Tabellen accounts und saldos
SELECT id FROM accounts
INTERSECT
SELECT accnt_id AS id FROM saldos;
-- INNER JOIN ... ON ...
SELECT a.id FROM accounts a INNER JOIN saldos s
ON a.id = s.accnt_id;

-- Verdopplung der Datenmenge der Tabelle banks per UNION Operator
SELECT * FROM banks
UNION ALL
SELECT * FROM banks;