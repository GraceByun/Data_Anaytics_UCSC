/*Part2 
Hyunjung Byun 
Mysql
*/


/*Insert values in People table*/
INSERT INTO People (Person_ID, Given_Name, Hagis1_Name, Hagis2_Name, Birthday, Birthplace, Sex)  
VALUES (1, 'Tom', 'Mary Cambell', 'David Fenton', '1970-11-02', 'SantaClara', 'M');
INSERT INTO People (Person_ID, Given_Name, Hagis1_Name,Hagis2_Name, Birthday, Birthplace,Sex ) 
VALUES (2, 'Jessica', 'Grace Noon', 'Patrick Salma', '1963-05-13', 'Davis', 'F');
INSERT INTO People (Person_ID, Given_Name, Hagis1_Name,Hagis2_Name, Birthday, Birthplace,Sex )
VALUES (3, 'Travis',' Hanna Morgan', 'Norman Chase', '1988-03-11', 'Iowa', 'M');
INSERT INTO People (Person_ID, Given_Name, Hagis1_Name,Hagis2_Name, Birthday, Birthplace,Sex ) 
VALUES (4, 'Jina',' Sara Chi', 'Nikan Brone', '1944-04-30', 'San Jose', 'F'); 
INSERT INTO People (Person_ID, Given_Name, Hagis1_Name,Hagis2_Name, Birthday, Birthplace,Sex )
VALUES (5, 'Velona',' Patricha Fallen', 'Jame Cook', '1992-09-04', 'Alaska', 'M');

/*Insert values in Aliases table*/
insert into Aliases (Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial, Alias_ID,Is_Birth_Record, Is_Death_Record)
values('Jim', 'Barina', 'Colorado', '1980-11-10', 8890, 1, TRUE, null);
insert into Aliases (Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial, Alias_ID,Is_Birth_Record, Is_Death_Record)
values('Choa', 'Lina', 'Sanfransisco', '2002-03-14', 10001, 2, TRUE, FALSE);
insert into Aliases (Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial, Alias_ID,Is_Birth_Record, Is_Death_Record)
values('Jina',' Sara Chi', 'Georgia', '1965-05-02', 10034, 3, TRUE, null);
insert into Aliases (Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial, Alias_ID,Is_Birth_Record, Is_Death_Record)
values('Velona', ' Patricha Fallen', 'Georgia', '2007-05-02', 9990, 4, TRUE, null);
insert into Aliases (Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial, Alias_ID,Is_Birth_Record, Is_Death_Record)
values('Jessica', 'Grace Noon', 'Davis', '1989-03-22', 9998, 5, TRUE, true);
 insert into Aliases (Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial, Alias_ID,Is_Birth_Record, Is_Death_Record)
values('Sara Chi',' Jina', 'Georgia', '1965-05-02', 10034, 7, TRUE, null);
insert into Aliases (Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial, Alias_ID,Is_Birth_Record, Is_Death_Record)
values('Barina', 'Jim', 'Sanfransisco', '2002-03-14', 10005, 8, TRUE, null);
insert into Aliases (Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial, Alias_ID,Is_Birth_Record, Is_Death_Record)
values('Jina',' jim', 'San jose', '1977-08-03', 10564, 3, TRUE, null);

/*Insert values in Department table*/
insert into Departments (Department_ID, Department_Name, Department_Head_ID, 
 Department_Head_Title,  Department_Head_Term, Department_Parent,
 Department_Phone,Department_Address)
values(1, 'paliament', 3, 'boss', 7, null, 1111111111, '98021 Santa Clara');

insert into Departments (Department_ID, Department_Name, Department_Head_ID, 
 Department_Head_Title,  Department_Head_Term, Department_Parent,
 Department_Phone,Department_Address)
values(2, 'upper branch', 2, 'Director', 6, null, 1111111222, '98024 Santa Clara');

insert into Departments (Department_ID, Department_Name, Department_Head_ID, 
 Department_Head_Title,  Department_Head_Term, Department_Parent,
 Department_Phone,Department_Address)
values(3, 'lower branch', 2, 'Director', 4, null, 1111111333, '98025 Santa Clara');

insert into Departments (Department_ID, Department_Name, Department_Head_ID, 
 Department_Head_Title,  Department_Head_Term, Department_Parent,
 Department_Phone,Department_Address)
values(4, 'Suprem court', 1, 'Super', 100, null, 1111111444, '98085 Santa Clara');

/*Insert values in Officials table*/
insert into Officials(Official_ID , Title, Department_ID, Salary,Term_Date, Termination_Type)
values(456, 'staff', 1, 5000, '1999-03-22','non');
insert into Officials(Official_ID , Title, Department_ID, Salary,Term_Date, Termination_Type)
values(578, 'manger', 2, 7000, '2010-08-20','non');
insert into Officials(Official_ID , Title, Department_ID, Salary,Term_Date, Termination_Type)
values(354, 'staff', 4, 10000, '2007-03-30','black');
insert into Officials(Official_ID , Title, Department_ID, Salary,Term_Date, Termination_Type)
values(457, 'staff', 3, 8000, '2005-07-02','black');

/*Insert values in Registrars table*/
insert into Registrars(Registrar_ID, Place_Name, Start_Date,End_Date, Given_Name, Address,Phone)
values(1,'Santa Clara', '2007-11-10', null, 'Jim', '546768 Santa Clara', 333444555);
 insert into Registrars(Registrar_ID, Place_Name, Start_Date,End_Date, Given_Name, Address,Phone)
values(2,'Santa Jose', '2017-02-10', null, 'Jessica', '55767 San Jose', 333444888);
 insert into Registrars(Registrar_ID, Place_Name, Start_Date,End_Date, Given_Name, Address,Phone)
values(3,'Gergia', '1999-03-10', '2018-01-01', 'Sara', '36467 Georgia', 22444111);

/*Insert values in Guardian_Person table*/
insert into Guardian_Person (Guardian_ID, Person_ID ) values(1, 3);
insert into Guardian_Person (Guardian_ID, Person_ID ) values(2, 5);

/*Insert values in Official_Person  table*/
insert into Official_Person (Official_ID, Person_ID) value (456, 5);
insert into Official_Person (Official_ID, Person_ID) value (578, 1);
insert into Official_Person (Official_ID, Person_ID) value (354, 3);
insert into Official_Person (Official_ID, Person_ID) value (457, 4);

/*Question 1*/
Select  Given_Name, Hagis1_Name, Birthplace, Birthday from People where Given_Name in ('Jessica');

/*Question 2*/
SELECT * FROM People  where Given_Name LIKE '%Ve%';

/*Question 3*/
SELECT * from People where Birthday BETWEEN '1960-01-01'AND '1980-12-31' order by Person_ID;


/*Question 4*/
 SELECT Aliases.Given_Name, Aliases.Hagis_Name, Aliases.Place_Name FROM Aliases
 LEFT JOIN People ON Aliases.Given_Name = People.Given_Name
 where  People.Given_Name is null;

/*Question 5*/
select * from Aliases where Is_Death_Record in (true);

/*Question 6*/
 SELECT Departments.Department_Name, Departments.Department_Phone FROM Departments
 LEFT JOIN Officials ON Officials.Department_ID = Departments.Department_ID
 where Officials.Official_ID = 3;
 
 /*Question 7*/
 select Hagis_Name from Aliases where  Alias_ID in(3);
 
 /*Question 8*/
 SELECT COUNT(*) FROM People;
 
/*Question 9*/
SELECT  Place_Name, COUNT(*) AS `Number of People` FROM Aliases GROUP BY  Place_Name;

/*Question 10*/ 
SELECT
    SUM(IF(age <= 2,1,0)) as 'Under 2',
    SUM(IF(age BETWEEN 3 and 12,1,0)) as '3-12',
    SUM(IF(age BETWEEN 13 and 21,1,0)) as '13-21',
    SUM(IF(age BETWEEN 22 and 45,1,0)) as '22-45',
    SUM(IF(age BETWEEN 46 and 75,1,0)) as '46-75',
    SUM(IF(age > 75,1,0)) as 'More than 75'

FROM (SELECT TIMESTAMPDIFF(YEAR,  Birthday, CURDATE()) AS age FROM People) as derived;

/*Question 11*/
select Registrar_ID, Given_Name, Phone from Registrars
 where Place_Name ='Gergia' and Start_Date='1999-03-10';
 
/*Question 12*/
SELECT Official_Person.Official_ID, Official_Person.Person_ID, Officials.title, Officials.Termination_Type as BlackList FROM Official_Person 
left JOIN Officials ON Officials.Official_ID = Official_Person.Official_ID 
where  Officials.Termination_Type ='black';

 /*Question 13*/
SELECT People.Given_Name, People.Person_ID FROM People
 left JOIN Guardian_Person  ON Guardian_Person.Person_ID = People. Person_ID
 where  Guardian_Person.Guardian_ID is null
 limit 1000;
 
 /*Question 14*/
 select Given_Name,Hagis1_Name, Hagis2_Name from People order by Birthday asc;
 

 /*Question 15*/ 
 /*

For Aliases table, first five items can be unique by using unique

constraint Five_Name UNIQUE
(Given_Name, Hagis_Name, Place_Name, Connection_Date, Connection_Serial)

Also by using unqiue,
for People table, registrars are able to avoid duplicated Given_Name if other 4 names are same.

constraint No_Duplicate UNIQUE
(Given_Name ,  Hagis1_Name, Hagis2_Name, Birthday , Birthplace)

For Registrars table, by using primary key, make to columns as a composite key
constraint Composite_Key PRIMARY KEY (Place_Name, Start_Date)
   
 
 */
 
/*Question 16*/

create user Staff @'localhost' identified by 'Staff';

GRANT SELECT ON Guardians TO Staff;
GRANT SELECT ON Officials TO Staff;
GRANT SELECT ON Registrars TO Staff;
GRANT SELECT ON Departments TO Staff;

CREATE VIEW Alias_Secret as select Given_Name, Hagis_Name, Place_Name,
Connection_Date, Connection_Serial, Alias_ID, Is_Death_Record from Aliases;
GRANT SELECT ON Alias_Secret TO  Staff;

create user RegistrarLiaison @'localhost'  identified by 'RegistrarLiaison';
GRANT SELECT,UPDATE,INSERT,DELETE ON Aliases TO  RegistrarLiaison;
GRANT SELECT,UPDATE,INSERT,DELETE ON Registrars TO  RegistrarLiaison;

create user Recorders @'localhost'  identified by 'Recorders';
GRANT SELECT,UPDATE,INSERT,DELETE ON People TO  Recorders;
GRANT SELECT,UPDATE,INSERT,DELETE ON Official_Person TO  Recorders;
GRANT SELECT,UPDATE,INSERT,DELETE ON Guardian_Person TO  Recorders;
GRANT SELECT,UPDATE,INSERT,DELETE ON Registrar_Person TO  Recorders;

grant all privileges on Amazonia.* to classdb  @'localhost';


