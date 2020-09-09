/* Vergleich Deklarative und Imperative Programmierung */
--Testtabelle anlegen
CREATE TABLE tab (COL_A int);
INSERT INTO tab VALUES (1);
INSERT INTO tab VALUES (2);
INSERT INTO tab VALUES (3);
INSERT INTO tab VALUES (4);


/* Deklaratives Beispiel */
DO BEGIN
DECLARE lv_agg INT = 0;
SELECT SUM(col_a) INTO lv_agg FROM tab;
SELECT lv_agg SUM FROM dummy;
END;

/* Imperatives Beispiel */
DO BEGIN
DECLARE lv_i, lv_agg INT = 0;
lt_tab = SELECT col_a FROM tab;
FOR lv_i IN 1..RECORD_COUNT(:lt_tab)      
DO
  lv_agg = :lv_agg + :lt_tab.col_a[:lv_i];
END FOR;
SELECT lv_agg SUM FROM dummy;
END;


--Testtabelle löschen
DROP TABLE tab;