select *
from stg_base_pesquisa;

select *
from pesquisa;

select count(p.cod_pessoa), ae.animal, p.genero
from pessoa as p
inner join pesquisa as pq on pq.cod_pessoa = p.cod_pessoa
inner join animal_estimacao as ae on pq.cod_animal_estimacao = ae.cod_animal_estimacao 
where p.genero = 'Masculino' and ae.animal = 'cachorro'
group by p.genero;

create temporary table idade
select cod_pessoa, genero, data_nascimento, timestampdiff(year, p.data_nascimento,now()) as idade
from pessoa as p;

select *
from idade;

select avg(i.idade), i.genero, b.bebida, c.clima
from idade as i
inner join pesquisa as pq on pq.cod_pessoa = i.cod_pessoa
inner join bebida as b on pq.cod_bebida = b.cod_bebida
inner join clima as c on pq.cod_clima = c.cod_clima
where b.bebida = 'Chá' and c.clima = 'frio'
group by i.genero;

select p.genero, h.hobbie, count(h.hobbie) as qnt_hobbie
from pessoa as p
inner join pesquisa as pq on p.cod_pessoa = pq.cod_pessoa
inner join hobbie as h on pq.cod_hobbie = h.cod_hobbie
where p.genero = 'Feminino'
group by h.hobbie
order by qnt_hobbie desc;

select i.genero, ae.animal, h.hobbie, avg(i.idade)
from idade as i
inner join pesquisa as pq on pq.cod_pessoa = i.cod_pessoa
inner join animal_estimacao as ae on pq.cod_animal_estimacao = ae.cod_animal_estimacao
inner join hobbie as h on pq.cod_hobbie = h.cod_hobbie
where h.hobbie = 'Escrever' and ae.animal = 'tartaruga'
group by i.genero;


select p.genero, h.hobbie, count(h.hobbie) as qnt_hobbie
from pessoa as p
inner join pesquisa as pq on p.cod_pessoa = pq.cod_pessoa
inner join hobbie as h on pq.cod_hobbie = h.cod_hobbie
where p.genero = 'Feminino'
group by h.hobbie
order by qnt_hobbie desc;

select genero, beb.bebida, count(pes.cod_pessoa) as qtd
from pesquisa p
join pessoa pes on p.cod_pessoa = pes.cod_pessoa
join bebida beb on beb.cod_bebida = p.cod_bebida
where pes.data_nascimento >= '1990-10-01' and beb.bebida = 'Água'
group by pes.genero, beb.bebida;


select genero, beb.bebida, count(pes.cod_pessoa) as qtd
from pesquisa p
join pessoa pes on p.cod_pessoa = pes.cod_pessoa
join bebida beb on beb.cod_bebida = p.cod_bebida
group by beb.bebida, pes.genero
order by count(pes.cod_pessoa) desc;


select h.hobbie, avg(i.idade), count(p.cod_pessoa)
from pesquisa pq
join pessoa p on pq.cod_pessoa = p.cod_pessoa
join hobbie h on h.cod_hobbie = pq.cod_hobbie
join idade i on i.cod_pessoa = pq.cod_pessoa
where h.hobbie = 'Assistir TV';
