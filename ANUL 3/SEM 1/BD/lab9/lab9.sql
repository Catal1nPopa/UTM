--subinterogarea data va afisa notele mai mare ca valoarea returnata de selectual care afiseze distinct de nota 5
select a.* from universitatea.univer.studenti_reusita a
where a.Nota > (select distinct(nota) from universitatea.univer.studenti_reusita where Nota = 5);

--va fi returnat numele profesorilor care au id gasit in studenti reusita si in tabela profesori
select a.Prenume_Profesor from universitatea.univer.profesori a
where a.Id_Profesor in (select b.Id_Profesor from universitatea.univer.studenti_reusita b where a.Id_Profesor = b.Id_Profesor)

--vor fi afisate datele despre tot istundetii in afara de acel care are id = 10
select a.* from universitatea.univer.studenti_reusita a
where a.Id_Student NOT LIKE (select Id_Student from universitatea.univer.studenti where Id_Student = 10) 

--vor fi afisati reusita la stundeti care au nota in valorile 5,6,4,1
SELECT a.*
FROM universitatea.univer.studenti_reusita a
WHERE a.Nota IN (SELECT Nota FROM universitatea.univer.studenti_reusita WHERE nota in (5, 6, 4 ,1));

--se vor disciplinele care sunt cu id mai mare decat toate sumele notelor grupate dupa grupa
select * from universitatea.univer.discipline
where Id_Disciplina > ALL (select sum(Nota) from universitatea.univer.studenti_reusita group by Id_Grupa)

--subselect in clauza from
select avg(tab.nota) as media_notelor from (select nota from universitatea.univer.studenti_reusita) as tab; 

--vor fi returnate datele care au nota mai mica ca orice nota = 8
select * from universitatea.univer.studenti_reusita
where nota < ANY (select nota from universitatea.univer.studenti_reusita where nota = 8)


select a.* from universitatea.univer.grupe a
where exists(select 1 from universitatea.univer.studenti_reusita where nota = 4 and a.Id_grupa = Id_grupa)
