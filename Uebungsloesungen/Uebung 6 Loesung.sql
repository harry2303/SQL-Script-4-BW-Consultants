-- Übung 6: Anonyme Blöcke
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag Übung 6 - 1
-- ID als Eingabeparameter, Vollständiger GP Name aus konkatenierte Ausgabe
DO ( IN in_id INT => ?
   , OUT out_fullname NVARCHAR(40)=> ? )
BEGIN

--Deklaration Skalar Variable
DECLARE in_firstname VARCHAR(20); 
DECLARE in_lastname VARCHAR(20);

--Selektion in zwei skalare Variable (in einem Schritt)
SELECT FIRSTNAME, LASTNAME INTO in_firstname, in_lastname FROM BP WHERE ID = :in_id;

-- Konkatenieren der Eingaben per string concatenation operator ||
     out_fullname = :in_lastname || ', ' || :in_firstname;
END

--Lösungsvorschlag Übung 6 - 2
--Ermittlung durchschnittlicher Saldo für gegebene Kontonummer
--Lösungsvorschlag Übung 6 - 2
DO ( IN in_accntid INT => 200100
   , OUT out_avgamnt DECIMAL(17,2)=> ? )
BEGIN

-- Berechnung durschnittlicher Kontostand pro Konto
SELECT AVG(amount) INTO out_avgamnt FROM saldos WHERE accnt_id = :in_accntid;

END