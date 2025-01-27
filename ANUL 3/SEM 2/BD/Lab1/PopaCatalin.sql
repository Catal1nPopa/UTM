-- T-SQL de mai jos va crea o schema noua cu numele new_schema , 
--autorizata de Catalin in baza de date SistemGestionaBon
USE SistemGestionalBon
go
Create schema new_schema AUTHORIZATION Catalin;

--In continuare, am folosit grant pentru a aloca select si inserare pentru schema
--new_schema, pentru utilizatorul Catalin3
USE SistemGestionalBon
go
grant select, insert on schema :: new_schema to  Catalin3;

--Mai jos este T-SQL pentru crearea sinonimului MARKET pentru tabela Magazin
CREATE SYNONYM MARKET
FOR new_schema.Magazin
go
select * from new_schema.market	

--In continuare la fel ca si crearea unui sinonim, putem sterge un sinonim, spre exemplu MARKET
drop synonym MARKET

-- Mai jos voi crea un index clustered numit nr_magazin si se va folosi in tabela MagazinCopy
USE SistemGestionalBon
CREATE CLUSTERED INDEX nr_magazin
on SistemGestionalBon.new_schema.MagazinCopy (MagazinID)


--In continuare voi crea un index nonclustered
USE SistemGestionalBon
CREATE INDEX index_non
on SistemGestionalBon.new_schema.MagazinCopy (MagazinID, NumeMagazin)

--Stergea unui INDEX
USE SistemGestionalBon
go
drop index nr_magazin on SistemGestionalBon.new_schema.MagazinCopy

--Cu ajutorul acestor 2 comenzi, putem vizualiza informatia de spre indecsi.
select * from sys.indexes

exec sp_helpindex 'new_Schema.MagazinCopy'

select * from  SistemGestionalBon.new_schema.MagazinCopy

--Crearea vederii care va afisa datele din tabele magazin cu criteriul ca nu se vor afisa maagazinele care u la sfarsit litera t
USE SistemGestionalBon
GO
CREATE VIEW new_view AS
SELECT * FROM new_schema.MagazinCopy
where NumeMagazin not like '%t'
GO
