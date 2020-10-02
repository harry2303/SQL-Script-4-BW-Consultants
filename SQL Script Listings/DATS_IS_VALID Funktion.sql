/* Prüfung auf valide Datumswerte per Funktion DATS_IS_VALID() */
SELECT 
     DATS_IS_VALID('20170101'), --returns 1 since the date is valid
     DATS_IS_VALID('20172001')  --returns 0 since the date is not valid
 FROM DUMMY;
 
 SELECT 
     CASE WHEN DATS_IS_VALID('20170101') = 1 --returns 1 since the date is valid
        THEN '20170101' ELSE '00000000'
     END     AS VALID_DATE,
     CASE WHEN DATS_IS_VALID('20172001') = 1  --returns 0 since the date is not valid
        THEN '20172001' ELSE '00000000'
     END     AS INVALID_DATE
 FROM DUMMY;