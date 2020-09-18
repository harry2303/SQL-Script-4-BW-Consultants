/* Daten generieren per Series data functions */

SELECT *
    FROM SERIES_GENERATE_DATE('INTERVAL 1 MONTH', '2020-01-01', '2021-01-01');

--Erzeugen von "Monatsscheiben" per SERIES_GENERATE_DATE
SELECT GENERATED_PERIOD_START AS "Monatserster",
       ADD_DAYS(GENERATED_PERIOD_END, -1) AS "Monatsletzter"
    FROM SERIES_GENERATE_DATE('INTERVAL 1 MONTH', '2020-01-01', '2021-01-01');

--Erzeugen von Perioden (Fiscper3)
SELECT LPAD(GENERATED_PERIOD_START,3,0) AS fiscper3
    FROM SERIES_GENERATE_TINYINT(1, 1, 17);

--Alle Tage eines Jahres erzeugen lassen    
SELECT to_nvarchar(GENERATED_PERIOD_START,'YYYYMMDD') AS calmonth
    FROM SERIES_GENERATE_DATE('INTERVAL 1 DAY', '2020-01-01', '2021-01-01');

--Erzeugen von "Tagesscheiben" für 1 Jahr
SELECT GENERATED_PERIOD_START AS from_date,
       GENERATED_PERIOD_END AS to_date
    FROM SERIES_GENERATE_DATE('INTERVAL 1 DAY', '2020-01-01', '2020-12-31')

