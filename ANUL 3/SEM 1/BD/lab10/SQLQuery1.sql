CREATE TABLE Valabilitate (
    ProdusID INT PRIMARY KEY,
    DataProducere DATE,
    DataExpirare DATE,
    FOREIGN KEY (ProdusID) REFERENCES Produse(ProdusID)
);

-- Creare tabela Produse
CREATE TABLE Produse (
    ProdusID INT PRIMARY KEY,
    NumeProdus VARCHAR(255),
    MagazinID INT,
    PretProdus DECIMAL(10, 2),
    FurnizorID INT,
    FOREIGN KEY (MagazinID) REFERENCES Magazin(MagazinID),
    FOREIGN KEY (FurnizorID) REFERENCES Furnizori(FurnizorID)
);

-- Creare tabela Magazin
CREATE TABLE Magazin (
    MagazinID INT PRIMARY KEY,
    NumeMagazin VARCHAR(255),
    Adresa VARCHAR(255)
);

-- Creare tabela Furnizori
CREATE TABLE Furnizori (
    FurnizorID INT PRIMARY KEY,
    Denumire VARCHAR(255),
    Adresa VARCHAR(255)
);

-- Creare tabela ProduseBon
CREATE TABLE ProduseBon (
    BonID INT,
    ProdusID INT,
    Cantitate INT,
    PRIMARY KEY (BonID, ProdusID),
    FOREIGN KEY (BonID) REFERENCES Bon(BonID),
    FOREIGN KEY (ProdusID) REFERENCES Produse(ProdusID)
);

-- Creare tabela Bon
CREATE TABLE Bon (
    BonID INT PRIMARY KEY,
    CumparatorID INT,
    AngajatID INT,
    SumaTotala DECIMAL(10, 2),
    FOREIGN KEY (CumparatorID) REFERENCES Cumparatori(CumparatorID),
    FOREIGN KEY (AngajatID) REFERENCES Angajati(AngajatID)
);

-- Creare tabela Cumparatori
CREATE TABLE Cumparatori (
    CumparatorID INT PRIMARY KEY,
    Nume VARCHAR(255),
    Prenume VARCHAR(255),
    Telefon VARCHAR(15)
);

-- Creare tabela Angajati
CREATE TABLE Angajati (
    AngajatID INT PRIMARY KEY,
    Nume VARCHAR(255),
    Prenume VARCHAR(255),
    AnulNasterii INT,
    FunctieID INT,
    FOREIGN KEY (FunctieID) REFERENCES Functii(FunctieID)
);

-- Creare tabela Functii
CREATE TABLE Functii (
    FunctieID INT PRIMARY KEY,
    Denumire VARCHAR(255),
    SefFunctie VARCHAR(255)
);


--------------------------

-- Inserare date pentru tabela Valabilitate
INSERT INTO Valabilitate (ProdusID, DataProducere, DataExpirare)
VALUES
(1, '2022-01-01', '2022-12-31'),
(2, '2021-05-15', '2022-05-15'),
(3, '2022-03-10', '2023-03-10');
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Magazin
INSERT INTO Magazin (MagazinID, NumeMagazin, Adresa)
VALUES
(1, 'Magazin A', 'Strada Primaverii, nr. 123'),
(2, 'Magazin B', 'Bulevardul Victoriei, nr. 456'),
(3, 'Magazin C', 'Aleea Fructelor, nr. 789');
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Furnizori
INSERT INTO Furnizori (FurnizorID, Denumire, Adresa)
VALUES
(1, 'Furnizor 1', 'Strada Fagilor, nr. 10'),
(2, 'Furnizor 2', 'Aleea Florilor, nr. 25'),
(3, 'Furnizor 3', 'Bulevardul Rozelor, nr. 40');
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Produse
INSERT INTO Produse (ProdusID, NumeProdus, MagazinID, PretProdus, FurnizorID)
VALUES
(1, 'Produs 1', 1, 50.00, 1),
(2, 'Produs 2', 2, 30.00, 2),
(3, 'Produs 3', 3, 25.00, 3);
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela ProduseBon
INSERT INTO ProduseBon (BonID, ProdusID, Cantitate)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3);
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Bon
INSERT INTO Bon (BonID, CumparatorID, AngajatID, SumaTotala)
VALUES
(1, 1, 1, 110.00),
(2, 2, 2, 75.00),
(3, 3, 3, 50.00);
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Cumparatori
INSERT INTO Cumparatori (CumparatorID, Nume, Prenume, Telefon)
VALUES
(1, 'John', 'Doe', '123-456-7890'),
(2, 'Jane', 'Smith', '987-654-3210'),
(3, 'Alice', 'Johnson', '555-123-4567');
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Angajati
INSERT INTO Angajati (AngajatID, Nume, Prenume, AnulNasterii, FunctieID)
VALUES
(1, 'Manager', 'One', 1980, 1),
(2, 'Vanzator', 'Two', 1990, 2),
(3, 'Casier', 'Three', 1985, 3);
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Functii
INSERT INTO Functii (FunctieID, Denumire, SefFunctie)
VALUES
(1, 'Manager', 'Manager 1'),
(2, 'Vanzator', 'Manager 1'),
(3, 'Casier', 'Manager 1');

------------------------------------
------------------------------------
------------------------------------
-- Adăugare date suplimentare pentru tabela Valabilitate
INSERT INTO Valabilitate (ProdusID, DataProducere, DataExpirare)
VALUES
(4, '2021-11-15', '2022-11-15'),
(5, '2022-06-20', '2023-06-20'),
(6, '2021-08-05', '2022-08-05'),
(7, '2022-02-28', '2023-02-28'),
(8, '2021-12-10', '2022-12-10'),
(9, '2022-04-25', '2023-04-25'),
(10, '2022-07-01', '2023-07-01'),
(11, '2021-09-12', '2022-09-12'),
(12, '2022-01-05', '2023-01-05'),
(13, '2022-10-30', '2023-10-30');

-- Adăugare date suplimentare pentru tabela Magazin
INSERT INTO Magazin (MagazinID, NumeMagazin, Adresa)
VALUES
(4, 'Magazin D', 'Bulevardul Unirii, nr. 789'),
(5, 'Magazin E', 'Strada Luminii, nr. 456'),
(6, 'Magazin F', 'Aleea Viselor, nr. 123'),
(7, 'Magazin G', 'Strada Soarelui, nr. 101'),
(8, 'Magazin H', 'Bulevardul Lunii, nr. 222'),
(9, 'Magazin I', 'Aleea Stelelor, nr. 333'),
(10, 'Magazin J', 'Strada Norilor, nr. 444'),
(11, 'Magazin K', 'Bulevardul Ploilor, nr. 555'),
(12, 'Magazin L', 'Aleea Fulgilor, nr. 666'),
(13, 'Magazin M', 'Strada Vantului, nr. 777');

-- Adăugare date suplimentare pentru tabela Furnizori
INSERT INTO Furnizori (FurnizorID, Denumire, Adresa)
VALUES
(4, 'Furnizor 4', 'Aleea Miresmeilor, nr. 15'),
(5, 'Furnizor 5', 'Strada Perlelor, nr. 30'),
(6, 'Furnizor 6', 'Bulevardul Colibelor, nr. 45'),
(7, 'Furnizor 7', 'Aleea Bijuteriilor, nr. 60'),
(8, 'Furnizor 8', 'Strada Elegantei, nr. 75'),
(9, 'Furnizor 9', 'Bulevardul Refined, nr. 90'),
(10, 'Furnizor 10', 'Aleea Preciosilor, nr. 105'),
(11, 'Furnizor 11', 'Strada Eterna, nr. 120'),
(12, 'Furnizor 12', 'Bulevardul Modernitatii, nr. 135'),
(13, 'Furnizor 13', 'Aleea Impecabililor, nr. 150');

-- Adăugare date suplimentare pentru tabela Produse
INSERT INTO Produse (ProdusID, NumeProdus, MagazinID, PretProdus, FurnizorID)
VALUES
(4, 'Produs 4', 3, 40.00, 4),
(5, 'Produs 5', 1, 28.00, 5),
(6, 'Produs 6', 2, 22.00, 6),
(7, 'Produs 7', 1, 60.00, 7),
(8, 'Produs 8', 3, 35.00, 8),
(9, 'Produs 9', 2, 18.00, 9),
(10, 'Produs 10', 3, 45.00, 10),
(11, 'Produs 11', 1, 32.00, 11),
(12, 'Produs 12', 2, 25.00, 12),
(13, 'Produs 13', 1, 55.00, 13);

-- Adăugare date suplimentare pentru tabela ProduseBon
INSERT INTO ProduseBon (BonID, ProdusID, Cantitate)
VALUES
(2, 2, 2),
(3, 1, 1),
(3, 3, 2),
(4, 4, 3),
(4, 5, 1),
(5, 6, 2),
(5, 7, 1),
(6, 8, 3),
(6, 9, 1),
(7, 10, 2);

-- Adăugare date suplimentare pentru tabela Bon
INSERT INTO Bon (BonID, CumparatorID, AngajatID, SumaTotala)
VALUES
(4, 2, 2, 130.00),
(5, 3, 3, 90.00),
(6, 1, 1, 115.00),
(7, 2, 2, 78.00),
(8, 3, 3, 55.00),
(9, 1, 1, 75.00),
(10, 2, 2, 105.00),
(11, 3, 3, 68.00),
(12, 1, 1, 40.00),
(13, 2, 2, 50.00);

-- Adăugare date suplimentare pentru tabela Cumparatori
INSERT INTO Cumparatori (CumparatorID, Nume, Prenume, Telefon)
VALUES
(4, 'George', 'Brown', '111-222-3333'),
(5, 'Eva', 'White', '444-555-6666'),
(6, 'Michael', 'Black', '777-888-9999'),
(7, 'Olivia', 'Green', '123-456-7890'),
(8, 'Daniel', 'Yellow', '987-654-3210'),
(9, 'Sophia', 'Red', '555-123-4567'),
(10, 'Matthew', 'Purple', '111-222-3333'),
(11, 'Ava', 'Orange', '444-555-6666'),
(12, 'Ethan', 'Pink', '777-888-9999'),
(13, 'Emma', 'Gray', '123-456-7890');

-- Adăugare date suplimentare pentru tabela Angajati
INSERT INTO Angajati (AngajatID, Nume, Prenume, AnulNasterii, FunctieID)
VALUES
(4, 'Receptioner', 'Four', 1982, 4),
(5, 'Vanzator', 'Five', 1995, 5),
(6, 'Casier', 'Six', 1988, 6),
(7, 'Logistician', 'Seven', 1980, 7),
(8, 'Vanzator', 'Eight', 1992, 8),
(9, 'Casier', 'Nine', 1985, 9),
(10, 'Supraveghetor', 'Ten', 1987, 10),
(11, 'Vanzator', 'Eleven', 1990, 11),
(12, 'Casier', 'Twelve', 1983, 12),
(13, 'Manager', 'Thirteen', 1986, 13);

-- Adăugare date suplimentare pentru tabela Functii
INSERT INTO Functii (FunctieID, Denumire, SefFunctie)
VALUES
(4, 'Receptioner', 'Manager 1'),
(5, 'Vanzator', 'Manager 1'),
(6, 'Casier', 'Manager 1'),
(7, 'Logistician', 'Manager 1'),
(8, 'Vanzator', 'Manager 1'),
(9, 'Casier', 'Manager 1'),
(10, 'Supraveghetor', 'Manager 1'),
(11, 'Vanzator', 'Manager 1'),
(12, 'Casier', 'Manager 1'),
(13, 'Manager', 'Manager 1');

select * from dbo.Angajati;

select * from LucruIndividual.dbo.Bon;

select * from LucruIndividual.dbo.Cumparatori;

select * from dbo.Functii;

select * from dbo.Furnizori;

select * from dbo.Magazin;

select * from dbo.Produse;

select * from dbo.ProduseBon;

select * from dbo.Valabilitate;

-- Actualizare prenume în tabela Angajati
UPDATE Angajati SET Prenume = 'Popa' WHERE AngajatID = 1;
UPDATE Angajati SET Prenume = 'Negura' WHERE AngajatID = 2;
UPDATE Angajati SET Prenume = 'Dumitru' WHERE AngajatID = 3;
UPDATE Angajati SET Prenume = 'Gabriela' WHERE AngajatID = 4;
UPDATE Angajati SET Prenume = 'Radu' WHERE AngajatID = 5;
UPDATE Angajati SET Prenume = 'Ana' WHERE AngajatID = 6;
UPDATE Angajati SET Prenume = 'Vasile' WHERE AngajatID = 7;
UPDATE Angajati SET Prenume = 'Cristina' WHERE AngajatID = 8;
UPDATE Angajati SET Prenume = 'Mihai' WHERE AngajatID = 9;
UPDATE Angajati SET Prenume = 'Adrian' WHERE AngajatID = 10;
UPDATE Angajati SET Prenume = 'Elena' WHERE AngajatID = 11;
UPDATE Angajati SET Prenume = 'Iuliana' WHERE AngajatID = 12;
UPDATE Angajati SET Prenume = 'Valentin' WHERE AngajatID = 13;


-- Actualizare nume magazin în tabela Magazin
UPDATE Magazin SET NumeMagazin = 'Mega Store' WHERE MagazinID = 1;
UPDATE Magazin SET NumeMagazin = 'SuperMart' WHERE MagazinID = 2;
UPDATE Magazin SET NumeMagazin = 'Fresh Market' WHERE MagazinID = 3;
UPDATE Magazin SET NumeMagazin = 'Bonus' WHERE MagazinID = 4;
UPDATE Magazin SET NumeMagazin = 'Nr1' WHERE MagazinID = 5;
UPDATE Magazin SET NumeMagazin = 'Linella' WHERE MagazinID = 6;
UPDATE Magazin SET NumeMagazin = 'Kaufland' WHERE MagazinID = 7;
UPDATE Magazin SET NumeMagazin = 'Local' WHERE MagazinID = 8;
UPDATE Magazin SET NumeMagazin = 'Metro' WHERE MagazinID = 9;
UPDATE Magazin SET NumeMagazin = 'City Supermarket' WHERE MagazinID = 10;
UPDATE Magazin SET NumeMagazin = 'Mall' WHERE MagazinID = 11;
UPDATE Magazin SET NumeMagazin = 'Sun City' WHERE MagazinID = 12;
UPDATE Magazin SET NumeMagazin = 'Blue Sky Market' WHERE MagazinID = 13;

UPDATE Cumparatori SET Nume = 'Ion', Prenume = 'Popescu' WHERE CumparatorID = 1;
UPDATE Cumparatori SET Nume = 'Ana', Prenume = 'Ionescu' WHERE CumparatorID = 2;
UPDATE Cumparatori SET Nume = 'Mihai', Prenume = 'Georgescu' WHERE CumparatorID = 3;
UPDATE Cumparatori SET Nume = 'Elena', Prenume = 'Dumitru' WHERE CumparatorID = 4;
UPDATE Cumparatori SET Nume = 'Adrian', Prenume = 'Popa' WHERE CumparatorID = 5;
UPDATE Cumparatori SET Nume = 'Cristina', Prenume = 'Vasilescu' WHERE CumparatorID = 6;
UPDATE Cumparatori SET Nume = 'George', Prenume = 'Stancu' WHERE CumparatorID = 7;
UPDATE Cumparatori SET Nume = 'Andreea', Prenume = 'Munteanu' WHERE CumparatorID = 8;
UPDATE Cumparatori SET Nume = 'Alex', Prenume = 'Constantinescu' WHERE CumparatorID = 9;
UPDATE Cumparatori SET Nume = 'Laura', Prenume = 'Moldovan' WHERE CumparatorID = 10;
UPDATE Cumparatori SET Nume = 'Vlad', Prenume = 'Alexandrescu' WHERE CumparatorID = 11;
UPDATE Cumparatori SET Nume = 'Raluca', Prenume = 'Radu' WHERE CumparatorID = 12;
UPDATE Cumparatori SET Nume = 'Ciprian', Prenume = 'Iancu' WHERE CumparatorID = 13;


-- Actualizare nume produs în tabela Produse pentru produse alimentare
UPDATE Produse SET NumeProdus = 'Făină integrală bio' WHERE ProdusID = 1;
UPDATE Produse SET NumeProdus = 'Ovăz ecologic' WHERE ProdusID = 2;
UPDATE Produse SET NumeProdus = 'Miere de albine pură' WHERE ProdusID = 3;
UPDATE Produse SET NumeProdus = 'Quinoa organica' WHERE ProdusID = 4;
UPDATE Produse SET NumeProdus = 'Ulei de măsline extravirgin' WHERE ProdusID = 5;
UPDATE Produse SET NumeProdus = 'Nuci organice' WHERE ProdusID = 6;
UPDATE Produse SET NumeProdus = 'Ciocolată neagră bio' WHERE ProdusID = 7;
UPDATE Produse SET NumeProdus = 'Fructe uscate mix' WHERE ProdusID = 8;
UPDATE Produse SET NumeProdus = 'Ceai verde organic' WHERE ProdusID = 9;
UPDATE Produse SET NumeProdus = 'Mazăre congelată' WHERE ProdusID = 10;
UPDATE Produse SET NumeProdus = 'Oțet balsamic premium' WHERE ProdusID = 11;
UPDATE Produse SET NumeProdus = 'Lapte de migdale' WHERE ProdusID = 12;
UPDATE Produse SET NumeProdus = 'Sos de roșii organic' WHERE ProdusID = 13;

-- Actualizare nume și prenume în tabela Angajati
UPDATE Angajati SET Nume = 'Popescu', Prenume = 'Ion' WHERE AngajatID = 1;
UPDATE Angajati SET Nume = 'Negura', Prenume = 'Ana' WHERE AngajatID = 2;
UPDATE Angajati SET Nume = 'Dumitru', Prenume = 'Mihai' WHERE AngajatID = 3;
UPDATE Angajati SET Nume = 'Gabriela', Prenume = 'Vasile' WHERE AngajatID = 4;
UPDATE Angajati SET Nume = 'Radu', Prenume = 'Elena' WHERE AngajatID = 5;
UPDATE Angajati SET Nume = 'Ana', Prenume = 'Adrian' WHERE AngajatID = 6;
UPDATE Angajati SET Nume = 'Vasile', Prenume = 'Cristina' WHERE AngajatID = 7;
UPDATE Angajati SET Nume = 'Cristian', Prenume = 'Mihai' WHERE AngajatID = 8;
UPDATE Angajati SET Nume = 'Mihai', Prenume = 'Alexandru' WHERE AngajatID = 9;
UPDATE Angajati SET Nume = 'Adrian', Prenume = 'Laura' WHERE AngajatID = 10;
UPDATE Angajati SET Nume = 'Elena', Prenume = 'Vlad' WHERE AngajatID = 11;
UPDATE Angajati SET Nume = 'Iuliana', Prenume = 'Raul' WHERE AngajatID = 12;
UPDATE Angajati SET Nume = 'Valentin', Prenume = 'Ciprian' WHERE AngajatID = 13;

UPDATE Functii SET SefFunctie = 'Marius Popescu' WHERE FunctieID = 1;
UPDATE Functii SET SefFunctie = 'Andreea Ionescu' WHERE FunctieID = 2;
UPDATE Functii SET SefFunctie = 'George Dumitrescu' WHERE FunctieID = 3;
UPDATE Functii SET SefFunctie = 'Marius Popescu' WHERE FunctieID = 4;
UPDATE Functii SET SefFunctie = 'Andreea Ionescu' WHERE FunctieID = 5;
UPDATE Functii SET SefFunctie = 'George Dumitrescu' WHERE FunctieID = 6;
UPDATE Functii SET SefFunctie = 'Marius Popescu' WHERE FunctieID = 7;
UPDATE Functii SET SefFunctie = 'Andreea Ionescu' WHERE FunctieID = 8;
UPDATE Functii SET SefFunctie = 'George Dumitrescu' WHERE FunctieID = 9;
UPDATE Functii SET SefFunctie = 'Marius Popescu' WHERE FunctieID = 10;
UPDATE Functii SET SefFunctie = 'Andreea Ionescu' WHERE FunctieID = 11;
UPDATE Functii SET SefFunctie = 'George Dumitrescu' WHERE FunctieID = 12;
UPDATE Functii SET SefFunctie = 'Marius Popescu' WHERE FunctieID = 13;


UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 5 WHERE BonID = 5;
UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 13 WHERE BonID = 6;
UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 8 WHERE BonID = 7;
UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 9 WHERE BonID = 8;
UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 8 WHERE BonID = 9;
UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 6 WHERE BonID = 10;
UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 3 WHERE BonID = 11;
UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 13 WHERE BonID = 12;
UPDATE LucruIndividual.dbo.Bon SET CumparatorID = 12 WHERE BonID = 13;


--Interogare cu INNER JOIN pentru a obține produsele, magazinul și prețurile:
SELECT P.NumeProdus, M.NumeMagazin, P.PretProdus
FROM Produse P
INNER JOIN Magazin M ON P.MagazinID = M.MagazinID;

--Interogare cu LEFT JOIN pentru a obține produsele și magazinul, inclusiv produsele fără magazin asociat:
SELECT P.NumeProdus, M.NumeMagazin
FROM Produse P
LEFT JOIN Magazin M ON P.MagazinID = M.MagazinID;

--Interogare cu RIGHT JOIN pentru a obține magazinul și produsele, inclusiv magazinurile fără produse asociate:
SELECT M.NumeMagazin, P.NumeProdus
FROM Produse P
RIGHT JOIN Magazin M ON P.MagazinID = M.MagazinID;

--Interogare cu FULL OUTER JOIN pentru a obține toate produsele și toate magazinurile:
SELECT P.NumeProdus, M.NumeMagazin
FROM Produse P
FULL OUTER JOIN Magazin M ON P.MagazinID = M.MagazinID;

--Interogare cu INNER JOIN și filtrare pe baza datelor din tabela Valabilitate:
SELECT P.NumeProdus, V.DataExpirare
FROM Produse P
INNER JOIN Valabilitate V ON P.ProdusID = V.ProdusID
WHERE V.DataExpirare > '2022-12-31';

--Interogare cu INNER JOIN și operatori logici pentru a obține produsele scadente în anumit interval:
SELECT P.NumeProdus, V.DataExpirare
FROM Produse P
INNER JOIN Valabilitate V ON P.ProdusID = V.ProdusID
WHERE V.DataExpirare BETWEEN '2023-01-01' AND '2023-12-31';

--Interogare cu INNER JOIN și funcții pentru a obține produsele cu denumiri mai lungi de 20 caractere:
SELECT P.NumeProdus
FROM Produse P
WHERE LEN(P.NumeProdus) > 20;

--Interogare cu INNER JOIN și funcții de agregare pentru a obține suma totală pentru fiecare bon de cumpărături:
SELECT B.BonID, SUM(P.PretProdus * PB.Cantitate) AS SumaTotala
FROM Bon B
INNER JOIN ProduseBon PB ON B.BonID = PB.BonID
INNER JOIN Produse P ON PB.ProdusID = P.ProdusID
GROUP BY B.BonID;

--Interogare cu INNER JOIN și clauza HAVING pentru a obține bonurile cu suma totală mai mare de 100:
SELECT B.BonID, SUM(P.PretProdus * PB.Cantitate) AS SumaTotala
FROM Bon B
INNER JOIN ProduseBon PB ON B.BonID = PB.BonID
INNER JOIN Produse P ON PB.ProdusID = P.ProdusID
GROUP BY B.BonID
HAVING SUM(P.PretProdus * PB.Cantitate) > 100;

--Interogare cu INNER JOIN și funcții de string pentru a obține cumpărătorii cu numele care conțin litera 'a':
SELECT C.Nume, C.Prenume
FROM Cumparatori C
WHERE LOWER(C.Nume) LIKE '%a%';

--Interogare cu INNER JOIN și funcții de string pentru a obține furnizorii cu adresa care începe cu 'Strada':
SELECT F.Denumire, F.Adresa
FROM Furnizori F
WHERE LOWER(F.Adresa) LIKE 'strada%';

--Interogare cu INNER JOIN și funcții de data pentru a obține angajații născuți într-un anumit an:
SELECT A.Nume, A.Prenume
FROM Angajati A
WHERE A.AnulNasterii = '1980';

--Interogare cu INNER JOIN și ORDER BY pentru a obține cele mai scumpe produse:
SELECT TOP 5 P.NumeProdus, P.PretProdus
FROM Produse P
ORDER BY P.PretProdus DESC;

--Interogare cu INNER JOIN și funcții de agregare pentru a obține suma totală pentru fiecare furnizor:
SELECT F.Denumire, SUM(P.PretProdus) AS SumaTotala
FROM Furnizori F
INNER JOIN Produse P ON F.FurnizorID = P.FurnizorID
GROUP BY F.Denumire;

--Interogare cu INNER JOIN și funcții de agregare pentru a obține media prețurilor produselor pentru fiecare magazin:
SELECT M.NumeMagazin, AVG(P.PretProdus) AS MediePret
FROM Magazin M
INNER JOIN Produse P ON M.MagazinID = P.MagazinID
GROUP BY M.NumeMagazin;

--Interogare cu INNER JOIN și funcții de agregare pentru a obține numărul total de angajați pentru fiecare funcție:
SELECT F.Denumire, COUNT(A.AngajatID) AS NumarAngajati
FROM Functii F
INNER JOIN Angajati A ON F.FunctieID = A.FunctieID
GROUP BY F.Denumire;

--Interogare cu INNER JOIN și funcții de agregare pentru a obține suma totală cheltuită de fiecare cumpărător:
SELECT C.Nume, C.Prenume, SUM(P.PretProdus * PB.Cantitate) AS SumaTotala
FROM LucruIndividual.dbo.Cumparatori C
INNER JOIN LucruIndividual.dbo.Bon B ON C.CumparatorID = B.CumparatorID
INNER JOIN LucruIndividual.dbo.ProduseBon PB ON B.BonID = PB.BonID
INNER JOIN LucruIndividual.dbo.Produse P ON PB.ProdusID = P.ProdusID
GROUP BY C.Nume, C.Prenume;
