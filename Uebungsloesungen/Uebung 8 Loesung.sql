-- Übung 8: Tabellenvariablen und DML Tabellenvariablen
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
--Anlegen des struk. Datentyps im Catalog (Knoten Procedures)
CREATE TYPE tt_dml AS TABLE (firstname NVARCHAR(20), lastname NVARCHAR(20), bnk_bic NVARCHAR(11), id INT);

DO
BEGIN
--DML Tabellenvariable auf Basis des Tabellentyps deklarieren
DECLARE lt_dml TABLE LIKE tt_dml;

--Daten aus Tabelle bp einer "normalen" Tab.var zuweisen
lt_bp = SELECT id, firstname, lastname FROM bp;

lt_bp_accnts = SELECT B.firstname, B.lastname, A.bnk_bic, A.id
                FROM :lt_bp AS B --JOIN Tab.var & DB-Tabelle
                LEFT JOIN accounts AS A
                ON B.ID = A.BP_ID;

--Optional: Ausgabe Resultat aus LEFT JOIN
SELECT * FROM :lt_bp_accnts;

--DML Teil
--Daten aus normaler Tab.var der DML Tab.var zuweisen
--INSERT INTO :lt_dml (SELECT * FROM :lt_bp_accnts);--möglich falls Struktur bereits passt 
INSERT INTO :lt_dml (SELECT firstname, lastname, bnk_bic, id FROM :lt_bp_accnts);

--Ausgabe Resultat aus DML Tab.var                
SELECT * FROM :lt_dml; 
END;

DROP TYPE tt_dml;--Löschen des struk. Datentyps
