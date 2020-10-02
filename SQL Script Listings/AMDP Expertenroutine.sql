class /BIC/UVGECITRJU5EWFYMEK9P_M definition
  public
  create public .

public section.

  interfaces IF_AMDP_MARKER_HDB .

  types:
    begin of TN_S_IN_GLOBAL_EXPERT_1,
       VERTRAG type C length 10,
       SERVICE_START type D,
       SERVICE_END type D,
       SERVICE type C length 4,
       SERVICEID type C length 10,
       SRVPRVREF type C length 30,
       SERVPROV_PAY type C length 4,
       SPARTE type C length 2,
       LOEVM type C length 1,
       UPDMOD type C length 1,
       INT_UI_BW type C length 32,
       RECORD type C length 56,
       SQL__PROCEDURE__SOURCE__RECORD type C length 56,
    end of TN_S_IN_GLOBAL_EXPERT_1 .
  types:
    begin of TN_S_IN_GLOBAL_EXPERT.
       include type TN_S_IN_GLOBAL_EXPERT_1.
     types end of TN_S_IN_GLOBAL_EXPERT .
  types:
    TN_T_IN_GLOBAL_EXPERT TYPE STANDARD TABLE OF TN_S_IN_GLOBAL_EXPERT .
  types:
    begin of TN_S_OUT_GLOBAL_EXPERT_1,
       SOURSYSTEM type RSSOURSYSID, " InfoObject: 0SOURSYSTEM
       UC_POD type /BI0/OIUC_POD, " InfoObject: 0UC_POD
       DATETO type /BI0/OIDATETO, " InfoObject: 0DATETO
       DATEFROM type /BI0/OIDATEFROM, " InfoObject: 0DATEFROM
       UC_POD_EXT type /BI0/OIUC_POD_EXT, " InfoObject: 0UC_POD_EXT
       UC_PODTYPE type /BI0/OIUC_PODTYPE, " InfoObject: 0UC_PODTYPE
       UC_PODTECH type /BI0/OIUC_PODTECH, " InfoObject: 0UC_PODTECH
       UC_PODDERE type /BI0/OIUC_PODDERE, " InfoObject: 0UC_PODDERE
       UCPREMISE type /BI0/OIUCPREMISE, " InfoObject: 0UCPREMISE
       UC_OUTL_ID type /BI0/OIUC_OUTL_ID, " InfoObject: 0UC_OUTL_ID
       UCDELE_IND type /BI0/OIUCDELE_IND, " InfoObject: 0UCDELE_IND
       /BIC/ZUUENBSA type /BIC/OIZUUENBSA, " InfoObject: ZUUENBSA
       UC_GRID type /BI0/OIUC_GRID, " InfoObject: 0UC_GRID
       UC_PODSTRC type /BI0/OIUC_PODSTRC, " InfoObject: 0UC_PODSTRC
       UC_GRIDLVL type /BI0/OIUC_GRIDLVL, " InfoObject: 0UC_GRIDLVL
       UC_STTLSUP type /BI0/OIUC_STTLSUP, " InfoObject: 0UC_STTLSUP
       UC_PODGMAN type /BI0/OIUC_PODGMAN, " InfoObject: 0UC_PODGMAN
       UCDEREGPRC type /BI0/OIUCDEREGPRC, " InfoObject: 0UCDEREGPRC
       UC_PODGRP type /BI0/OIUC_PODGRP, " InfoObject: 0UC_PODGRP
       UC_SETTLU type /BI0/OIUC_SETTLU, " InfoObject: 0UC_SETTLU
       UC_PRCSUSE type /BI0/OIUC_PRCSUSE, " InfoObject: 0UC_PRCSUSE
       /BIC/ZUDRGSCEN type /BIC/OIZUDRGSCEN, " InfoObject: ZUDRGSCEN
       UC_STTLTR type /BI0/OIUC_STTLTR, " InfoObject: 0UC_STTLTR
       UC_STTLCRD type /BI0/OIUC_STTLCRD, " InfoObject: 0UC_STTLCRD
       /BIC/ZGVID type /BIC/OIZGVID, " InfoObject: ZGVID
       /BIC/ZUSALFST type /BIC/OIZUSALFST, " InfoObject: ZUSALFST
       /BIC/ZUSAMG type /BIC/OIZUSAMG, " InfoObject: ZUSAMG
       /BIC/ZUSAMSBS type /BIC/OIZUSAMSBS, " InfoObject: ZUSAMSBS
       RECORD type C length 56,
       SQL__PROCEDURE__SOURCE__RECORD type C length 56,
    end of TN_S_OUT_GLOBAL_EXPERT_1 .
  types:
    begin of TN_S_OUT_GLOBAL_EXPERT.
       include type TN_S_OUT_GLOBAL_EXPERT_1.
     types end of TN_S_OUT_GLOBAL_EXPERT .
  types:
    TN_T_OUT_GLOBAL_EXPERT TYPE STANDARD TABLE OF TN_S_OUT_GLOBAL_EXPERT .

  methods GLOBAL_EXPERT
    importing
      value(i_req_dtp_name) type STRING
      value(i_req_logsys) type STRING
      value(i_req_src_name) type STRING
      value(i_req_src_type) type STRING
      value(i_req_tgt_name) type STRING
      value(i_req_tgt_type) type STRING
      value(i_req_requid) type STRING
      value(inTab) type TN_T_IN_GLOBAL_EXPERT
    exporting
      value(outTab) type TN_T_OUT_GLOBAL_EXPERT .
protected section.
private section.
**** begin of global area - insert your code only below this line     ****

  " The global area coding is only taken over (saved) if the runtime is set to ABAP

... "insert your code here

**** end of global area - insert your code only before this line       ****
ENDCLASS.



CLASS /BIC/UVGECITRJU5EWFYMEK9P_M IMPLEMENTATION.


  METHOD global_expert BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING /BI0/PUC_SETTLU.

    -- *** Begin of routine - insert your code only below this line ***

    -- Note the _M class are not considered for DTP execution.
    -- AMDP Breakpoints must be set in the _A class instead.

    tempTab = select
               'S1' as "SOURSYSTEM",
               "INT_UI_BW" as "UC_POD",
               TO_NVARCHAR("SERVICE_END") as "DATETO",
               TO_NVARCHAR("SERVICE_START") as "DATEFROM",
               '' as "UC_POD_EXT",
               '' as "UC_PODTYPE",
               '' as "UC_PODTECH",
               '' as "UC_PODDERE",
               '' as "UCPREMISE",
               '' as "UC_OUTL_ID",
               '' as "UCDELE_IND",
               '' as "/BIC/ZUUENBSA",
               '' as "UC_GRID",
               '' as "UC_PODSTRC",
               '' as "UC_GRIDLVL",
               max( case
                when "SERVICE" in ('LIEF', 'LGAS')
                    then
                        "SERVICEID"
                    else
                        ''
               end ) as "UC_STTLSUP",
               '' as "UC_PODGMAN",
               '' as "UCDEREGPRC",
               '' as "UC_PODGRP",
               '' as "UC_SETTLU",
               '' as "UC_PRCSUSE",
               '' as "/BIC/ZUDRGSCEN",
               max( case
                when "SERVICE" in ('NETZ', 'NGAS')
                    then
                        "SERVICEID"
                    else
                        ''
               end ) as "UC_STTLTR",
               '' as "UC_STTLCRD",
               '' as "/BIC/ZGVID",
                max( case
                when "SERVICE" in ('LFST')
                    then
                        "SERVICEID"
                    else
                        ''
               end) as "/BIC/ZUSALFST",
               max( case
                when "SERVICE" in ('MSBG')
                    then
                        "SERVICEID"
                    else
                        ''
               end )  as "/BIC/ZUSAMG",
               max( case
                when "SERVICE" in ('MSBS')
                    then
                        "SERVICEID"
                    else
                        ''
               end ) as "/BIC/ZUSAMSBS",
               "RECORD",
               "SQL__PROCEDURE__SOURCE__RECORD"
               from :inTab
               where "SERVICE_END" != '00000000' and "SERVICE_START" != '00000000' and ("SERVICE_START" <= "SERVICE_END")
               group by
                "INT_UI_BW",
                "SERVICE_START",
                "SERVICE_END",
                "RECORD",
                "SQL__PROCEDURE__SOURCE__RECORD" ;

     mdTab = SELECT DISTINCT uc_settlu, uc_sttlcrd FROM "/BI0/PUC_SETTLU" WHERE soursystem = 'S1' AND objvers = 'A';


     outTab = SELECT  a.SOURSYSTEM
                     ,a.UC_POD
                     ,CASE WHEN DATS_IS_VALID(a.DATETO) = 1 THEN a.DATETO ELSE a.DATEFROM END AS DATETO
                     ,CASE WHEN DATS_IS_VALID(a.DATEFROM) = 1 THEN a.DATEFROM  ELSE a.DATETO END AS DATEFROM
                     ,a.UC_POD_EXT
                     ,a.UC_PODTYPE
                     ,a.UC_PODTECH
                     ,a.UC_PODDERE
                     ,a.UCPREMISE
                     ,a.UC_OUTL_ID
                     ,a.UCDELE_IND
                     ,a."/BIC/ZUUENBSA"
                     ,a.UC_GRID
                     ,a.UC_PODSTRC
                     ,a.UC_GRIDLVL
                     ,a.UC_STTLSUP
                     ,a.UC_PODGMAN
                     ,a.UCDEREGPRC
                     ,a.UC_PODGRP
                     ,a.UC_SETTLU
                     ,a.UC_PRCSUSE
                     ,a."/BIC/ZUDRGSCEN"
                     ,a.UC_STTLTR
                     ,ifnull(b.UC_STTLCRD,'') AS UC_STTLCRD --aus Stammdatentabelle /BI0/PUC_SETTLU
                     ,a."/BIC/ZGVID"
                     ,a."/BIC/ZUSALFST"
                     ,a."/BIC/ZUSAMG"
                     ,a."/BIC/ZUSAMSBS"
                     ,a."RECORD"
                     ,a."SQL__PROCEDURE__SOURCE__RECORD"
              FROM :tempTab AS a
              LEFT JOIN :mdTab AS b
              ON a.uc_settlu = b.uc_settlu;
    -- *** End of routine - insert your code only before this line ***
  ENDMETHOD.
ENDCLASS.