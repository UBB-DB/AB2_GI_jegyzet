

<!-- A írás és olvasási zárakat a tranzakciók a következőképpen használhatják:
- írás zár: A tranzakciók írás zárat akkor használhatnak, ha módosítani akarják az adatbázisban tárolt adatokat. Az írás zárakat a tranzakciók egymástól függetlenül használhatják.
- olvasási zár: A tranzakciók olvasási zárat akkor használhatnak, ha olvasni akarják az adatbázisban tárolt adatokat. Az olvasási zárakat a tranzakciók egymástól függetlenül használhatják.
- megosztott zár: A megosztott zárakat a tranzakciók egymástól függetlenül használhatják. A megosztott zárakat a tranzakciók akkor használhatják, ha olvasni akarják az adatbázisban tárolt adatokat. A megosztott zárakat a tranzakciók akkor használhatják, ha nem akarnak módosítani az adatbázisban tárolt adatokat. -->


## Izolációs szintek

### Bevezetés
Egy tranzakció akkor konzisztens, ha a tranzakció végrehajtása előtt és után is érvényes az adatbázisban tárolt adatokra vonatkozó összes megkötés. A konzisztencia problémák akkor merülnek fel, ha a tranzakciók nem konzisztensek. A konzisztencia problémák megoldására több megoldás is létezik. Ezek közül a legfontosabbak a következők:
- Tranzakciók sorrendjének megváltoztatása
- Tranzakciók blokkolása
- Izolációs szintek beállítása

A leggyakoribb konzisztencia problémák a következők lehetnek:
- Elveszett módosítások
- Nem megismételhető olvasás
- Piszkos olvasás
- Fantom adatok



## Microsoft Sql szerver izolációs szintjei
A Microsoft SQL szerverek esetében az adatok védelmének egyik legfontosabb eleme az adatokhoz való hozzáférés szabályozása. A hozzáférés szabályozásának egyik módja az adatok elérésének szabályozása az adatbázis szerveren belül. Ezt az adatok elérésének szabályozását nevezzük izolációs szintnek.


Az izolációs szinteket a tranzakciók szintjén lehet beállítani. A tranzakciók szintjei a következők: 
- READ UNCOMMITTED
- READ COMMITTED
- REPEATABLE READ 
- SERIALIZABLE
- SNAPSHOT

<!-- A tranzakciók szintjei közötti különbségek a következők:  -->

### READ UNCOMMITTED
 - A tranzakciók nem blokkolják egymást, azaz egy tranzakció módosításait más tranzakciók láthatják.
 - Az adatok konzisztenciája nem garantált (azaz a piszkos olvasás, a nem megismételhető olvasás és a fantom adatok lehetségesek). 
 - Nincs blokkolva a kizárólagos zárak által



### READ COMMITTED
 - A tranzakciók blokkolják egymást, viszont egy tranzakció módosításait más tranzakciók csak akkor láthatják, ha a módosításokat tartalmazó tranzakció befejeződött.
 - A piszkos olvasás nem lehetséges.
 - Ebben az esetben a következő problémák lehetségesek: a nem megismételhető olvasás és a fantom adatok.

### REPEATABLE READ
 - A tranzakciók blokkolják egymást, viszont egy tranzakció módosításait más tranzakciók csak akkor láthatják, ha a módosításokat tartalmazó tranzakció befejeződött.
 - Ezen kívül a tranzakciók nem láthatják azokat a módosításokat, amelyeket a tranzakció megkezdése után hajtottak végre. 
 -A nem megismételhető olvasás nem lehetséges (azaz egy tranzakció nem olvashatja ugyanazt az adatot kétszer, ha közben egy másik tranzakció módosította az adatot).
 - Blokkolja az általa  olvasott elemek módositását a tranzakció végéig (osztott zárakkal)
 - Olvashat újonnan érkező adatokat (Fantom)


### SERIALIZABLE
 - A tranzakciók blokkolják egymást, egy tranzakció módosításait más tranzakciók csak akkor láthatják, ha a módosításokat tartalmazó tranzakció befejeződött. 
 - Ezen kívül a tranzakciók nem láthatják azokat a módosításokat, amelyeket a tranzakció megkezdése után hajtottak végre. 
 - Ezen kívül a tranzakciók nem hajthatnak végre módosításokat azokon az adatokon, amelyeket a tranzakció megkezdése után módosítottak más tranzakciók.
 - A nem megismételhető olvasás nem lehetséges (azaz egy tranzakció nem olvashatja ugyanazt az adatot kétszer, ha közben egy másik tranzakció módosította az adatot).
 - A fantom adatok nem lehetségesek (azaz egy tranzakció nem olvashatja ugyanazt az adatot kétszer, ha közben egy másik tranzakció új adatot adott hozzá az adatbázishoz). 

### SNAPSHOT
- Csak a tranzakció megkezdéséig véglegesitett módositásokat veszi figyelembe -> Nincs fantom 
- Olvasáshoz nem használ zárat
- Nem blokkol egyéb modositó tranzakciot a modositások figyelmen kivul vannak hagyva
- Nincs blokkolva olvasásra más tranzakcio által
- “Látja” a saját módositásait


```sql
SET TRANSACTION ISOLATION LEVEL
    { READ UNCOMMITTED
    | READ COMMITTED
    | REPEATABLE READ
    | SNAPSHOT
    | SERIALIZABLE  }
```
https://learn.microsoft.com/en-us/sql/t-sql/statements/set-transaction-isolation-level-transact-sql?view=sql-server-ver16 
