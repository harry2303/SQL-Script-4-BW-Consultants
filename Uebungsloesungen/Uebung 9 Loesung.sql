-- Übung 9: Vereinfachung von Abfragen mit SQL Script
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
DO (IN iv_bic VARCHAR(11) => ?) --Eingabe der BIC
BEGIN

DECLARE lv_bic VARCHAR(11);
lv_bic = IFNULL(:iv_bic,'HELADEFFXXX'); --falls IN Parameter leer
--Testausgabe: Prüfung IFNULL Fkt.
SELECT :lv_bic BIC FROM dummy;

--Tabelle saldos passend zum IN Parameter BIC auslesen
lt_slds = SELECT SL.BNK_BIC, SL.ACCNT_ID, SL.SLDDATE
              FROM saldos SL
              WHERE SL.BNK_BIC = :lv_bic
              ORDER BY SL.SLDDATE;
--Kontrolle Zwischenergebnis
SELECT * FROM :lt_slds;

lt_bnks = SELECT B.BIC, B.NAME, B.ZIPCODE, B.PLACE
              FROM banks B
              WHERE B.BIC = :lv_bic;
--Kontrolle Zwischenergebnis
SELECT * FROM :lt_bnks;

lt_accnts = SELECT DISTINCT AC.BP_ID, AC.ID FROM accounts AC
              WHERE AC.BNK_BIC = :lv_bic;
--Kontrolle Zwischenergebnis
SELECT * FROM :lt_accnts;

lt_bp = SELECT AC.ID AS ACCNT_ID, BP.FIRSTNAME, BP.LASTNAME FROM bp
               JOIN :lt_accnts AC
               ON BP.ID = AC.BP_ID;
--Kontrolle Zwischenergebnis
SELECT * FROM :lt_bp;

--Ausgabe: Gesamtergebnis
SELECT B.BIC, B.NAME, B.ZIPCODE, B.PLACE, SL.ACCNT_ID, BP.FIRSTNAME, BP.LASTNAME, SL.SLDDATE
    FROM :lt_slds SL JOIN :lt_bnks B 
    ON SL.BNK_BIC = B.BIC
    JOIN :lt_bp BP
    ON SL.ACCNT_ID = BP.ACCNT_ID;

END;