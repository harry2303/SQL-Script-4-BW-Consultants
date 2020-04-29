/* Automatisiertes Löschen der DB-Tabellen des Demo Datenmodells
zur Schulung "SQL Script für BW Consultants"
per DDL CREATE Anweisungen */
-- Harald Schütt, 24.04.2020

DROP TABLE banks CASCADE;
DROP TABLE bp CASCADE;
DROP TABLE accounts CASCADE;
DROP TABLE saldos;
DROP TABLE error_log;
