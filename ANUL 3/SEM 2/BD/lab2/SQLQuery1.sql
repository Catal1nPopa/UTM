--informatiile catorva vafiabile globale

print 'versiune:' + @@version

print 'server:' + @@servername

print 'limba:' + @@language

print 'maxim conexiuni:' + str(@@max_connections)

--Cu ajutorul expresiei CASE evaluam suma totala achitata din tabelul bon

SELECT BonID,CumparatorID,
	case when SumaTotala > 100 
	then 'Suma mare'
	else 'Suma mica'
	end as cantitate
	from SistemGestionalBon.dbo.Bon
order by BonID

---Mai jos am realizat o interogare care foloseste instrcutiunile IF,ELSE si WHILE
--am declarat caateva variabile iar apoi am folosite datele din table Furnizori
--pentru a afisa adresele care contin cuvantul strada in adresa sa.
select * from SistemGestionalBon.dbo.Furnizori

DECLARE @i INT = 1;
DECLARE @rowCount INT;
DECLARE @id INT;
DECLARE @adresa NVARCHAR(MAX);

SELECT @rowCount = COUNT(*) FROM SistemGestionalBon.dbo.Furnizori;

WHILE @i <= @rowCount
BEGIN
    SELECT @id = FurnizorID, @adresa = Adresa FROM SistemGestionalBon.dbo.Furnizori WHERE FurnizorID = @i;

    IF @adresa LIKE '%Strada%'
    BEGIN
        PRINT 'Adresa cu id-ul ' + CAST(@id AS NVARCHAR(MAX)) + ' este: ' + @adresa;
    END

    SET @i = @i + 1;
END

---In aceasta interogare am folost la fel IF, ELSE si While
--In final afisez numele care incep cu litear 'A' din tabela Cumparatori
select * from SistemGestionalBon.dbo.Cumparatori;

DECLARE @l INT = 1;
DECLARE @rowCounts INT;
DECLARE @id1 INT;
DECLARE @numee NVARCHAR(MAX);

SELECT @rowCounts = COUNT(*) FROM SistemGestionalBon.dbo.Cumparatori;

WHILE @l <= @rowCounts
BEGIN
    SELECT @id1 = CumparatorID, @numee = Nume FROM SistemGestionalBon.dbo.Cumparatori WHERE CumparatorID = @l;

    IF LEFT(@numee, 1) = 'A'
    BEGIN
        PRINT 'Numele cu id-ul ' + CAST(@id1 AS NVARCHAR(MAX)) + ' este: ' + @numee;
    END

    SET @l= @l + 1;
END

--In interogarea de mai jost folosesc instructiunile BREAK,CONTINUE si RETURN
-- In rezultat voi obtine afisarea dunimirii sefului care are functia de manager
--select * from SistemGestionalBon.dbo.Functii;

DECLARE @num INT = 1;
DECLARE @rowCount2 INT;
DECLARE @FunctieID INT;
DECLARE @Denumire NVARCHAR(MAX);
DECLARE @SefFunctie NVARCHAR(MAX);

SELECT @rowCount2 = COUNT(*) FROM SistemGestionalBon.dbo.Functii;

WHILE @num <= @rowCount2
BEGIN
    SELECT @FunctieID = FunctieID, @Denumire = Denumire, @SefFunctie = SefFunctie FROM SistemGestionalBon.dbo.Functii WHERE FunctieID = @num;

    IF @Denumire LIKE '%Manager%'
    BEGIN
        PRINT 'Functia cu FunctieID ' + CAST(@FunctieID AS NVARCHAR(MAX)) + ' are sef cu denumirea: ' + @SefFunctie;
    END
    ELSE
    BEGIN
        SET @num = @num + 1;
        CONTINUE;
    END

    SET @num = @num + 1;
END

--In continuarea am folosit GOTO
--Aici se va executa loop pana cand @i va deveni mai mare decat numarul total de randuri si va trece deodata la LoopEnd
DECLARE @i2 INT = 1;
DECLARE @rowCount3 INT;
DECLARE @FunctieID2 INT;
DECLARE @Denumire2 NVARCHAR(MAX);
DECLARE @SefFunctie2 NVARCHAR(MAX);

SELECT @rowCount3 = COUNT(*) FROM SistemGestionalBon.dbo.Functii;

LoopStart:
IF @i2 > @rowCount3
    GOTO LoopEnd;

SELECT @FunctieID2 = FunctieID, @Denumire2 = Denumire, @SefFunctie2 = SefFunctie FROM SistemGestionalBon.dbo.Functii WHERE FunctieID = @i2;

IF @Denumire2 LIKE '%Manager%'
BEGIN
    PRINT 'Functia cu FunctieID ' + CAST(@FunctieID2 AS NVARCHAR(MAX)) + ' are sef cu denumirea: ' + @SefFunctie2;
END

SET @i2 = @i2 + 1;
GOTO LoopStart;

LoopEnd:

--Aceasta interogare va astepta 30 secunde iar apoi va afisa toate randurile din tabela Valabilitate
WAITFOR DELAY '00:00:30';
SELECT ProdusID, DataProducere, DataExpirare
FROM SistemGestionalBon.dbo.Valabilitate;

--In aceasta interogare afisez produsid si dataepirare, iar daca data este nula atunci se afiseaza Data nedisponibila
SELECT 
    ProdusID,
    COALESCE(DataExpirare,DataProducere, 'Data nedisponibilă') AS DataExpirare
FROM 
    SistemGestionalBon.dbo.Valabilitate;


--Daca valoare AngajatID este 2, atunci se va afisa null
select * from SistemGestionalBon.dbo.Bon

SELECT 
    BonID,
    NULLIF(AngajatID, 1) AS Disponibilitate_angajat
FROM 
    SistemGestionalBon.dbo.Bon;

--Mai jos este p interogare care va returna mesajul de eraore deoarece imaprtirea la 0 nu are sens
--pentru acceasta am folost try catch
BEGIN TRY
DECLARE @num1 int,
		@num2 int,
		@res int
SET @num1 = 200
SET @num2 = 0
SET @res = @num1/@num2
END TRY
BEGIN CATCH 
	PRINT 'A aparut eroare'
END CATCH
