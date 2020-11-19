-- Übung 23: Anonymer Block: Startroutine - Ausschluss Business Partner 110
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
     /* Anonymer Block: Startroutine - Ausschluss Business Partner 110 */
     --------------------------------------------------------------------
DO
BEGIN
    /* Anonymer Block: Startroutine - Ausschluss Business Partner 110 */
    INTAB = SELECT  *
                 FROM "SAPABAP1"."/BIC/AZIFMADSO17";  -- 7er View (Reporting View) von aDSO ZIFMADSO1 in "ABAP Schema SAPABAP1" 
    
--    OUTTAB =          -- in anonymen Block OUTTAB auskommentieren und Feldliste aus AMDP Zielstruktur tn_s_out kopieren
    SELECT recordmode,
           id,
           bnk_bic,
           bp_id,
           created,
           '' AS record, --technische Felder --> leeres Literal
           '' AS sql__procedure__source__record --technische Felder --> leeres Literal
           FROM :INTAB WHERE BP_ID <> '110';
END;
