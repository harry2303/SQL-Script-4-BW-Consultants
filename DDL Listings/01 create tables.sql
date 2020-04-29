/* Automatisiertes Anlegen der DB-Tabellen Demo Datenmodells
zur Schulung "SQL Script für BW Consultants"
per DDL CREATE Anweisungen */
-- Harald Schütt, 23.04.2020

CREATE COLUMN TABLE banks
(
	bic       VARCHAR(11), --example COBADEFF
	name      NVARCHAR(40),
	zipcode   INT,
    place     NVARCHAR(20),
	primary key (bic)
)
COMMENT 'Table with banks';

CREATE COLUMN TABLE bp
(
	id        INT, --generated by sequence BPSequ
	firstname NVARCHAR(20) NOT NULL,
	lastname  NVARCHAR(20) NOT NULL,
	street    NVARCHAR(35),
    zipcode   INT NOT NULL,
    place     NVARCHAR(20),
	primary key (id)
)
COMMENT 'Table with Business Partners (Customers)';

CREATE COLUMN TABLE accounts
(
    id        INT, --generated by sequence AccntsSequ
	bic       VARCHAR(11),
	created   DATE NOT NULL,
	primary key (id),
	foreign key (bic)
	references banks(bic)
)
COMMENT 'Table with active accounts';

CREATE COLUMN TABLE saldos
(
	id        INT, --generated by sequence SaldosSequ
	bp_id     INT,
	accnt_id  INT,
	slddate   DATE, --Saldo date
	calmonth  NVARCHAR, --TO_NVARCHAR(slddate,'YYYYMM')  
	currency  VARCHAR(3), --Currency ISO Code
	amount    DECIMAL(17, 2), 
	primary key (id),
	foreign key (bp_id)
	references bp(id),
	foreign key (accnt_id)
	references accounts(id)
)
COMMENT 'Table with transactions per accounts, bank and customer';

CREATE COLUMN TABLE error_log
(
    id        INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    timestamp TIMESTAMP, --SELECT CURRENT_TIMESTAMP FROM DUMMY;
    errorcode INT,
    message   NVARCHAR(500)
)
COMMENT 'Optional Table for use with functions or procedures';