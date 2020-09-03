-- Übung 8: Tabellenvariablen und DML Tabellenvariablen
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
--Anlegen des struk. Datentyps im Catalog (Knoten Procedures)
CREATE TYPE tt_dml AS TABLE (firstname NVARCHAR(20), lastname NVARCHAR(20), bnk_bic NVARCHAR(11), id INT);

DO
BEGIN

--Daten aus Tabelle bp einer Tab.var zuweisen
lt_bp = SELECT id, firstname, lastname FROM bp;

lt_bp_accnts = SELECT B.firstname, B.lastname, A.bnk_bic, A.id
                FROM :lt_bp AS B
                LEFT JOIN accounts AS A
                ON B.ID = A.BP_ID;

--Testausgabe für Resultat aus LEFT JOIN                
SELECT * FROM :lt_bp_accnts;

END;

DROP TYPE tt_dml;--Löschen des struk. Datentyps