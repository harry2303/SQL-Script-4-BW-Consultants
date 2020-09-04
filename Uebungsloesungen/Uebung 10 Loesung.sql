CREATE OR REPLACE FUNCTION UDF_DATE_CALMONTH (IN iv_date DATE)
            RETURNS rv_calmonth NVARCHAR(11)
            LANGUAGE SQLSCRIPT
            SQL SECURITY INVOKER AS
BEGIN
DECLARE lv_date DATE;
lv_date = TRIM(:iv_date);--removing leading and trailing spaces
rv_calmonth = TO_NVARCHAR(:lv_date, 'YYYYMM');--calmonth format
END;