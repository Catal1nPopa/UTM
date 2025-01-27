
    DROP DATABASE LucruIndividual;

CREATE DATABASE LucruIndividual;

USE LucruIndividual;

-- Creare tabela Magazin
CREATE TABLE Magazin (
    MagazinID TINYINT PRIMARY KEY,
    NumeMagazin VARCHAR(255),
    Adresa VARCHAR(255)
);

-- Creare tabela Furnizori
CREATE TABLE Furnizori (
    FurnizorID SMALLINT PRIMARY KEY,
    Denumire VARCHAR(255),
    Adresa VARCHAR(255)
);

-- Creare tabela Cumparatori
CREATE TABLE Cumparatori (
    CumparatorID INT PRIMARY KEY,
    Nume VARCHAR(255),
    Prenume VARCHAR(255),
    Telefon VARCHAR(15)
);

-- Creare tabela Functii
CREATE TABLE Functii (
    FunctieID BIT PRIMARY KEY,
    Denumire VARCHAR(255),
    SefFunctie VARCHAR(255)
);

-- Creare tabela Angajati
CREATE TABLE Angajati (
    AngajatID SMALLINT PRIMARY KEY,
    Nume VARCHAR(255),
    Prenume VARCHAR(255),
    AnulNasterii INT,
    FunctieID BIT,
    FOREIGN KEY (FunctieID) REFERENCES Functii(FunctieID)
);

-- Creare tabela Produse
CREATE TABLE Produse (
    ProdusID INT PRIMARY KEY,
    NumeProdus VARCHAR(255),
    MagazinID TINYINT,
    PretProdus DECIMAL(10, 2),
    FurnizorID SMALLINT,
    FOREIGN KEY (MagazinID) REFERENCES Magazin(MagazinID),
    FOREIGN KEY (FurnizorID) REFERENCES Furnizori(FurnizorID)
);

CREATE TABLE Valabilitate (
    ProdusID INT PRIMARY KEY,
    DataProducere DATE,
    DataExpirare DATE,
    FOREIGN KEY (ProdusID) REFERENCES Produse(ProdusID)
);

-- Creare tabela Bon
CREATE TABLE Bon (
    BonID INT PRIMARY KEY,
    CumparatorID INT,
    AngajatID SMALLINT,
    SumaTotala DECIMAL(10, 2),
    FOREIGN KEY (CumparatorID) REFERENCES Cumparatori(CumparatorID),
    FOREIGN KEY (AngajatID) REFERENCES Angajati(AngajatID)
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



INSERT INTO LucruIndividual.dbo.Valabilitate (ProdusID, DataProducere, DataExpirare)
VALUES
(1, '2022-01-01', '2022-12-31'),
(2, '2021-05-15', '2022-05-15'),
(3, '2022-03-10', '2023-03-10');
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Magazin
INSERT INTO LucruIndividual.dbo.Magazin (MagazinID, NumeMagazin, Adresa)
VALUES
(1, 'Magazin A', 'Strada Primaverii, nr. 123'),
(2, 'Magazin B', 'Bulevardul Victoriei, nr. 456'),
(3, 'Magazin C', 'Aleea Fructelor, nr. 789');
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Furnizori
INSERT INTO LucruIndividual.dbo.Furnizori (FurnizorID, Denumire, Adresa)
VALUES
(1, 'Furnizor 1', 'Strada Fagilor, nr. 10'),
(2, 'Furnizor 2', 'Aleea Florilor, nr. 25'),
(3, 'Furnizor 3', 'Bulevardul Rozelor, nr. 40');
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Produse
INSERT INTO LucruIndividual.dbo.Produse (ProdusID, NumeProdus, MagazinID, PretProdus, FurnizorID)
VALUES
(1, 'Produs 1', 1, 50.00, 1),
(2, 'Produs 2', 2, 30.00, 2),
(3, 'Produs 3', 3, 25.00, 3);
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela ProduseBon
INSERT INTO LucruIndividual.dbo.ProduseBon (BonID, ProdusID, Cantitate)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3);
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Bon
INSERT INTO LucruIndividual.dbo.Bon (BonID, CumparatorID, AngajatID, SumaTotala)
VALUES
(1, 1, 1, 110.00),
(2, 2, 2, 75.00),
(3, 3, 3, 50.00);
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Cumparatori
INSERT INTO LucruIndividual.dbo.Cumparatori (CumparatorID, Nume, Prenume, Telefon)
VALUES
(1, 'John', 'Doe', '123-456-7890'),
(2, 'Jane', 'Smith', '987-654-3210'),
(3, 'Alice', 'Johnson', '555-123-4567');
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Angajati
INSERT INTO LucruIndividual.dbo.Angajati (AngajatID, Nume, Prenume, AnulNasterii, FunctieID)
VALUES
(1, 'Manager', 'One', 1980, 1),
(2, 'Vanzator', 'Two', 1990, 2),
(3, 'Casier', 'Three', 1985, 3);
-- Adaugă alte rânduri după nevoie...

-- Inserare date pentru tabela Functii
INSERT INTO LucruIndividual.dbo.Functii (FunctieID, Denumire, SefFunctie)
VALUES
(1, 'Manager', 'Manager 1'),
(2, 'Vanzator', 'Manager 1'),
(3, 'Casier', 'Manager 1');