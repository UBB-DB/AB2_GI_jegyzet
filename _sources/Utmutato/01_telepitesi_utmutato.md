# Telepítési útmutató
A leírás csak

Mivel adatbáziskezelő rendszerekről lesz szó ezért az első szükséges telepíteni való a Microsoft SQL Server adatbáziskezelő rendszer szerver komponense lesz. 

A második fontos elem egy grafikus felhasználói felülettel(GUI-val) rendelkező kliens telepítése lesz.


**A telepiteshez 2-3 GB adat letöltése szükséges, ezért ez egy picit hosszas lehet.**


## Szerver telepitése

Nativ telepitésre következő operációs rendszerek támogatottak:
- Windows
- Linux (RHEL, Ubuntu, Suse )

Alternativ megoldás (pl. MacOS kornyezetben) Docker konténerek használata lehetséges, ez működik windows valamint linux környezet esetén is.

### Szerver telepitése Windows alatt
	
 Windowsra a letöltést az alábbi linken találjátok, ajánlott a Developer kiadás letöltése és telepitése: https://www.microsoft.com/en-us/sql-server/sql-server-downloads

### Szerver telepitése Linux alatt

 Linuxra szintén találtok ezen a linken 3 különböző distro-ra vonatkozó telepitési leirást.
https://www.microsoft.com/en-us/sql-server/sql-server-downloads

### Szerver használata Docker-el MacOS környezetben
- MacOSre nativan nem telepíthető a SQL Server, viszont futtatható egy izolált konténer környezetben. Ehhez szükséges a Docker desktop telepitése aminek itt érhető el az utmutatója(figyeljetek arra, hogy ha "Apple silicon" processzorotok van ahhoz van külön leirás): https://docs.docker.com/desktop/ Ha sikeresen telepitettétek szükséges egy ugynevezett konténer "image" letöltése és futtatása, erre vonatkozóan itt találtok információkat: https://hub.docker.com/_/microsoft-mssql-server

Mivel az Apple silicon ARM architekturán alapul, ez némi limitációval járhat ezért csak a SQL Server Edge image-et tudjátok futtatni: https://hub.docker.com/_/microsoft-azure-sql-edge

### Egyéb információ Docker környezet használatára

 A Dockeres megoldás  működik Windows es Linux alatt is, az előnye/hátránya annyi hogy mindig újra kell indítani a servert, míg a nativ telepités automatikusan fut mint "service". Fontos A konténer környezet izolált, a konténer leallasa utan az adatok nem lesznek elmenteve. Ahhoz hogy az adatok megmeradjanak futtatasok kozott az adatbasikezelo egy perzisztens tárra kell írja. Ezt egy "volume" segisegevel erhetitek el. Az alabbi linken talaltok reszletesebb leirast, a lenyeg hogy a docker run parancs esetén szukséges egy extra "-v lokalis/konyvtar:kontener/konyvtar" opcio hasznalata.  


https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-configure?view=sql-server-ver16&pivots=cs1-bash#mount-a-host-directory-as-data-volume


 ## Kliens telepitése

 ### Windowsra:

 a szerver telepités befejeztével felajánlja az SSMS(SQL server management studio) telepitését amire szükség lesz. Ha véletlen kimarad a telepitőt itt találjátok: https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16 A telepítő fel fog telepíteni egy Azure Data Studio névű eszközt is(ez VS Code alapú fejlesztői környezet), opcionálisan ez is használható mint kliens.

Linux es Mac: alatt csak az Azure Data Studio kliens telepíthető mivel ez platform független. Ezt itt találjatok: https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver16 

 

Sikeres tanévet!