/* Datenreihen generieren per Series data functions */
SELECT *
    FROM SERIES_GENERATE_INTEGER(2, 1, 23);

SELECT *
    FROM SERIES_GENERATE_DATE('INTERVAL 1 MONTH', date'2020-01-01', date'2021-01-01');

--Erzeugen von "Monatsscheiben" per SERIES_GENERATE_DATE
SELECT GENERATED_PERIOD_START AS "Monatserster",
       ADD_DAYS(GENERATED_PERIOD_END, -1) AS "Monatsletzter"
    FROM SERIES_GENERATE_DATE('INTERVAL 1 MONTH', date'2020-01-01', date'2021-01-01');

--Erzeugen von Perioden (Fiscper3) per SERIES_GENERATE Fkt. und formatieren per LPAD
SELECT LPAD(GENERATED_PERIOD_START,3,0) AS fiscper3
    FROM SERIES_GENERATE_TINYINT(1, 1, 17);
--Perioden per SERIES_GENERATE Fkt. erzeugen und formatieren per LPAD
SELECT LPAD(GENERATED_PERIOD_END,3,0) AS fiscper3
    FROM SERIES_GENERATE_INTEGER(1, 0, 16);

--Alle Tage eines Jahres erzeugen lassen    
SELECT to_nvarchar(GENERATED_PERIOD_START,'YYYYMMDD') AS calmonth
    FROM SERIES_GENERATE_DATE('INTERVAL 1 DAY', date'2020-01-01', date'2021-01-01');

--Erzeugen von "Tagesscheiben" für 1 Jahr
SELECT GENERATED_PERIOD_START AS from_date,
       GENERATED_PERIOD_END AS to_date
    FROM SERIES_GENERATE_DATE('INTERVAL 1 DAY', date'2020-01-01', date'2020-12-31')
