--Hierarchien
--Beispiel - Demodatenmodell

--Hierarchietabelle t_demo generieren
CREATE COLUMN TABLE t_demo (
    parent_id VARCHAR(2), node_id VARCHAR(2), ord INTEGER, amount INTEGER );

--Hierarchische Testdaten in Tabelle t_demo einfügen
INSERT INTO t_demo VALUES ( null, 'A1', 1, 1 );
INSERT INTO t_demo VALUES ( 'A1', 'B1', 1, 2 );
INSERT INTO t_demo VALUES ( 'A1', 'B2', 2, 4 );
INSERT INTO t_demo VALUES ( 'B1', 'C1', 1, 1 );
INSERT INTO t_demo VALUES ( 'B1', 'C2', 2, 3 );
INSERT INTO t_demo VALUES ( 'B2', 'C3', 3, 1 );
INSERT INTO t_demo VALUES ( 'B2', 'C4', 4, 2 );
INSERT INTO t_demo VALUES ( 'C3', 'D1', 1, 2 );
INSERT INTO t_demo VALUES ( 'C3', 'D2', 2, 3 );
INSERT INTO t_demo VALUES ( 'C4', 'D3', 3, 1 );
