-- Übung 5: SQL Fensterfunktionen anwenden
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
-- Ermittlung des durchschnittlich bewegten Betrags (AVG-Wert) pro Konto
SELECT ACCNT_ID, BNK_BIC, TO_CHAR(SLDDATE,'YYYYMM') AS CALMONTH, AMOUNT,
AVG(AMOUNT) OVER (PARTITION BY ACCNT_ID, BNK_BIC, TO_CHAR(SLDDATE,'YYYYMM')) AS AVERAGE
FROM TRANSACTIONS;
--Bildung des AVG Wertes:
SELECT ACCNT_ID, BNK_BIC, TO_CHAR(SLDDATE,'YYYYMM') AS CALMONTH, AMOUNT,
SUM(AMOUNT) OVER (PARTITION BY ACCNT_ID, BNK_BIC, TO_CHAR(SLDDATE,'YYYYMM')) AS SALDO,
COUNT(AMOUNT) OVER (PARTITION BY ACCNT_ID, BNK_BIC, TO_CHAR(SLDDATE,'YYYYMM')) AS COUNTER,
AVG(AMOUNT) OVER (PARTITION BY ACCNT_ID, BNK_BIC, TO_CHAR(SLDDATE,'YYYYMM')) AS AVERAGE
FROM TRANSACTIONS;