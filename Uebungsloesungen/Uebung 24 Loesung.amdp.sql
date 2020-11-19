-- Übung 24: Transponieren Kennzahlen- zu Kontenmodell per AMDP Expertenroutine
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:

    --Definition und Setzen einer Temporäre Tabelle
    lt_vtype = SELECT *,
                      '010' AS VTYPE,
                      AMOUNT_ACTUAL AS AMOUNT
                 FROM :intab
                UNION ALL
               SELECT *,
                      '020' AS VTYPE,
                      AMOUNT_PLAN AS AMOUNT
                 FROM :intab
                UNION ALL
               SELECT *,
                      '030' AS VTYPE,
                      AMOUNT_FCAST AS AMOUNT
                 FROM :intab;

    --Outtab projection mit VTYPE als Kriterium zur Unterscheidung von Kennzahlen
    outtab = SELECT ID,
                    VTYPE,
                    SLDDATE,
                    RECORDMODE,
                    ACCNT_ID,
                    BNK_BIC,
                    AMOUNT,
                    CURRENCY,
                    RECORD,
                    SQL__PROCEDURE__SOURCE__RECORD
               FROM :lt_vtype;

    ERRORTAB= SELECT * FROM :ERRORTAB;
