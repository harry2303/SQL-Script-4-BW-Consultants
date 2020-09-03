-- Übung 7: Skalare Variablen und anonyme Blöcke
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
DO ( IN iv_num1 INT => ?
   , IN iv_num2 INT => ?
   , OUT ov_result INT=> ? )
BEGIN

DECLARE lv_num1 INTEGER DEFAULT 0;
DECLARE lv_num2 INT = 0; --SAP Empfehlung

lv_num1 = :iv_num1;
lv_num2 = :iv_num2;

--Check der Variablenwerte
--SELECT lv_num1 AS num1, lv_num2 AS num2 FROM dummy;

ov_result = lv_num1 + lv_num2;
END;