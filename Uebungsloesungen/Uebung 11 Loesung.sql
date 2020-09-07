-- Übung 11: Anlegen einer Procedure
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
CREATE OR REPLACE PROCEDURE UPS_TRACNTS (
            IN iv_accnt INT       DEFAULT 600300,
            IN iv_bic VARCHAR(11) DEFAULT 'RABODEFFTAR',
            IN iv_date DATE       DEFAULT '00000000',
            IN iv_curr VARCHAR(3) DEFAULT 'EUR', 
            IN iv_amnt DECIMAL(17,2) DEFAULT 0.00,
            OUT ot_result TRANSACTIONS, --Type: Table transactions
            OUT ot_newrec TRANSACTIONS,
            OUT ot_msg TABLE(MSGTY NVARCHAR(1), MSG_TEXT NVARCHAR(5000))
            )
LANGUAGE SQLSCRIPT
SQL SECURITY DEFINER    --The default value for procedures is DEFINER
--READS SQL DATA        --The procedure is read-only: no update, delete or insert is possible  
AS
BEGIN 
/* Write your procedure logic */
--SELECT SESSION_USER "session user" FROM DUMMY; --check execution user [INVOKER|DEFINER]
--SELECT CURRENT_DATE "aktuelles Datum" FROM DUMMY;

-- ------------------ DECLARE & INITIALIZE VARIABLE
DECLARE lv_sequint INT = 0;
DECLARE lv_accnt INT = 600300;
DECLARE lv_bic VARCHAR(11) = 'RABODEFFTAR';
DECLARE lv_date DATE = CURRENT_DATE;
DECLARE lv_curr VARCHAR(3) = 'EUR';
DECLARE lv_amnt DECIMAL(17,2) = 0.00;

--Werte aus IN Parametern in lokale Variablen übernehmen
lv_accnt = :iv_accnt;
lv_bic = :iv_bic;
lv_date = :iv_date;
lv_curr = :iv_curr;
lv_amnt = :iv_amnt;
-- ------------------ CALC. & UPDATE VALUES
--UPSERT = INSERT + UPDATE --> key found: update, key not found: insert
--Example for VALUES ({TrnsSequ.nextval}, 600300, 'RABODEFFTAR', '20190503', 'EUR', 130); -- generate primary key by sequence TrnsSequ
--Update the table row where KEY is equal to 1.
-- UPSERT transactions VALUES (...) WHERE KEY = 1;
--Use the "WITH PRIMARY KEY" keyword to update the table using the primary key value in the VALUES clause.
-- UPSERT transactions VALUES (...) WITH PRIMARY KEY;

--Neuen Primärschlüssel mit Sequenz TrnsSequ per NEXTVAL erzeugen
SELECT TrnsSequ.nextval INTO lv_sequint FROM dummy; --Wertzuweisung an Skalar Variable in SELECT
UPSERT transactions VALUES(:lv_sequint, :lv_accnt, :lv_bic, :lv_date, :lv_curr, :lv_amnt) WITH PRIMARY KEY;

--Geänderten Datensatz an Tabellenvariable zuweisen
--SELECT TrnsSequ.currval INTO lv_sequint FROM dummy; --aktuellen Wert der Sequence TrnsSequ abfragen
ot_newrec = SELECT * FROM transactions WHERE ID = :lv_sequint;

-- ------------------ RETURN RESULT
ot_result = SELECT * FROM transactions;
ot_msg = SELECT 'I' MSGTY, 'Transaktion wurde angepasst' MSG_TEXT FROM dummy;

END;



-- Aufruf der Procedure mit IN und OUT Parametern (hier: teilweise gebunden an Konsolenausgabe)
CALL UPS_TRACNTS(600300, 'RABODEFFTAR', CURRENT_DATE, 'EUR', iv_amnt => ?, ot_newrec => ?, ot_result => ?, ot_msg => ?);
