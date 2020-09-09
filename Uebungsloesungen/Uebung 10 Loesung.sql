-- Übung 10: Anlegen einer User Defined Scalar Function (UDF)
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
DROP FUNCTION UDF_DATE_CALMONTH;
--CREATE OR REPLACE FUNCTION UDF_DATE_CALMONTH (IN iv_date DATE) --not on BWE[HNA]
CREATE FUNCTION UDF_DATE_CALMONTH (IN iv_date DATE)
            RETURNS rv_calmonth NVARCHAR(11)
            LANGUAGE SQLSCRIPT
            SQL SECURITY INVOKER --Scalar UDF Default: INVOKER
AS
BEGIN
DECLARE lv_date DATE;
lv_date = TRIM(IFNULL(:iv_date,'00000000'));--Not Null, removing leading and trailing spaces
rv_calmonth = TO_NVARCHAR(:lv_date, 'YYYYMM');--calmonth format
END;

--Ausgabe aller Felder inkl. gefülltem CALMONTH aus Tabelle saldos
SELECT id, accnt_id, bnk_bic, slddate, UDF_DATE_CALMONTH(slddate) AS calmonth, currency, amount FROM saldos;
