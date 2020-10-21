/* Ableitung von BW Zeitmerkmalen in SQL */
-- per TO_NVARCHAR Funktion und "format models" --> BW Formate
SELECT
     to_nvarchar(CURRENT_DATE,'YYYYMMDD') AS CALDAY, 
     to_nvarchar(CURRENT_DATE,    'YYYY') AS CALYEAR,
     to_nvarchar(CURRENT_DATE,      'MM') AS CALMONTH2,
     to_nvarchar(CURRENT_DATE,  'YYYYMM') AS CALMONTH,
     to_nvarchar(CURRENT_DATE,  'YYYYWW') AS CALWEEK,
     to_nvarchar(CURRENT_DATE,       'Q') AS CALQUART1,
     to_nvarchar(CURRENT_DATE,   'YYYYQ') AS CALQUARTER,
-- CEIL:Returns the first integer that is greater than or equal to the value of <numericArg>. 
     to_nvarchar(ceil(to_int(to_nvarchar(CURRENT_DATE, 'Q'))/2)) AS HALFYEAR
FROM dummy;
/*
https://help.sap.com/viewer/4fe29514fd584807ac9f2a04f6754767/2.0.03/en-US/3f81ccc7e35d44cbbc595c7d552c202a.html
*/
--weitere Ableitungen von Zeitmerkmalen per to_nvarchar "format models" --> keine BW Formate
SELECT
     to_nvarchar(CURRENT_DATE,      'WW') AS WEEKNO,
     to_nvarchar(CURRENT_DATE,       'W') AS WEEKOFMONTH,
     to_nvarchar(CURRENT_DATE,       'D') AS DAYOFWEEK,
     to_nvarchar(CURRENT_DATE,      'DY') AS DAYNAME
FROM dummy;
/* Herleitung weiterer Zeitmerkmale */
-- per date functions --> keine BW Formate
SELECT
     CURRENT_DATE                         AS DATUM,
     year(CURRENT_DATE)                   AS JAHR,
     lpad(month(CURRENT_DATE),2,0)        AS MONAT, -- 2-stelliges Format per LPAD Funktion
     monthname(CURRENT_DATE)              AS MONATSNAME,
     last_day(CURRENT_DATE)               AS MONATSLETZTER,
     lpad(week(date'2020-01-01'),2,0)     AS WOCHENNR,
     quarter(CURRENT_DATE)                AS QUARTAL,
     weekday(CURRENT_DATE)                AS WOCHENTAG, -- Intervall 0 bis 6, 0 --> Monday
     dayname(CURRENT_DATE)                AS WOCHTAGNAME,
     lpad(dayofyear(CURRENT_DATE),3,0)    AS JAHRESTAG,-- 3-stelliges Format per LPAD Funktion
     days_between(CURRENT_DATE, date'20201231') AS TAGE_BIS_JAHRESENDE
FROM dummy;