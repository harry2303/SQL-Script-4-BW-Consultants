-- Übung 17: Alle Tage eines Jahres per Series Generate Function im BW-Format erzeugen lassen
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
SELECT to_nvarchar(GENERATED_PERIOD_START,'YYYYMMDD') AS calmonth
    FROM SERIES_GENERATE_DATE('INTERVAL 1 DAY', date'2020-01-01', date'2021-01-01');

--Unterschied Feldwerte ..._START, ..._END
SELECT GENERATED_PERIOD_START,
       GENERATED_PERIOD_END
    FROM SERIES_GENERATE_DATE('INTERVAL 1 DAY', date'2020-01-01', date'2021-01-01');