/* ADMP-Logik zur Transformation eines Kennzahlenmodells in ein Kontenmodell
   unter Nutzung der SERIES_GENERATE-Funktion und eines CROSS JOINs */

   METHOD GLOBAL_EXPERT BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY.
    -- *** BEGIN OF ROUTINE - INSERT YOUR CODE ONLY BELOW THIS LINE ***

    -- NOTE THE _M CLASS ARE NOT CONSIDERED FOR DTP EXECUTION.
    -- AMDP BREAKPOINTS MUST BE SET IN THE _A CLASS INSTEAD.

    -- OUTTAB = SELECT * FROM :INTAB;
    -- 16 PERIODEN PER SERIES_GENERATE FKT. ERZEUGEN UND FORMATIEREN PER LPAD
        LT_PER = SELECT LPAD(GENERATED_PERIOD_END,3,0) AS FISCPER3
                            FROM PUBLIC.SERIES_GENERATE_INTEGER(1, 0, 16);


        OUTTAB = SELECT IT.MANDT,
                        IT.OBJNR,
                        IT.LEDNR,
                        IT.WRTTP,
                        IT.TRGKZ,
                        IT.GJAHR,
                        IT.ACPOS,
                        IT.VORGA,
                        IT.VERSN,
                        IT.ABKAT,
                        IT.GEBER,
                        IT.TWAER,
                        PER.FISCPER3 AS PERBL,
                        IT.BELTP,
                        IT.RECORDMODE,
                        CASE PER.FISCPER3
                            WHEN '001' THEN IT.WLP01
                            WHEN '002' THEN IT.WLP02
                            WHEN '003' THEN IT.WLP03
                            WHEN '004' THEN IT.WLP04
                            WHEN '005' THEN IT.WLP05
                            WHEN '006' THEN IT.WLP06
                            WHEN '007' THEN IT.WLP07
                            WHEN '008' THEN IT.WLP08
                            WHEN '009' THEN IT.WLP09
                            WHEN '010' THEN IT.WLP10
                            WHEN '011' THEN IT.WLP11
                            WHEN '012' THEN IT.WLP12
                            WHEN '013' THEN IT.WLP13
                            WHEN '014' THEN IT.WLP14
                            WHEN '015' THEN IT.WLP15
                            WHEN '016' THEN IT.WLP16
                        END AS WLP00,
                        IT.RECORD,
                        IT.SQL__PROCEDURE__SOURCE__RECORD
                    FROM :INTAB AS IT CROSS JOIN :LT_PER AS PER;
    -- *** END OF ROUTINE - INSERT YOUR CODE ONLY BEFORE THIS LINE ***
  ENDMETHOD.
