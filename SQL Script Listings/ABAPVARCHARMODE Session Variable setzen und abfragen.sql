--Setzen und Abfragen Session Variable ABAPVARCHARMODE
SET 'ABAPVARCHARMODE' = 'FALSE';
SELECT session_context('ABAPVARCHARMODE') FROM dummy; --ABAP-Modus für leere Zeichenketten
SELECT 'Harald' || ' ' || 'Schuett' FROM dummy;


SET 'ABAPVARCHARMODE' = 'TRUE';
SELECT session_context('ABAPVARCHARMODE') FROM dummy; --ABAP-Modus für leere Zeichenketten
SELECT 'Harald' || ' ' || 'Schuett' FROM dummy;

SELECT 'Harald' || CHAR(32) || 'Schuett' FROM dummy; --Leerzeichen im ABAP-Modus mit CHAR-Fkt.


SET 'ABAPVARCHARMODE' = 'FALSE';