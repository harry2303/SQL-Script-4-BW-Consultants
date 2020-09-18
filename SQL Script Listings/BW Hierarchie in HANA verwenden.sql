--Procedure mit dynamischer SQL Abfrage
--Syntax Version HANA 2 SP 01
--DROP PROCEDURE get_bw_hierarchy;
--CREATE PROCEDURE get_bw_hierarchy (
--Syntax Version HANA 2 SP 04
CREATE OR REPLACE PROCEDURE get_bw_hierarchy (
            IN iv_schema NVARCHAR(30) DEFAULT 'SAPABAP1'
          , IN iv_htable NVARCHAR(30)
          , OUT ov_sql NVARCHAR(2500)
          , OUT ot_hier TABLE (parent_id NVARCHAR(999), node_id NVARCHAR(999))
          )
SQL SECURITY INVOKER
AS
BEGIN
DECLARE lv_qname NVARCHAR(60);
DECLARE lv_sql NVARCHAR(2500);
--EXIT HANDLING
DECLARE no_bwhtable CONDITION FOR SQL_ERROR_CODE 10000;
DECLARE EXIT HANDLER FOR no_bwhtable -- oder per: SQL_ERROR_CODE 10000
                SELECT ::SQL_ERROR_CODE ERR_CODE, ::SQL_ERROR_MESSAGE MESSAGE FROM DUMMY;
IF LOCATE(:iv_htable,'/BIC/H') <> 1 THEN
--SIGNAL SQL_ERROR_CODE 10000 SET MESSAGE_TEXT = 'Keine BW Hierarchietabelle gewählt!'; --SIGNAL error_code
SIGNAL no_bwhtable SET MESSAGE_TEXT = 'Keine BW Hierarchietabelle gewählt!'; --SIGNAL condition
END IF;

SELECT '"' || :iv_schema || '"' || '.' || '"' || :iv_htable || '"' INTO lv_qname FROM dummy;
    /* SQL Abfrage für SOURCE Parameter des HANA Hierarchy Generators*/ 
lv_sql = 'SELECT 
to_nvarchar(P.NODENAME) AS PARENT_ID, 
to_nvarchar(C.NODENAME) AS NODE_ID 
FROM ' || :lv_qname || ' C ' || ' LEFT JOIN ' || :lv_qname || ' P ' ||
' ON C.PARENTID = P.NODEID ORDER BY C.NODEID; ';
ov_sql = :lv_sql;

--Dynamisches SQL - ab HANA 2 SP 04 direkt read only in Tab.var
EXECUTE IMMEDIATE :lv_sql INTO ot_hier READS SQL DATA;
END;

-- Aufruf der Procedure
CALL get_bw_hierarchy('SAPHANADB','/BIC/HPCCOSCTR',ov_sql=>?,ot_hier=>?);
-- Fehlerhafter Aufruf --> ERROR_CODE 10000
CALL get_bw_hierarchy('SAPHANADB','/BIC/PCCOSCTR',ov_sql=>?,ot_hier=>?);


--Table User Defined Function mit dynamischer SQL Abfrage
--Syntax Version HANA 2 SP 01
--DROP FUNCTION udf_bw_hierarchy;
--CREATE FUNCTION udf_bw_hierarchy (IN iv_schema NVARCHAR(30) DEFAULT 'SAPABAP1', IN iv_htable NVARCHAR(30))
--Syntax Version HANA 2 SP 04
CREATE OR REPLACE FUNCTION udf_bw_hierarchy (IN iv_schema NVARCHAR(30) DEFAULT 'SAPABAP1', IN iv_htable NVARCHAR(30))
RETURNS TABLE (parent_id NVARCHAR(999), node_id NVARCHAR(999))
SQL SECURITY INVOKER
AS
BEGIN
DECLARE lv_qname NVARCHAR(60);
DECLARE lv_sql NVARCHAR(2500);
DECLARE ot_hier TABLE (parent_id NVARCHAR(999), node_id NVARCHAR(999));
--EXIT HANDLING
DECLARE no_bwhtable CONDITION FOR SQL_ERROR_CODE 10000;
DECLARE EXIT HANDLER FOR no_bwhtable -- oder per: SQL_ERROR_CODE 10000
                SELECT ::SQL_ERROR_CODE ERR_CODE, ::SQL_ERROR_MESSAGE MESSAGE FROM DUMMY;
IF LOCATE(:iv_htable,'/BIC/H') <> 1 THEN
--SIGNAL SQL_ERROR_CODE 10000 SET MESSAGE_TEXT = 'Keine BW Hierarchietabelle gewählt!'; --SIGNAL error_code
SIGNAL no_bwhtable SET MESSAGE_TEXT = 'Keine BW Hierarchietabelle gewählt!'; --SIGNAL condition
END IF;

SELECT '"' || :iv_schema || '"' || '.' || '"' || :iv_htable || '"' INTO lv_qname FROM dummy;
    /* SQL Abfrage für SOURCE Parameter des HANA Hierarchy Generators*/ 
lv_sql = 'SELECT 
to_nvarchar(P.NODENAME) AS PARENT_ID, 
to_nvarchar(C.NODENAME) AS NODE_ID 
FROM ' || :lv_qname || ' C ' || ' LEFT JOIN ' || :lv_qname || ' P ' ||
' ON C.PARENTID = P.NODEID ORDER BY C.NODEID; ';

--Dynamisches SQL - ab HANA 2 SP 04 direkt read only in Tab.var
EXECUTE IMMEDIATE :lv_sql INTO ot_hier READS SQL DATA;
RETURN SELECT * FROM :ot_hier;
END;

-- Aufruf der Table UDF
-- Kann direkt in Param. SOURCE der HANA Hierarchy Generator Fkt. eingesetzt werden
SELECT * FROM udf_bw_hierarchy('SAPHANADB','/BIC/HPCCOSCTR');


-- Original SQL Abfrage zur Transformation
/*
--SQL Abfrage für SOURCE Parameter des HANA Hierarchy Generators 
SELECT
     to_nvarchar(P.NODENAME) AS PARENT_ID,
     to_nvarchar(C.NODENAME) AS NODE_ID 
FROM "SAPABAP1"."/BIC/HPCCOSCTR" C 
LEFT JOIN "SAPABAP1"."/BIC/HPCCOSCTR" P ON C.PARENTID = P.NODEID
ORDER BY C.NODEID; 
 
Nun das obige SQL Statement "eingebaut" in den HANA Hierarchy Generator - Parameter SOURCE:

SELECT 
    hierarchy_rank AS rank,
    hierarchy_tree_size AS tree_size,
    hierarchy_parent_rank AS parent_rank,
    hierarchy_level AS level,
    hierarchy_is_cycle AS is_cycle,
    hierarchy_is_orphan AS is_orphan,
    parent_id,
    node_id
FROM HIERARCHY ( 
     SOURCE ( SELECT
                to_nvarchar(P.NODENAME) AS PARENT_ID,
                to_nvarchar(C.NODENAME) AS NODE_ID 
                FROM "SAPABAP1"."/BIC/HPCCOSCTR" C 
                LEFT JOIN "SAPABAP1"."/BIC/HPCCOSCTR" P ON C.PARENTID = P.NODEID
                ORDER BY C.NODEID
          )
     )
ORDER BY hierarchy_rank;
*/ 
