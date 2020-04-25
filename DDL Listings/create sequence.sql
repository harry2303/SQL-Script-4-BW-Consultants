/* Automatisiertes Anlegen einer Sequence im Demo Datenmodell
zur Nutzung innerhalb der Schulung "SQL Script für BW Consultants"
per DDL CREATE Anweisungen */
-- Harald Schütt, 25.04.2020
CREATE SEQUENCE mySequence START WITH 1000 INCREMENT BY 10 NO MAXVALUE NO MINVALUE NO CYCLE;
-- Abrufen/generieren des nächsten Wertes per nachfolgendem SQL Statement:
--SELECT mySequence.NEXTVAL AS nextvalue FROM DUMMY;
