CREATE PROCEDURE USER_A.PROC1 LANGUAGE SQLSCRIPT SQL SECURITY DEFINER AS
BEGIN
    SELECT
    SESSION_USER "session user" ,
    CURRENT_USER "current user"
FROM
    DUMMY;
END;

CREATE PROCEDURE USER_A.PROC2 LANGUAGE SQLSCRIPT SQL SECURITY INVOKER AS
BEGIN
    SELECT
    SESSION_USER "session user" ,
    CURRENT_USER "current user"
FROM
    DUMMY;
END;
