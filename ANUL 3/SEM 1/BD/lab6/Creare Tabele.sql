
drop table universitatea.univer.studenti_reusita ;

create table universitatea.univer.studenti(
Id_Student INT NOT NULL PRIMARY KEY,
Nume_Student VARCHAR(40),
Prenume_Student VARCHAR(40),
Data_Nastere_Student DATE,
Adresa_Postala_Student VARCHAR(50)
)

create table universitatea.univer.profesori(
Id_Profesor INT NOT NULL PRIMARY KEY,
Nume_Profesor VARCHAR(40),
Prenume_Profesor VARCHAR(40),
Adresa_Postala_Profesor VARCHAR(50)
)

create table universitatea.univer.studenti_reusita(
Id_Student INT NOT NULL,
Id_Disciplina INT NOT NULL,
Id_Profesor INT NOT NULL,
Id_Grupa INT NOT NULL,
Tip_Evaluare VARCHAR(30) NOT NULL,
Nota DECIMAL(4,2),
Data_Evaluare DATE,
CONSTRAINT PK_Reusita PRIMARY KEY (Id_Student, Id_Disciplina,Id_Profesor, Id_Grupa, Tip_Evaluare)
)


--inserare in tabela studenti

insert into universitatea.univer.studenti(Id_Student, Nume_Student, Prenume_Student,Data_Nastere_Student, Adresa_Postala_Student)
VALUES (2,'Budeanu','Cristian', '2002-02-28', 'budeanu.cristian@email.com'),
 (3,'Popa','Ecaterina', '2002-03-21', 'popa.ecaterina@email.com'),
(4,'Garlia','Ion', '2005-01-22', 'garlia.ion@email.com'),
(5,'Batir','Elena', '1934-12-02', 'batir.elena@email.com'),
(6,'Lescenco','Victor', '1979-10-07', 'lescenco.victor@email.com'),
(7,'Abed','Yusef', '2012-08-27', 'yusef.abed@email.com'),
(8,'Stavriu','Nikita', '1999-02-21', 'nikita.1212@email.com'),
(9,'Conicov','Dan', '1959-03-29', 'conicov.conicov@email.com'),
(10,'Frunza','Mihail', '2004-11-09', 'frunzamail1212@email.com');


--inserare in tabela studenti_reusita

insert into universitatea.univer.studenti_reusita(Id_Student, Id_Disciplina, Id_Profesor,Id_Grupa, Tip_Evaluare, Nota, Data_Evaluare)
VALUES 
(1,100,33, 1, 'oral',10,'2023-11-17'),
(2,120,11, 2, 'fizic',8,'2023-11-14'),
 (3,112,44, 3, 'fizic',4,'2023-10-10'),
(4,110,55, 2, 'oral',10,'2023-07-21'),
(5,105,66, 3, 'oral',9,'2023-11-17'),
(6,109,77, 3, 'oral',10,'2023-11-17'),
(7,116,88, 2, 'fizic',1,'2023-11-14'),
(8,108,54, 1, 'fizic',2,'2023-10-10'),
(9,119,21, 1, 'fizic',5,'2023-10-10'),
(10,117,29, 2, 'oral',8,'2023-11-14');

--inserare in profesori

insert into universitatea.univer.profesori(Id_Profesor,Nume_Profesor, Prenume_Profesor, Adresa_Postala_Profesor)
VALUES 
(33,'Frunza','Ion','frunza.i@gmail.com'),
(11, 'Cristea','Catalin','crs.cat@gmail.com'),
 (44,'Manole','Vasile','vasilevasile@gmail.com'),
(55,'Mirza','Cristina','cristina31@gmail.com'),
(66,'Cebotaru','Catalina','catalinacebotaru@gmail.com'),
(77,'Crudu','Mihaela','mihaelacrudu@gmail.com'),
(88,'Ioana','Dumitru','ionana2211@gmail.com'),
(54,'Popa','Cristian','popa31212'),
(21,'Gavriliuc','Adina','gavriliuc212'),
(29,'Budeanu','Victor','budeanu2121@gmail.com');

select * from universitatea.univer.profesori

insert into universitatea.univer.studenti_reusita(Id_Student, Id_Disciplina, Id_Profesor,Id_Grupa, Tip_Evaluare, Nota, Data_Evaluare)
VALUES 
(14,100,33, 1, 'oral',NULL,'2023-11-17'),
(18,120,11, 2, 'fizic',NULL,'2023-11-14');