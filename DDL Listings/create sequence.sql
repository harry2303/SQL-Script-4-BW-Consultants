/* Automatisiertes Anlegen von Sequencen im Demo Datenmodell
zur Nutzung innerhalb der Schulung "SQL Script für BW Consultants"
per DDL CREATE Anweisungen */
-- Harald Schütt, 25.04.2020
CREATE SEQUENCE mySequence START WITH 1000 INCREMENT BY 10 NO MAXVALUE NO MINVALUE NO CYCLE;
-- Abrufen/generieren des nächsten Wertes per nachfolgendem SQL Statement:
--SELECT mySequence.NEXTVAL AS nextvalue FROM DUMMY;
CREATE SEQUENCE BPSequ    START WITH 1000 INCREMENT BY 1  NO MAXVALUE   NO MINVALUE NO CYCLE;
CREATE SEQUENCE AccntsSequ START WITH 200000 INCREMENT BY 10 MAXVALUE 5000 NO MINVALUE CYCLE;
CREATE SEQUENCE SaldoSequ START WITH 3000 INCREMENT BY 1  NO MAXVALUE   NO MINVALUE CYCLE;
