-- Übung 13: Anzeige von Nachfolgeknoten mit Hilfe von Hierarchiefunktionen
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
/*
--HIERARCHY Generate Function ab HANA 2.0 SP03
SELECT  *
FROM HIERARCHY (
    SOURCE t_demo
    SIBLING ORDER BY ord );
*/
--HIERARCHY Generate Function ab HANA 2.0 SP01
SELECT  *
FROM HIERARCHY (
        SOURCE ( SELECT node_id, parent_id
                    FROM t_demo
                    ORDER BY ord )
               );
-- 
--Hierarchy DESCENDANTS, ab Knoten B2
SELECT *
FROM HIERARCHY_DESCENDANTS (
    SOURCE HIERARCHY (
                SOURCE ( SELECT node_id, parent_id
                            FROM t_demo )
                      )
    START WHERE node_id = 'B2'
    DISTANCE FROM 0 TO 2 ); --B2 ist Ebene 0

--Welchen Wert enthält pro NODE_ID das Feld AMOUNT
SELECT node_id, amount
FROM HIERARCHY_DESCENDANTS (
    SOURCE HIERARCHY (
                SOURCE ( SELECT node_id, parent_id, amount --Feld: AMOUNT mit in SELECT nehmen
                            FROM t_demo )
                      )
    START WHERE node_id = 'B2'
    DISTANCE FROM 0 TO 2 ); --B2 ist Ebene 0

--Gesamtsumme aller rel. Hierarchieknoten im Feld AMOUNT
SELECT start_rank, SUM(amount) AS SUMME
FROM HIERARCHY_DESCENDANTS (
    SOURCE HIERARCHY (
                SOURCE ( SELECT node_id, parent_id, amount --Feld: AMOUNT mit in SELECT nehmen
                            FROM t_demo )
                      )
    START WHERE node_id = 'B2'
    DISTANCE FROM 0 TO 2 ) --B2 ist Ebene 0
GROUP BY start_rank;

