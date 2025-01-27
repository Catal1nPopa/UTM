
--aceasta interogare va afisa careva date, care au fost returna in urma folosirii functiilor analitice
--MIN, MAX, SUM,AVG si COUNT
select MIN(a.Nota) as nota_minima,
		MAX(a.Nota) as nota_maxima,
		SUM(a.Nota) as suma_notelor,
		AVG(a.Nota) as media_notelor,
		COUNT(a.Id_Student) as numarul_studenti
from universitatea.univer.studenti_reusita a;

--aceasta interogare va afisa numarul de stundeti, tipul de evaluare si nota din tabela stundeti_reusita
--datele vor fi grupate dupp coloana tip evaluare si nota, la fel nota trebuie sa fie >= cu 5
select count(a.Id_Student) as numar_studenti,
		a.Tip_Evaluare, 
		a.Nota 
from universitatea.univer.studenti_reusita a
group by a.Tip_Evaluare, a.Nota
having (a.Nota) >= 5;



