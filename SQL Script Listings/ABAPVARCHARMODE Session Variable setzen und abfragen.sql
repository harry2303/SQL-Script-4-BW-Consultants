--Setzen und Abfragen Session Variable ABAPVARCHARMODE
SET 'ABAPVARCHARMODE' = 'FALSE';
SELECT session_context('ABAPVARCHARMODE') FROM dummy; --ABAP-Modus für leere Zeichenketten
SELECT 'Harald' || ' ' || 'Schuett' FROM dummy;


SET 'ABAPVARCHARMODE' = 'TRUE';
SELECT session_context('ABAPVARCHARMODE') FROM dummy; --ABAP-Modus für leere Zeichenketten
SELECT 'Harald' || ' ' || 'Schuett' FROM dummy;

SET 'ABAPVARCHARMODE' = 'FALSE';