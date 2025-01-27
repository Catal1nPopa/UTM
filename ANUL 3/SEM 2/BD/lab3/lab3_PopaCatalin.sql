--crearea unei proceduri ce returneaza tabela angajati
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
--executarea procedurii
exec angajati_procedure;
go
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
--executarea procedurii
exec produse_pret_redus @pret = 50;
go
--procedura care face update la numar la un anumit cumparator, are ca paramteri cumparaotrid si telefon nou
USE SistemGestionalBon
GO
DROP PROCEDURE IF EXISTS update_phone
GO
CREATE PROCEDURE update_phone
    @CumparatorID INT,
    @Telefon NVARCHAR(100)
AS
BEGIN
    UPDATE SistemGestionalBon.dbo.Cumparatori SET Telefon = @Telefon WHERE CumparatorID = @CumparatorID;
END;
go
--executarea procedurii
EXEC update_phone @CumparatorID = 2, @Telefon = '043435312';
go
--FUNCTIE care returneaza din tabela randurile care au un nume specific
USE SistemGestionalBon
GO
DROP FUNCTION IF EXISTS cumparator_dupa_nume
GO
CREATE FUNCTION cumparator_dupa_nume
(
    @Nume NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM SistemGestionalBon.dbo.Cumparatori WHERE Nume = @Nume
);
go
SELECT * FROM dbo.cumparator_dupa_nume('Mihai');
go
--functie care va returna datele despre un cumaparator dupa un anumit id al sau
USE SistemGestionalBon
GO
DROP FUNCTION IF EXISTS cumparator_dupa_id
GO
CREATE FUNCTION cumparator_dupa_id
(
    @id int
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM SistemGestionalBon.DBO.Cumparatori WHERE CumparatorID = @id
);
go
SELECT * FROM dbo.cumparator_dupa_id(8);

