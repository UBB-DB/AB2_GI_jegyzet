# Adattárházak

Az adattárház (data warehouse) olyan digitális tárolórendszer, amely számos különböző forrásból származó nagy mennyiségű adatot kapcsol össze és harmonizál. 
Célja az üzleti intelligencia (BI), a jelentéskészítés és az elemzések ellátása, valamint a szabályozási követelmények támogatása, hogy a vállalatok adataikat elemzéssé alakíthassák, és intelligens, adatvezérelt döntéseket hozhassanak.
Az adattárházak egy helyen tárolják az aktuális és történeti adatokat, és egyetlen adatforrásként szolgálnak egy szervezet számára. (2)


Hasonloság a tranzakcionális adatbázisokhoz:
- Adattároló rendszerek: mindketto adatbázis szervereket használ
- Relacios adatmodellt használ


Kulonbségek:  
- Kozpontositott: a ceg osszes adatát tartalmazza
- Hisztorizalt: tartalmazza nem csak az aktuális adatokat hanem az idobeli modositasokat is 
- Olvasásra optimizált: komplex és nagy méretu adatokra (OLTP - irasra modositasra optimizalt)  

## Referenciák
1) Teljes pelda projekt OLTP-rol OLAP-ra alakitassal ETL folyamattal, dashboardokkal és példákkal: https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/wide-world-importers
2) Adattárház osszefoglalo: https://www.sap.com/hungary/products/technology-platform/datasphere/what-is-a-data-warehouse.html
