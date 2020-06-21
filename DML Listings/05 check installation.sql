/* Prüfung der Installation des Demo Datenmodells
   und der generierten Menge an Testdaten */
-- Harald Schütt, 28.04.2020

select 'banks' as Tabelle, count(*) as Istmenge, '90'  as Sollmenge from banks    union
select 'bp' as Tabelle, count(*) as Istmenge, '11'  as Sollmenge from bp       union
select 'accounts' as Tabelle, count(*) as Istmenge, '11'  as Sollmenge from accounts union
select 'saldos' as Tabelle, count(*) as Istmenge, '110' as Sollmenge from saldos union
select 'transactions' as Tabelle, count(*) as Istmenge, '15' as Sollmenge from transactions;