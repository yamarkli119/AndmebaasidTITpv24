## Andmebaas hotelliruumi reserveerimine

```sql
--1. Guest
CREATE TABLE guest(
guestID int Primary Key IDENTITY(1,1),
fname varchar(80),
lname varchar(80) not null,
memberSince DATE);

select * from guest; 

INSERT INTO guest
VALUES ('Aleksander', 'Makovski', '2026-01-25');
```

<img width="298" height="74" alt="{1B80221E-51A0-48B9-998A-690143483A0B}" src="https://github.com/user-attachments/assets/f394719d-e223-42a6-91d3-a9f63572b726" />

```sql
--2. Reservation
CREATE TABLE reservation(
reservationID int PRIMARY KEY identity(1,1),
date_in DATE,
date_out DATE,
made_by varchar(20),
guestID int, 
FOREIGN KEY (guestID) REFERENCES guest(guestID));

SELECT * FROM reservation;

INSERT INTO reservation
VALUES ('2026-01-06', '2026-04-30', 'admin', 3);
```
<img width="366" height="80" alt="{AE81C3EE-3780-4B18-B4C1-3E46F8D1BCF7}" src="https://github.com/user-attachments/assets/2ece31de-0cb8-4052-b534-67d29c9ceef9" />

```sql
--3. room_type
CREATE TABLE room_type(
room_typeID int PRIMARY KEY identity(1,1),
description_i varchar(80),
max_capacity int);

SELECT * FROM room_type;

INSERT INTO room_type
VALUES ('single ruum', 1);
```
<img width="269" height="79" alt="{DCE57158-2A48-427F-B19F-69398FFAC067}" src="https://github.com/user-attachments/assets/56c9cfd0-624d-487b-b034-4e40b962fd9e" />

```sql
--4. room
CREATE TABLE room(
roomID int PRIMARY KEY identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int, 
foreign key (room_type_id) references room_type(room_typeID)
);

SELECT * FROM room;

INSERT INTO room
VALUES('104', 'Trixie', 'denied', 2, 3);
```
<img width="393" height="75" alt="{A3813FDB-7424-4AAE-848C-1B9760B1743B}" src="https://github.com/user-attachments/assets/d7aa37d9-0061-44c9-80cb-ba4b81c084da" />

```sql
--5. reserved_room
CREATE TABLE reserved_room(
reserver_roomID int primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
FOREIGN KEY (room_type_id) references room_type(room_typeID),
FOREIGN KEY (reservation_id) references reservation(reservationID),
status varchar(20));

SELECT * FROM reserved_room;

INSERT INTO  reserved_room
values(4,3,3, 'ready');
```
<img width="428" height="76" alt="{AA4C8CFB-8015-48D4-876C-C5100677A978}" src="https://github.com/user-attachments/assets/3eb3b586-e31a-4d88-bd18-198e89f3026e" />

```sql
--6. occupied_room
CREATE TABLE occupied_room(
occupied_roomID int primary key identity(1,1),
check_in  date,
check_out DATE,
room_id int,
reservation_id int,
FOREIGN KEY (room_id) references room(roomID),
FOREIGN KEY (reservation_id) references reservation(reservationID));

SELECT * FROM occupied_room;

insert into occupied_room
values ('2024-01-04', '2077-08-01', 3, 3);
drop table occupied_room;
```
<img width="413" height="78" alt="{60744900-084F-492F-AE3D-D727466699A5}" src="https://github.com/user-attachments/assets/ea92aafc-8b29-4b74-b1a4-ac3d4d982e00" />

```sql
--7. hosted_at
CREATE TABLE hosted_at(
hosted_atID int primary key identity(1,1),
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) references guest(guestID),
FOREIGN KEY (occupied_room_id) references occupied_room(occupied_roomID));

Select * from hosted_at;

INSERT INTO hosted_at
Values (3,2);
```

<img width="274" height="74" alt="{4BC992B7-DB06-45BD-BF0B-79D6388692BF}" src="https://github.com/user-attachments/assets/e21d05a5-9e4d-46e7-ac81-08a1c957942c" />


<img width="729" height="640" alt="{09C88586-D834-4C93-816B-1EC255963AA9}" src="https://github.com/user-attachments/assets/e6a89f61-2ee2-4e82-a025-242c7e955aeb" />
