-- Übung 19: Ausschluss Business Partner 110 per ADMP Startroutine
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
    /* Startroutine - Ausschluss Business Partner 110 */
    --------------------------------------------------
    OUTTAB = SELECT *
               FROM :INTAB
              WHERE BP_ID <> '110';

    ERRORTAB = SELECT '' AS ERROR_TEXT,
                      '' AS SQL__PROCEDURE__SOURCE__RECORD
                 FROM DUMMY WHERE DUMMY <> 'X';