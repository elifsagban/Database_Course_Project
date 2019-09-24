select *
from victim;
#1.what is the sum of age greater than 25 years old victim?
select age, SUM(age) 
	from victim
where age >= 25
group by age ;

#2.what is the rate of male gender?
select gender, count(*) * 100.0 / sum(count(*)) over()
from victim
group by gender;

#3.show the name of white race.
select victim.victim_id, name 
from victim join race on victim.race_race_id = race.race_id
where race = "White";

#4.Show the killings which died on 17th day .
select * from incident;
select incident.incident_id, combined_date
from incident
where combined_date = "";

#5.what is the rate of killed by gunshot?
select armed, count(*) * 100.0 / sum(count(*)) over()
from armed
group by armed;

#6.what are the names of death in custody?
select victim.victim_id, name 
from victim join cause on victim.cause_cause_id = cause.cause_id
where cause = "Death in custody";

#7.what is the avarage of unemployement rate?
select unemp_rate, AVG(unemp_rate) 
from rate
where unemp_rate < 1;

#8What is the percentage of black race .
select race_id, SUM("White")/ Sum(race)
from race;

#9.Show the household income which is less than 30.000 dollars in Texas.
select household_income
from `mydb`.`income`
where household_income < 30000 and income_id in
(select location_id
from location join income on income.income_id = location.location_id
where state = "TX");

#10.Show the deceased name in Los Angeles with desc order.
select victim.victim_id, name
from  victim join location on victim.victim_id = location.location_id
where city = "Los Angeles"
order by name desc



