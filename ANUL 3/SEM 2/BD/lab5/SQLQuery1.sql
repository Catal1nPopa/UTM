--creare unui backup complet a bazei de date SistemGestionalBon care se va salva cu nuemele backup.bak
--in directoriul D
BACKUP DATABASE SistemGestionalBon
TO DISK = 'D:\backup.bak'
WITH FORMAT, 
     MEDIANAME = 'SQLServerBackups', 
     NAME = 'test';


--backup diferential a bazei de date SistemGestionalBon, iarasi specific directoriul de salvare 
--prin WITH DIFERENTIAL indicam ca este un backup diferential
BACKUP DATABASE SistemGestionalBon
TO DISK = 'D:\backup_diff.bak'
WITH DIFFERENTIAL, 
     MEDIANAME = 'SQLServerBackups', 
     NAME = 'Differential Backup of MyDatabase';

--backup de jurnal de tranzactii asupra bazei de date SistemGestionalBon
--este specificat directoriul de salvare, si am folosit LOG, pentru a specifica ca este un jurnal de tranzactii
BACKUP LOG SistemGestionalBon
TO DISK = 'D:\backup_log.trn'
WITH FORMAT,
     MEDIANAME = 'SQLServerBackups',
     NAME = 'Log Backup of MyDatabase';

--verificam daca baza de date SistemGestionalBonComplet exista si daca ecista o sttergem
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'SistemGestionalBonComplet')
BEGIN
    ALTER DATABASE nume_baza_date SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE nume_baza_date;
END
GO

--restaurarea folosind backup complex, pentru a restabili baza de date si specificam directoriul cate fisier
--with recovery aduca baza de date online dupa restaurare
USE master;
GO
RESTORE DATABASE SistemGestionalBon
FROM DISK = 'D:\backup.bak'
WITH NORECOVERY;

--se restaureaza diferential al bazei de date
--WITH RECOVERY este utilizat dupa restaurarea backup-ului complet pentru a permite adaugarea 
--backup-ului diferential si se aduce baza de date online
USE master;
GO
RESTORE DATABASE SistemGestionalBon
FROM DISK = 'D:\backup_diff.bak'
WITH RECOVERY; -- Restaureaza backup-ul diferential si aduce baza de date online

--restaurarea backup de jurnal de tranzactii
--se restaureaza mai intai backup-ul complet al bazei de date fara a aduce baza de date online
USE master;
GO
RESTORE DATABASE SistemGestionalBon
FROM DISK = 'D:\backup_log.trn'
WITH RECOVERY;
