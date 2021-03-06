-- Übung 21: Nachlesen der Postleitzahl zur Bank per AMDP Feldroutine
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
    /* Nachlesen der Postleitzahl zur Bank per Feldroutine*/
    -------------------------------------------------------
    OUTTAB = SELECT IFNULL (T2.POSTAL_CD, '' ) AS POSTAL_CD
               FROM :intab AS T1
          LEFT JOIN "/BIC/MZIFMBANK" AS T2      --BW Objekte in spez. SQL-Notation + Grossbuchstaben
                 ON T1.BNK_BIC = T2."/BIC/ZIFMBANK"
              WHERE T2.OBJVERS = 'A';

    ERRORTAB= SELECT '' AS ERROR_TEXT,
                     '' AS SQL__PROCEDURE__SOURCE__RECORD
                FROM DUMMY WHERE DUMMY <> 'X';
