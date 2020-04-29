/* Prüfung der Installation des Demo Datenmodells
   und der generierten Menge an Testdaten*/
-- Harald Schütt, 23.04.2020

select 'Banken', count(*) as Istmenge, '90'  as Sollmenge from banks    union
select 'Kunden', count(*) as Istmenge, '11'  as Sollmenge from bp       union
select 'Konten', count(*) as Istmenge, '11'  as Sollmenge from accounts union
select 'Saldos', count(*) as Istmenge, '110' as Sollmenge from saldos;
