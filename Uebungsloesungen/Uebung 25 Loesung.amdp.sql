-- Übung 25: Transponieren Konten- zu Kennzahlenmodell per AMDP Expertenroutine
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:

    --Interne Tabelle zur Verarbeitung von INTAB Daten
    lt_temp = SELECT ID,
                     VTYPE,
                     SLDDATE,
                     RECORDMODE,
                     ACCNT_ID,
                     BNK_BIC,
                     CASE WHEN VTYPE = '010' THEN AMOUNT
                                             ELSE 0 END AS AMOUNT_ACTUAL, --neue Zielkennzahl
                     CASE WHEN VTYPE = '020' THEN AMOUNT
                                             ELSE 0 END AS AMOUNT_PLAN, --neue Zielkennzahl
                     CASE WHEN VTYPE = '030' THEN AMOUNT
                                             ELSE 0 END AS AMOUNT_FCAST, --neue Zielkennzahl
                     CURRENCY,
                     RECORD,
                     SQL__PROCEDURE__SOURCE__RECORD
                FROM :intab;

    --Outtab projection zur Summation der AMOUNT Werte
    outtab = SELECT ID,
                    SLDDATE,
                    RECORDMODE,
                    ACCNT_ID,
                    BNK_BIC,
                    SUM ( AMOUNT_ACTUAL ) AS AMOUNT_ACTUAL,
                    SUM ( AMOUNT_PLAN ) AS AMOUNT_PLAN,
                    SUM ( AMOUNT_FCAST ) AS AMOUNT_FCAST,
                    CURRENCY,
                    MAX ( RECORD ) AS RECORD,
                    MAX ( SQL__PROCEDURE__SOURCE__RECORD ) AS SQL__PROCEDURE__SOURCE__RECORD
               FROM :lt_temp
           GROUP BY ID,
                    SLDDATE,
                    RECORDMODE,
                    ACCNT_ID,
                    BNK_BIC,
                    CURRENCY;

    ERRORTAB= SELECT * FROM :ERRORTAB;
