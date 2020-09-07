-- Übung 12: Währungsumrechnung per Fkt. CONVERT_CURRENCY() und Table UDF
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
DROP FUNCTION UDF_CONV_TRACNTS;
--CREATE OR REPLACE FUNCTION UDF_CONV_TRACNTS() --not on BWE[HNA]
CREATE FUNCTION UDF_CONV_TRACNTS()
RETURNS TABLE (id INT, accnt_id INT, bnk_bic VARCHAR(11), slddate date, currency VARCHAR(3), amount DECIMAL(17,2))
AS
BEGIN
DECLARE lv_curr VARCHAR(3) = 'USD';
RETURN SELECT id, accnt_id, bnk_bic, slddate, :lv_curr currency, 
                        CONVERT_CURRENCY(
                                AMOUNT => amount,
                                SOURCE_UNIT => currency,
                                TARGET_UNIT => :lv_curr,
                                REFERENCE_DATE => slddate,
                                SCHEMA => 'SAPABAP1', --BWE [HNA]
                                CLIENT => '800', --BWE [HNA]
	                            CONVERSION_TYPE => 'EURX', --Umrech.art
                                ERROR_HANDLING => 'SET TO NULL' --'fail on error'
                                ) AS amount
        FROM transactions;
END;


--Abfrage der umgerechneten Beträge aus der Table UDF
SELECT * FROM UDF_CONV_TRACNTS()
UNION
SELECT * FROM transactions --Prüfung gegen Originalwerte
ORDER BY ID;