--left join
--a fost realizata interogarea, in care se foloseste left join, se vor afisa datele din prima tabela si cele care corespund conditiei din tabela 2
select a.Id_Student,
		a.Id_Disciplina,
		a.Nota,
		b.Nume_Profesor,
		b.Prenume_Profesor,
		b.Adresa_Postala_Profesor
from univer.studenti_reusita a
left join univer.profesori b on a.Id_Profesor = b.Id_Profesor;

--iner join este cel mai des folosit, el face elgatura dintre doua tabele  in baza unui camp anumit
--inner join
select a.Id_Disciplina, b.Disciplina, b.Nr_ore_plan_disciplina from univer.studenti_reusita a,
univer.discipline b
where a.Id_Disciplina = b.Id_Disciplina;

--opusul la left join
--right join
select a.Id_Student,
		a.Id_Disciplina,
		a.Nota,
		b.Nume_Profesor,
		b.Prenume_Profesor,
		b.Adresa_Postala_Profesor
from univer.studenti_reusita a
right join univer.profesori b on a.Id_Profesor = b.Id_Profesor;

--va afisa toate datele din abele tabele
--full join
select a.Id_Disciplina, b.Disciplina, b.Nr_ore_plan_disciplina from univer.studenti_reusita a
full join univer.discipline b on a.Id_Disciplina = b.Id_Disciplina;


--union
--uneste doua rezultate de select, unde este nevoie sa fie acelasi numar de coloane cu aceleasi denumiri si elimina dublicatele
select a.* from univer.studenti_reusita a
where a.Nota > 5 and  a.Data_Evaluare = ('2023-11-17')
union 
select a.* from univer.studenti_reusita a
where a.Nota > 5 and  a.Data_Evaluare = ('2023-11-14')

--functioneaza la fel ca UNION simplu doar ca nu exclude dublicatele
--union all
select a.* from univer.studenti_reusita a
where a.Nota > 5 and  a.Data_Evaluare > ('2023-11-10')
union all
select a.* from univer.studenti_reusita a
where a.Nota > 5 and  a.Data_Evaluare > ('2023-11-14');

--returneaza datele care se intersecteaza din primul select cu al doilea
--INTERSECT
select b.Id_Grupa, b.Nota
from univer.studenti_reusita b
where b.Tip_Evaluare like 'fizic'
INTERSECT
select b.Id_Grupa, b.Nota
from univer.studenti_reusita b
where b.Tip_Evaluare like 'oral';

--returneaza datele din primul select, care nu se gasesc in selectul 2
--EXCEPT
select a.* from univer.discipline a where a.Nr_ore_plan_disciplina in(60, 76)
EXCEPT
select a.* from univer.discipline a where a.Disciplina like '%Pro%';

--cross join
--fiecare rand din primul tabel cu toate randurile din tabelul al doilea
select * from univer.discipline cross join univer.studenti_reusita
