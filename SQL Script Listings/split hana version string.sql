--Split HANA Version String
SELECT version, LEFT(version,1) VERSION, LEFT(SUBSTRING(version,6,7),2) SP FROM m_database;
