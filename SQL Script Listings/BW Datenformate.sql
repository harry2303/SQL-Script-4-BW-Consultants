/* BW Datenformate in SQL */

-- ALPHA Konvertierung
-- Auffüllen führende 0
SELECT LPAD('12', 8, 0) FROM dummy; -- beliebiges Füllzeichen möglich
SELECT TO_ALPHANUM('12', 8) FROM dummy; -- MAX. 127 Zeichen
SELECT ABAP_ALPHANUM('12', 8) FROM dummy; -- KEINE Zeichenlimitierung 
-- Entfernen führende 0
SELECT LTRIM('00000012',0) FROM dummy;

-- GROSSBUCHSTABEN --> 3 HANA Funktionen verfügbar
SELECT UCASE('abcdefg'), UPPER('abcdefg'), ABAP_UPPER('abcdefg') FROM dummy;

-- KLEINBUCHSTABEN --> 3 HANA Funktionen verfügbar
SELECT LCASE('ABCDEFG'), LOWER('ABCDEFG'), ABAP_LOWER('ABCDEFG') FROM dummy;

--Längen von Zeichenketten ermitteln - ABAP STRLEN() in SQL
SELECT length('AbcdefG3') "Feldlänge" FROM dummy;

--Zeichenketten konkatenieren
--ABAP Verkettungsoperator &&
SELECT '12345' || '67890' "concat operator" FROM dummy;
SELECT '123' || '45' || '67' || '890' "concat operator" FROM dummy;
--ABAP CONCATENATE, aber in SQL Fkt. nur 2 Strings
SELECT CONCAT('12345','67890') "concatfkt" FROM dummy;

--Zeichenketten beschneiden
SELECT SUBSTRING('1234567890',4,3) "substring" FROM dummy;
SELECT LEFT('1234567890',3) "left substring" FROM dummy;
SELECT RIGHT('1234567890',4) "right substring" FROM dummy;

--Zeichenketten ersetzen
SELECT REPLACE ('1234567890','1234','4321') "replace pattern" FROM dummy;
--Zeichen ersetzen
SELECT REPLACE ('1111567890','1','3') "replace signs" FROM dummy;

--Führende und schließende Leerzeichen entfernen - ABAP CONDENSE in SQL
SELECT length('  Hello  World !  '),trim('  Hello  World !  '),length(trim('  Hello  World !  ')) FROM dummy;
--ABAP SHIFT --- LEFT DELETING LEADING SPACE
SELECT length('  Hello  World !  '),ltrim('  Hello  World !  '),length(ltrim('  Hello  World !  ')) FROM dummy;
--ABAP SHIFT --- RIGHT DELETING TRAILING SPACE
SELECT length('  Hello  World !  '),rtrim('  Hello  World !  '),length(rtrim('  Hello  World !  ')) FROM dummy;

--Monatsletzen und Monatsersten ermitteln
SELECT last_day(CURRENT_DATE) "Monatsletzter" FROM dummy;
SELECT left(CURRENT_DATE,8) || '01' "Monatserster" FROM dummy;
SELECT to_nvarchar(CURRENT_DATE,'YYYYMM') || '01' "Monatserster BW style" FROM dummy;

--Rechnen mit Datumswerten im BW Stil
SELECT to_nvarchar(add_days(date'20200331', 1),'YYYYMMDD') "Folgemonatserster" FROM dummy;
SELECT to_nvarchar(add_days(date'20200301', -1),'YYYYMMDD') "Vormonatsletzter" FROM dummy;
SELECT days_between(CURRENT_DATE, date'20201231') AS "Tage bis Jahresende" FROM dummy;
SELECT days_between(CURRENT_DATE, date'20201224') AS "Tage bis Weihnachten" FROM dummy;
SELECT add_months(date'20200229', 1) "+1 Monat", add_months_last(date'20200229', 1) "+1 Monat & Letzter"FROM dummy;
SELECT add_years(date'20200229', 1) "+1 Jahr" FROM dummy;

--Rechnen mit Arbeitstagen basierend auf Fabrikkalender
--ADD_WORKDAYS (<factory_calendar_id>, <start_date>, <workdays> [, <source_schema>])
SELECT add_workdays('V3', date'20201225', 1, 'SAPABAP1') "next workday" FROM DUMMY;
SELECT add_workdays('V3', date'20201225', -1, 'SAPABAP1') "prev workday" FROM DUMMY;

