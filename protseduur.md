## Prosteduurid MySQL
Tabeli loomine
```sql
CREATE TABLE toode(
    Id int PRIMARY KEY IDENTITY(1,1),
    toodeNimi varchar(30) NOT NULL,
    tootja varchar(20),
    toodeKogus int DEFAULT 1,
    toodeHind money
);

INSERT INTO toode(toodeNimi, tootja, toodeHind)
VALUES ('telefon', 'SAMSUNG', 400);
```
<img width="343" height="102" alt="{BEA827B6-BBFE-46C1-9841-C85C44731E76}" src="https://github.com/user-attachments/assets/8ca4246a-dcc9-4abb-9d15-68e80c457da8" />

Esimene protseduur (lisamine veerg tabelis)
```sql
CREATE PROCEDURE lisaToode
    @nimetus varchar(20),
    @tootja varchar(20),
    @kogus int,
    @hind money
AS
BEGIN
    INSERT INTO toode(toodeNimi, tootja, toodeHind, toodeKogus)
    VALUES (@nimetus, @tootja, @hind, @kogus);

    SELECT * FROM toode;
END;

EXEC lisaToode 'Fanta', 'FF', 5, 3;
```
<img width="329" height="99" alt="{E95981F7-B824-46D0-9BB2-15609EED5226}" src="https://github.com/user-attachments/assets/fa2c2b04-ea86-4573-b2f7-ecbbc6cea37c" />

Teine protseduur (minimaalne ja maksimaalne hind)
```sql
CREATE PROCEDURE minmaxHind
    @minHind MONEY OUTPUT,
    @maxHind MONEY OUTPUT
AS
BEGIN
    SELECT 
        @minHind = MIN(toodeHind),
        @maxHind = MAX(toodeHind)
    FROM toode;
END;

DECLARE @minHind MONEY, @maxHind MONEY;
EXEC minmaxHind @minHind OUTPUT, @maxHind OUTPUT;
PRINT 'Min hind = ' + CONVERT(varchar, @minHind);
PRINT 'Max hind = ' + CONVERT(varchar, @maxHind);
```
<img width="386" height="107" alt="{385C9C2A-B2D8-466F-A4A6-6AC4FF4D40C4}" src="https://github.com/user-attachments/assets/b66e2b02-1441-447f-b855-a51821d4499d" />

Kolmas prosteduur (ADD ja DROP COLUMN)
```sql
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);
    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)
        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    EXEC (@sqltegevus);
END;
EXEC muudatus 'add', 'toode', 'testVeerg', 'int';
EXEC muudatus 'drop', 'toode', 'testVeerg';
SELECT * FROM toode;
```
<img width="397" height="99" alt="{E64D3C55-D0B4-4A89-B5C6-D1F444418AF1}" src="https://github.com/user-attachments/assets/8b998cf0-925c-4dae-bc1c-06ccd8286dc9" />
<img width="337" height="99" alt="{866FBC73-993C-4114-8A01-85B2C7DFE6A3}" src="https://github.com/user-attachments/assets/e97439cf-c0c4-497d-bada-85766ea4d65e" />

Neljas protseduur (HINNA KATEGOORIA)
```sql
CREATE PROCEDURE kuvaTootedHinnaKategooriaga
AS
BEGIN
    SELECT 
        toodeNimi,
        toodeHind,
        CASE 
            WHEN toodeHind < 2 THEN 'soodne'
            ELSE 'kallis'
        END AS hinnaKategooria
    FROM toode;
END;
EXEC kuvaTootedHinnaKategooriaga;
```
<img width="322" height="225" alt="{B55943E1-9B5C-4E6E-A82D-3C78FB7C6FB9}" src="https://github.com/user-attachments/assets/a6744306-790a-4624-8097-09dac7382edf" />



