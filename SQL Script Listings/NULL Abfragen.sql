CREATE TABLE test_null(
id INT, name VARCHAR(10) );


INSERT INTO test_null VALUES(1, 'Peter');
INSERT INTO test_null VALUES(2, 'Paul');
INSERT INTO test_null VALUES(3, 'Petra');
INSERT INTO test_null VALUES(4, 'Andrea');
INSERT INTO test_null(id) VALUES(5); -- Feld NAME ohne Wert --> NULL
INSERT INTO test_null VALUES(6, ''); -- leeres Literal


SELECT * FROM test_null; --Alle Datensätze anzeigen

SELECT * FROM test_null WHERE name LIKE'P%';
SELECT * FROM test_null WHERE name NOT LIKE'P%';

SELECT * FROM test_null WHERE name = NULL; --Vergleiche sind nicht möglich
SELECT * FROM test_null WHERE name IS NULL;--liefert Resultat

SELECT * FROM test_null WHERE name = ''; --leeres Literal

SELECT 1 + NULL /*3*/ AS Addition FROM dummy;--Berechnungsbeispiel mit NULL
SELECT 'ABC' || NULL /*'DEF'*/ AS Konkatenieren FROM dummy;--Konkatenieren mit NULL

DROP TABLE test_null; --Tabelle wieder entfernen