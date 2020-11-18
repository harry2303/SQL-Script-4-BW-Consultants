-- Übung 16: Ableitung von BW Zeitmerkmalen in SQL 
/*************************************************************/
--Lösungsvorschlag:
-- per TO_NVARCHAR Funktion und "format models" --> BW Formate
SELECT
     monthname(CURRENT_DATE)              AS MONATSNAME,
     last_day(CURRENT_DATE)               AS MONATSLETZTER,
     to_nvarchar(CURRENT_DATE,'YYYYMMDD') AS CALDAY, 
     to_nvarchar(CURRENT_DATE,    'YYYY') AS CALYEAR,
     to_nvarchar(CURRENT_DATE,      'MM') AS CALMONTH2,
     to_nvarchar(CURRENT_DATE,  'YYYYMM') AS CALMONTH,
     to_nvarchar(CURRENT_DATE,  'YYYYWW') AS CALWEEK,
     to_nvarchar(CURRENT_DATE,       'Q') AS CALQUART1,
-- CEIL:Returns the first integer that is greater than or equal to the value of <numericArg>. 
     to_nvarchar(ceil(to_int(to_nvarchar(CURRENT_DATE, 'Q'))/2)) AS HALFYEAR
FROM dummy;