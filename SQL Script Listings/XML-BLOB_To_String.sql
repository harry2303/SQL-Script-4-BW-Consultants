/*
make a BLOB column work as argument for XMLEXTRACT or XMLEXTRACTVALUE
solution: composition of functions to_varbinary() and bintostr()
*/
SELECT to_varbinary('BLOB_Type') AS varbintype, bintostr(to_varbinary('BLOB_Type')) AS blob_to_string FROM dummy;