------#################  PROCEDURI STOCATE ######################------
--crearea unei proceduri stocate ce returneaza tabela angajati si toate datele care persista in ea
--daca efectuam exec angajati_procedure, se va returna datele din tabela
USE SistemGestionalBon
GO
DROP PROCEDURE IF EXISTS angajati_procedure
GO
CREATE PROCEDURE angajati_procedure
AS
BEGIN
    SELECT * FROM SistemGestionalBon.dbo.Angajati;
END;
go
--executarea procedurii angajati_procedure
exec angajati_procedure
go
------#######################################------
--procedura cu parametru care va afisa produsele ce au pretul mai mic decat parametrul introdus
USE SistemGestionalBon
GO
DROP PROCEDURE IF EXISTS produse_pret_redus
GO
CREATE PROCEDURE produse_pret_redus
    @pret int
AS
BEGIN
    SELECT * FROM SistemGestionalBon.dbo.Produse WHERE PretProdus < @pret;
END;
go
--executarea procedurii date
exec produse_pret_redus @pret = 50;
go
------#######################################------
--procedura daca poseda parametri de iesire
--procedura afiseaza soldul final dupa scaderea tututor bonurilor din suma initiala
USE SistemGestionalBon
GO
DROP PROCEDURE IF EXISTS achitari_bon
GO
CREATE PROCEDURE achitari_bon
    @SoldInitial INT,
    @SoldFinal INT OUTPUT
AS
BEGIN
    SET @SoldFinal = @SoldInitial - (SELECT SUM(SumaTotala) FROM SistemGestionalBon.dbo.Bon) 
END
GO
--pentru a executa procedura, este nevoie de introdus soldul initial si apoi executam pentru a vedea soldul ramas
DECLARE @SoldInitial INT = 10000; -- Valoarea initiala a soldului
DECLARE @SoldFinal INT; -- Variabila pentru rezultatul de iesire
EXEC achitari_bon @SoldInitial, @SoldFinal OUTPUT;
PRINT 'Soldul final este: ' + CAST(@SoldFinal AS NVARCHAR(10));
------#######################################------
--WITH RESULT SETS: Aceasta clauza este utilizata pentru a specifica structura setului de rezultate 
--intors de procedura stocata. In cazul de fata, este utilizata pentru a defini explicit coloanele si 
--tipurile de date ale setului de rezultate.
GO
USE SistemGestionalBon
GO
EXEC produse_pret_redus @pret = 50
WITH RESULT SETS
(([Id] INT NOT NULL,
[Nume] CHAR(30) NOT NULL,
[Magazin] INT NOT NULL,
[Pret] INT NOT NULL,
[Furnizor] INT NOT NULL))
go
------#################  FUNCTII ######################------
--- TIP Scalar
--aceasta functie de mai jos va parsa datele din tabela Produse si va returna pretul produsului in baza la ID
USE SistemGestionalBon
GO
DROP FUNCTION IF EXISTS GetPrice 
GO
CREATE FUNCTION GetPrice (@ProductId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Price INT;
    SELECT @Price = PretProdus 
    FROM Produse
    WHERE ProdusID = @ProductId;
    RETURN @Price;
END;
go
--executarea functiei
SELECT dbo.GetPrice(5); -- Exemplu: obbine pretul produsului cu ID-ul 5
go
--- TIP tabel
-- aceasta functie returneaza toate produsele dintr-un magazin anumit
USE SistemGestionalBon
GO
DROP FUNCTION IF EXISTS GetProductsByStore 
GO
CREATE FUNCTION GetProductsByStore (@StoreId INT)
RETURNS TABLE 
AS
RETURN 
(
    SELECT ProdusID, NumeProdus, MagazinID, PretProdus, FurnizorID
    FROM Produse 
    WHERE MagazinID = @StoreId
);
go
--apelarea functiei
SELECT * FROM dbo.GetProductsByStore(8); -- obtine toate produsele din magazinul cu ID-ul 8
go
--- TIP tabel multi-instructiune
USE SistemGestionalBon
GO
DROP FUNCTION IF EXISTS GetProductsByStoreAndSort 
GO
CREATE FUNCTION GetProductsByStoreAndSort (@StoreId INT)
RETURNS @ProductTable TABLE
(
    Id INT,
    Nume NVARCHAR(100),
    Pret DECIMAL(10, 2)
)
AS
BEGIN
    INSERT INTO @ProductTable (Id, Nume, Pret)
    SELECT ProdusId,NumeProdus,PretProdus
    FROM Produse 
    WHERE MagazinID = @StoreId
    ORDER BY PretProdus;
    RETURN;
END;
go
--executaarea functiei
DECLARE @StoreId INT = 8; -- ID-ul magazinului dorit
SELECT * FROM GetProductsByStoreAndSort(@StoreId);
go
------#################  DECLANSATOARE ######################------
-- - DML
--in continuare am creat un declansator care afiseaza un mesaj de informare cand se inserare date noi in tabela
-- Daca exista, eliminam declansatorul pentru a nu avea conflicte
USE SistemGestionalBon
GO
DROP TRIGGER IF EXISTS trig_Exemplu_Insert 
GO
-- Cream declansatorul DML
CREATE TRIGGER trig_Exemplu_Insert
ON Furnizori
AFTER INSERT
AS
BEGIN
    -- Afisam un mesaj la consola de mesaje
    PRINT 'O noua inregistrare a fost adaugata in tabela Furnizori.';
END;
GO
insert into Furnizori(FurnizorID, Denumire, Adresa)
VALUES (16, 'Srl sapr', 'Decebal 1212')
GO
----DDL
-- Cream declanșatorul DDL
--Acest declansator va fi declansat atunci când se creeaza sau se elimină o tabelă în baza de date.
--El utilizează funcția EVENTDATA() pentru a accesa informatii despre evenimentul DDL care a declanșat
--declanșatorul, precum tipul evenimentului și numele obiectului afectat. Apoi, un mesaj corespunzător 
--este afișat utilizând instrucțiunea PRINT.
USE SistemGestionalBon
GO
DROP TRIGGER IF EXISTS trig_DDL_Table;
GO
CREATE TRIGGER trig_DDL_Table
ON DATABASE
FOR CREATE_TABLE, DROP_TABLE
AS
BEGIN
    DECLARE @EventType NVARCHAR(100);
    DECLARE @ObjectName NVARCHAR(255);

    SET @EventType = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(100)');
    SET @ObjectName = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'nvarchar(255)');

    -- Verificăm dacă evenimentul este pentru crearea unei tabele
    IF @EventType = 'CREATE_TABLE'
    BEGIN
        PRINT 'O noua tabela a fost creata: ' + @ObjectName;
    END
    -- Verificăm dacă evenimentul este pentru eliminarea unei tabele
    ELSE IF @EventType = 'DROP_TABLE'
    BEGIN
        PRINT 'O tabela a fost eliminata: ' + @ObjectName;
    END
END;
go
drop table if exists test
go
create table test(
dasa int)
go
drop table test
go
----LOGON
-- Cream declanșatorul LOGON
--Acest declanșator este declanșat atunci când un utilizator se autentifică pe serverul SQL 
--Server și afișează un mesaj cu numele utilizatorului care s-a autentificat și data și ora autentificării.
USE SistemGestionalBon
GO
DROP TRIGGER IF EXISTS trig_Logon;
GO
CREATE TRIGGER trig_Logon
ON ALL SERVER WITH EXECUTE AS 'sa'
FOR LOGON
AS
BEGIN
    DECLARE @LoginName NVARCHAR(100);
    SET @LoginName = ORIGINAL_LOGIN();

    PRINT 'Utilizatorul ' + @LoginName + ' s-a autentificat pe server la data si ora ' + CONVERT(NVARCHAR(30), GETDATE(), 121);
END;
GO