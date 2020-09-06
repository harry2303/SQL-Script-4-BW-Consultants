/* Idee: Ein- / Auszahlungen auf Konto mit Datum/Calmonth --> INSERT (table transactions ?) per Procedure */
/****************************************************************************************************/
CREATE OR REPLACE PROCEDURE CALC_INTS (
            IN it_al TABLE (INTS INT), 
            IN it_input TABLE(JB_PROD NVARCHAR(50)),
            OUT ot_result TABLE(JB_PROD NVARCHAR(50), FS_PER_MSG_TEXT_ NVARCHAR(5000), FS_PER_FORMULA_ NVARCHAR(5000)), 
            OUT ot_msg TABLE(MSGTY NVARCHAR(1), MSG_TEXT NVARCHAR(5000))
            )
LANGUAGE SQLSCRIPT
SQL SECURITY DEFINER
--READS SQL DATA        --The procedure is read-only: no update, delete or insert is possible  
AS
BEGIN 
/* Write your procedure logic */

-- ------------------ DECLARE & INITIALIZE VARIABLE
DECLARE VS_FLAG VARCHAR(1);
DECLARE VS_STUDNAME VARCHAR(20);
DECLARE VS_TEACHNAME VARCHAR(20);


-- ------------------ RETURN RESULT
select VS_STUDNAME as Studiant, VS_TEACHNAME as Teacher from dummy;

END;

CALL CALC_INTS(it_al, it_input);