## Andmebaasi võtmed (Keys)

[Põhimõisted](README.md) | [Protseduurid](protseduur.md) | [ProtseduuridXAMPP](protseduuridXAMPP.md) | [Kasutajad](createkasutajad.md) | [Triggerid](triger.md) | [Keys (Kodutöö)](keys.md) | [Hotelliruumid](hotelliruum.md) | [Küsimused](kysimused.md)

## 1. Primary Key

Definitsioon:

PRIMARY KEY piirang identifitseerib iga kirje andmebaasi tabelis unikaalselt.

Milleks kasutatakse?

Kasutatakse iga rea unikaalseks tuvastamiseks.

Erinevus teistest võtmetest:

Ei tohi sisaldada NULL väärtusi ja peab olema unikaalne.

<img width="555" height="113" alt="image" src="https://github.com/user-attachments/assets/62ba1632-e371-4b5c-814b-b187dc97986b" />
<img width="1349" height="557" alt="image" src="https://github.com/user-attachments/assets/15a6928a-3ed9-45c5-9ecd-025a5a9d8e18" />

## 2. Foreign Key

Definitsioon:

The FOREIGN KEY piirang loob kahe tabeli vahele lingi ja takistab toiminguid, mis nendevahelise lingi hävitavad.

Milleks kasutatakse?

Seoste loomiseks tabelite vahel.

Erinevus teistest võtmetest:

Viitab teise tabeli andmetele.

<img width="268" height="106" alt="image" src="https://github.com/user-attachments/assets/0de20912-549f-48d8-a3d6-b8524b38f595" />
<img width="841" height="393" alt="image" src="https://github.com/user-attachments/assets/250b32ad-23bd-4887-bfc7-737b9e9c7213" />

## 3. Unique Key

Definitsioon:

UNIQUE piirang tagab, et kõik veeru väärtused on unikaalsed.

Milleks kasutatakse?

Duplikaatide vältimiseks.

Erinevus teistest võtmetest:

Võib sisaldada NULL väärtust.

<img width="939" height="391" alt="image" src="https://github.com/user-attachments/assets/9efaf56d-1ee8-4e25-89a8-2d1f8a875554" /> 
<img width="1198" height="528" alt="image" src="https://github.com/user-attachments/assets/e846e873-e548-4128-a47c-4f722a7dd57c" />

## 4. Simple Key

Definitsioon:

Simple Key koosneb ühest atribuudist.

Milleks kasutatakse?

Kirjete unikaalseks identifitseerimiseks ühe välja abil.

Erinevus teistest võtmetest:

Sisaldab ainult ühte veergu.

<img width="1027" height="473" alt="image" src="https://github.com/user-attachments/assets/79dbe80d-bec2-4dab-a33d-c65bcbd50c45" />
<img width="1431" height="576" alt="image" src="https://github.com/user-attachments/assets/1aa4b856-694d-4618-aa8c-822288dcb03a" />

## 5. Composite Key

Definitsioon:

Composite Key on primary key, mis on moodustatud kahest või enamast veerust, mis koos identifitseerivad unikaalselt iga tabeli kirjet.

Milleks kasutatakse?

Kui üks väli üksi ei ole unikaalne.

Erinevus teistest võtmetest:

Koosneb mitmest veerust.

<img width="1285" height="475" alt="image" src="https://github.com/user-attachments/assets/fa299e99-b8c4-4804-8362-f4904b3f1db8" />
<img width="1293" height="657" alt="image" src="https://github.com/user-attachments/assets/f135b1de-4bdb-48e6-a1e3-7d820cf082ed" />


## 6. Compound Key

Definitsioon:

Compound Key on Composite Key tüüp, mis koosneb mitmest väljast.

Milleks kasutatakse?

Unikaalse identifikaatori loomiseks mitme välja abil.

Erinevus teistest võtmetest:

Koosneb vähemalt kahest väljast.

<img width="1207" height="594" alt="image" src="https://github.com/user-attachments/assets/1d3ec047-ec03-4c8d-bfca-07cdb51d2a6b" />
<img width="1398" height="734" alt="image" src="https://github.com/user-attachments/assets/c065f4ea-2157-4faa-9dcf-c80dec2a0005" />

## 7. Superkey

Definitsioon:

Superkey on tabelis ühe või mitme atribuudi rühm, mis suudab iga tabeli rida unikaalselt identifitseerida. See tagab, et kahel real ei ole nende atribuutide väärtuste kombinatsiooni.

Milleks kasutatakse?

Kirjete unikaalseks määramiseks.

Erinevus teistest võtmetest:

Võib sisaldada liigseid atribuute.

<img width="1562" height="669" alt="image" src="https://github.com/user-attachments/assets/8c333852-9cfa-4d9e-8585-0c689824ed01" />
<img width="914" height="694" alt="image" src="https://github.com/user-attachments/assets/6e840029-cebc-4742-807c-177a7335b37b" />

## 8. Candidate Key

Definitsioon:

Candidate Key on minimaalne atribuutide kogum, mis identifitseerib unikaalselt iga tabelis olevat tuple'i. Teisisõnu, tabelis ei tohiks olla kahte rida, mille veergudel, mis on kandidaadivõtme osa, võivad olla samad väärtused.

Milleks kasutatakse?

Primary Key valimiseks.

Erinevus teistest võtmetest:

Ei sisalda liigseid atribuute.

<img width="1082" height="496" alt="image" src="https://github.com/user-attachments/assets/097dbc62-6a68-4ddc-af1e-c2b2c862047e" />
<img width="818" height="724" alt="image" src="https://github.com/user-attachments/assets/0264f5e0-18f5-4afb-b578-def046c25527" />

## 9. Alternate Key
Definitsioon

Alternate Key on kandidaatvõti, mida ei valita primaarvõtmeks, kuid mis suudab siiski tabeli kirjet unikaalselt tuvastada.

Milleks kasutatakse

Täiendava unikaalsuse tagamiseks.

Erinevus teistest võtmetest

On kandidaatvõti, kuid mitte Primary Key.

<img width="1007" height="583" alt="image" src="https://github.com/user-attachments/assets/63736aee-3ed0-41f7-9316-582b8e0f0357" />
<img width="1149" height="735" alt="image" src="https://github.com/user-attachments/assets/822f6ca3-ac4b-4ea4-b9cb-65944ccf8c35" />

#KASUTATUD LINGID

https://www.w3schools.com/sql/sql_primarykey.asp

https://www.w3schools.com/sql/sql_unique.asp#gsc.tab=0&gsc.q=simple%20key

https://www.geeksforgeeks.org/sql/composite-key-in-sql/

https://dba.stackexchange.com/questions/3134/in-sql-is-it-composite-or-compound-keys

https://www.geeksforgeeks.org/dbms/super-key-in-dbms/

https://www.geeksforgeeks.org/dbms/candidate-key-in-dbms/

https://www.geeksforgeeks.org/sql/sql-alternate-key/
