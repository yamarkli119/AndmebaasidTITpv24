```sql
CREATE DATABASE trigerTITPV24;
USE trigerTITPV24;
Create table linnad(
lindID int PRIMARY KEY IDENTITY(1,1),
linnanimi varchar(15) NOT NULL,
rahvaarv int);

CREATE TABLE logi(
id int primary key identity(1,1),
kasutaja varchar(25),
aeg DATETIME,
toiming varchar(100),
andmed text
)

CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;


--kontrollimiseks insert into linnad
INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Tallinn', 67);

--trigeri muutmine
alter TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
concat('linn: ', inserted.linnanimi, ' rahvarv: ', inserted.rahvaarv)  --andmed
FROM inserted;
```
<img width="771" height="458" alt="{C74A21CB-25CA-4E52-8A59-00B760449819}" src="https://github.com/user-attachments/assets/6566ccab-b9b0-4a2f-8dfe-860dcf1e106d" />

```sql
create TRIGGER linnakustutamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR DELETE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud DELETE käsk',  --toiming
concat('linn: ', deleted.linnanimi, ' rahvarv: ', deleted.rahvaarv)  --andmed
FROM deleted;

DELETE FROM linnad WHERE lindID=1;

SELECT * FROM logi;
SELECT * FROM linnad;

create TRIGGER linnauuendamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR UPDATE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud UPDATE käsk',  --toiming
concat('VANAD: linn: ', deleted.linnanimi, ' rahvarv: ', deleted.rahvaarv,
' ||| UUED: linn: ', inserted.linnanimi, ' rahvarv: ', inserted.rahvaarv)  --andmed
FROM deleted INNER JOIN inserted
ON deleted.lindID=inserted.lindID;

UPDATE linnad SET linnanimi='Tallinn-Väike', rahvaarv=100 WHERE lindID = 2;

DISABLE TRIGGER linnaLisamine on linnad;
DISABLE TRIGGER linnakustutamine on linnad;

create TRIGGER linnaLisaKustuta
ON linnad --tabelinimi, mis on vaja jälgida
FOR DELETE, INSERT
AS
BEGIN
	INSERT INTO logi(kasutaja, aeg, toiming, andmed)
	SELECT
	SYSTEM_USER,
	GETDATE(),  --aeg
	'on tehtud DELETE käsk',  --toiming
	concat('linn: ', deleted.linnanimi, ' rahvarv: ', deleted.rahvaarv)  --andmed
	FROM deleted

	UNION ALL

	SELECT
	SYSTEM_USER,
	GETDATE(),  --aeg
	'on tehtud INSERT käsk',  --toiming
	concat('linn: ', inserted.linnanimi, ' rahvarv: ', inserted.rahvaarv)  --andmed
	FROM inserted;
END;

INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Pärnu', 9034);

DELETE FROM linnad WHERE lindID=2;

SELECT * FROM logi;
SELECT * FROM linnad;

--kasutaja sekretarMarko õigused - lisamine, kustutamine ja uuendamine tabelis linnad, ei näe tabeli logi ja ei saa muuta trigerid
GRANT SELECT, INSERT, UPDATE, DELETE ON linnad TO sekretarMarko;
DENY SELECT ON logi TO sekretarMarko;

DENY ALTER ANY DATABASE DDL TRIGGER TO sekretarMarko;
```
