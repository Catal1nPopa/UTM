--Tranzactii si blocari
--tranzactie implicita (stabileste orice instructiune individuala INSERT, UPDATE sau DELETE ca unitate de tranzactie)
--tranzacția de mai jos va insera in baza de date in tabela Furnizori un rand nou cu date
USE SistemGestionalBon
GO
INSERT INTO SistemGestionalBon.dbo.Furnizori
(FurnizorID, Denumire, Adresa)
VALUES(26, 'Consum SRL2', 'Decebal 4343/1')
GO
--select * from SistemGestionalBon.dbo.Furnizori
--tranzactie explictita
--aceasta tranzactie de asemenea va insera on rand nou cu date, dar deja folosim BEGIN TRANSACTION si COMMIT
GO
BEGIN TRANSACTION
INSERT INTO SistemGestionalBon.dbo.Furnizori (FurnizorID, Denumire, Adresa)
VALUES(20, 'Test2 SRL', 'Decebal 164/222')
COMMIT; 
GO
--Mai jos este un exemplu de tranzactie cand la fel inseram date intr-o tabela si salvam transactia respectiva
BEGIN TRANSACTION 
INSERT INTO SistemGestionalBon.dbo.Furnizori (FurnizorID, Denumire, Adresa)
VALUES(22, 'Import SRL', 'Sarmizegetusa 22')
SAVE TRANSACTION a
--ROLLBACK se foloseste pentru a anula tranzactia
ROLLBACK TRANSACTION a
GO;
--mai jos am realizat o tranzactie imbricata care se include intr-o tranzactie externa si depinde de ea
--mai intai se adauga un produs in tabela Produse si daca a fost inserat cu succes, se va insera si in tabela cu valabilitate
BEGIN TRANSACTION; -- Tranzactia externa incepe

    INSERT INTO Produse(ProdusID, NumeProdus, MagazinID, PretProdus, FurnizorID) VALUES (16, 'Chifir', 3, 15,4);

    BEGIN TRANSACTION; -- Tranzactia imbricata incepe

        -- Verificam daca inserarea in Orders a avut loc cu succes
        IF @@ERROR = 0
        BEGIN
            -- Daca nu sunt erori, inseram in OrderDetails
            INSERT INTO Valabilitate(ProdusID, DataProducere, DataExpirare) VALUES (16, GETDATE(), '02.04.2024');
        END

    COMMIT TRANSACTION; -- Tranzactia imbricata se incheie

-- Tranzactia externa se incheie
COMMIT TRANSACTION;
GO
  --mai jos este un exmplu cum putem vizualiza jurnalul de tranzactii folosind functia fn_dblog
SELECT * FROM fn_dblog(NULL, NULL);
GO
--realizarea unui nivel de izolare Read Uncommitted
-- Tranzacția 1
BEGIN TRANSACTION;
UPDATE Bon SET SumaTotala = SumaTotala - 50.00 WHERE BonID = 1;
-- In acest moment, datele modificate de tranzactia 1 nu sunt inca comise

-- Tranzacția 2
BEGIN TRANSACTION;
SELECT SumaTotala FROM Bon WHERE BonId = 1; -- Va citi modificarile necomise din tranzactia 1
COMMIT; -- Comite tranzactia 1 si confirma modificarile
GO
--exemplu de utilizare a nivelului de izolare read committed
-- Tranzactia 1
BEGIN TRANSACTION;
UPDATE Bon SET SumaTotala= SumaTotala- 10.00 WHERE BonID= 4;
COMMIT; -- Confirma si comite modificarile

-- Tranzactia 2
BEGIN TRANSACTION;
SELECT SumaTotala FROM Bon WHERE BonID = 1; -- Va citi doar datele comise, nu modificarile necomise
COMMIT;
GO
--exemplu de nivel de izolare Repeatable Read unde la fel avem 2 tranzactii date ca exemplu de aplicare
-- Tranzactia 1
BEGIN TRANSACTION;
SELECT SumaTotala FROM Bon WHERE BonID = 1; -- Va citi balanțta curenta
-- In acest moment, alte tranzactii nu pot modifica datele citite in cadrul acestei tranzactii

-- Tranzactia 2
BEGIN TRANSACTION;
UPDATE Bon SET SumaTotala = SumaTotala + 100.00 WHERE BonID = 1;
COMMIT;

-- Continuare tranzactia 1
SELECT SumaTotala FROM Bon WHERE BonID = 1; -- Va citi aceeasi balanta ca la inceputul tranzactiei
COMMIT;
GO
--exemplu  nivel de izolare Serializable unde tranzactiile sunt rulate ca si cum in serie una dupa alta
-- Tranzactia 1
BEGIN TRANSACTION;
SELECT SumaTotala FROM Bon WHERE BonID = 1; -- Va citi balanta curenta
-- in acest moment, nicio alta tranzactie nu poate modifica datele citite in cadrul acestei tranzactii

-- Tranzactia 2
BEGIN TRANSACTION;
UPDATE Bon SET SumaTotala = SumaTotala + 100.00 WHERE BonID = 1; -- Va astepta blocarea pana la finalizarea tranzactiei 1
COMMIT; -- Se va comite dupa ce tranzactia 1 se finalizeaza

-- Continuare tranzactia 1
SELECT SumaTotala FROM Bon WHERE BonID = 1; -- Va citi aceeasi balanta ca la inceputul tranzactiei
COMMIT;
GO
--Mia jos am folosit o blocare cu parametrul TABLE, care are valoare implicita si stabileste escaladarea blocarii 
--la nivelul tabelului (la fel sunt parameetrii auto si disable)
ALTER TABLE [myschema].[MagazinCopy] 
SET ( LOCK_ESCALATION =  TABLE )

