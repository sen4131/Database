use lab6;

#4
select *
from counties
where name like 'Prince%'
order by statecode;

#5
select states.statecode, states.population_2010
from states 
inner join senators
on states.statecode = senators.statecode
where senators.name = 'Richard Lugar';

#6
select count(*)
from counties 
join states
on counties.statecode = states.statecode
where states.name = 'Kentucky';

#7
select name
from counties
where statecode = 'WV'
order by name desc;

#8
select counties.name as 'County Name', states.name as 'State Name', states.population_2010 as 'Pop in 2010'
from counties
join states
on counties.statecode = states.statecode
where states.population_2010 > 2500000;

#9
select name as 'State'
from states
where admitted_to_union = (select max(admitted_to_union) from states);

#10
select name
from senators
where senators.name not in (select chairman from committees); 
