select * from SistemGestionalBon.dbo.Magazin

SELECT * FROM sys.schemas;

select * from sys.sysusers;




-- Create Schema Sales
CREATE SCHEMA myschema;

-- Copy Magazin from Another Schema
SELECT *
INTO SistemGestionalBon.myschema.MagazinCopy
FROM SistemGestionalBon.dbo.Magazin;

-- Grant Permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON myschema.MagazinCopy TO Catalin
DENY SELECT ;

select * from SistemGestionalBon.myschema.MagazinCopy


GRANT SELECT ON myschema.MagazinCopy TO Catalin2