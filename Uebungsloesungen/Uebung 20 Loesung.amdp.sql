-- Übung 20: Ableitung von Zeitmerkmalen per AMDP Endroutine
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
    /* Ableitung von Zeitmerkmalen aus CREATEDON */
    ----------------------------------------------
    OUTTAB   = SELECT REQTSN,
                      ACCNT_ID,
                      BNK_BIC,
                      RECORDMODE,
                      POSTAL_CD,
                      CITY,
                      BP_ID,
                      CREATEDON,
                      to_nvarchar(CREATEDON, 'YYYYMMDD' )       AS CALDAY,
                      to_nvarchar(CREATEDON, 'YYYYWW' )         AS CALWEEK,
                      to_nvarchar(CREATEDON, 'YYYYMM' )         AS CALMONTH,
                      to_nvarchar(CREATEDON, 'YYYYQ' )          AS CALQUARTER,
                      to_nvarchar(ceil(to_int(to_nvarchar(CREATEDON, 'Q')) / 2)) AS HALFYEAR,
                      to_nvarchar(CREATEDON, 'YYYY' )           AS CALYEAR,
                      RECORD,
                      SQL__PROCEDURE__SOURCE__RECORD
                 FROM :INTAB;

    ERRORTAB = SELECT '' AS ERROR_TEXT,
                      '' AS SQL__PROCEDURE__SOURCE__RECORD
                 FROM DUMMY WHERE DUMMY <> 'X';