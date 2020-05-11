-- Übung 4: SQL Aggregatfunktionen und arithmetische Operatoren
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
-- Ermittlung des größten Saldos über alle Konten (per MAX-Funktion) 
SELECT MAX(amount) AS "Max Saldo"
FROM saldos; --Konto mit größtem Saldo

-- Ermitteln Sie die Anzahl der Salden pro Konto
SELECT accnt_id, COUNT(amount) AS "Anzahl Salden"
FROM saldos GROUP BY accnt_id; --Anzahl Salden pro Konto

-- Ermittlung des durchschnittlichen Kontostands (AVG-Wert) pro Konto
SELECT accnt_id, currency, AVG(amount) AS "AVG Saldo"
FROM saldos GROUP BY accnt_id, currency; -- durschnittlicher Kontostand pro Konto

-- Ältestes und aktuellstes Saldodatum in einer einzigen SQL-Abfrage pro Konto
SELECT accnt_id, MIN(slddate) AS "Min Date", MAX(slddate) AS "Max Date"
FROM saldos GROUP BY accnt_id; --ältestes und aktuellstes Saldodatum pro Konto

-- Berechnungen in SQL --> Zinsberechnung für einen Monat
SELECT accnt_id, slddate, currency, amount, ROUND((amount*.01/12),2) AS "Zinsen pro Monat" -- 1% Jahreszins
FROM saldos WHERE slddate = '31.10.2019'; --Berechnung Monatszins pro Konto
