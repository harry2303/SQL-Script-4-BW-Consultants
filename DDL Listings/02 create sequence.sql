/* Automatisiertes Anlegen von Sequencen im Demo Datenmodell
zur Nutzung innerhalb der Schulung "SQL Script 4 BW Consultants"
per DDL CREATE Anweisungen */
-- Harald Schütt, 25.04.2020
CREATE SEQUENCE mySequence START WITH 1000 INCREMENT BY 10 NO MAXVALUE NO MINVALUE NO CYCLE;
-- Abrufen/generieren des nächsten Wertes per nachfolgendem SQL Statement:
--SELECT mySequence.NEXTVAL AS nextvalue FROM DUMMY;
CREATE SEQUENCE SaldoSequ START WITH 3000 INCREMENT BY 1  NO MAXVALUE NO MINVALUE NO CYCLE;
CREATE SEQUENCE TrnsSequ START WITH 5000 INCREMENT BY 1  NO MAXVALUE NO MINVALUE NO CYCLE;