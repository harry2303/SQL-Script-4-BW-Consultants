-- Übung 10: Anlegen einer User Defined Function (UDF)
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
CREATE OR REPLACE FUNCTION UDF_DATE_CALMONTH (IN iv_date DATE)
            RETURNS rv_calmonth NVARCHAR(11)
            LANGUAGE SQLSCRIPT
            SQL SECURITY INVOKER AS
BEGIN
DECLARE lv_date DATE;
lv_date = TRIM(IFNULL(:iv_date,'00000000'));--Not Null, removing leading and trailing spaces
rv_calmonth = TO_NVARCHAR(:lv_date, 'YYYYMM');--calmonth format
END;

--Ausgabe aller Felder inkl. gefülltem CALMONTH aus Tabelle saldos
SELECT ID,ACCNT_ID,BNK_BIC,SLDDATE,UDF_DATE_CALMONTH(SLDDATE) AS CALMONTH,CURRENCY,AMOUNT FROM saldos;
