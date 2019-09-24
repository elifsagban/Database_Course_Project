insert into location(city, state, latitude, longitude)
select distinct  city, state, latitude, longitude
from denormalized_table;

select concat(year, ' ', month, ' ', day) AS  combined_date
from denormalized_table;
ALTER TABLE incident
MODIFY combined_date VARCHAR(45) NOT NULL;
insert into incident(combined_date)
select distinct  combined_date
from denormalized_table;
insert into police_agency(agency_name)
select distinct  agency_name
from denormalized_table;
insert into race(race)
select distinct  race
from denormalized_table;

insert into cause(cause)
select distinct  cause
from denormalized_table;

insert into state(state_FIPS, state, location_location_id)
select distinct  state_FIPS, state, location_location_id
from denormalized_table;
insert into tract(tract_code, tract_des, tract_pop, location_location_id, state_state_id)
select distinct  tract_code, tract_des, tract_pop, location_location_id, state_state_id
from denormalized_table;
insert into county(county_FIPS, location_location_id)
select distinct county_FIPS, location_location_id
from denormalized_table;
insert into city(city, county_county_id, state_state_id)
select distinct city, county_county_id, state_state_id
from denormalized_table;

insert into share(share_white, share_black, share_hispanic)
select distinct share_white, share_black, share_hispanic
from denormalized_table;

insert into rate(pov_rate, unemp_rate, college_rate)
select distinct pov_rate, unemp_rate, college_rate
from denormalized_table;

insert into income(personal_income, household_income, county_income, calculated_income)
select distinct personal_income, household_income, county_income, calculated_income
from denormalized_table;

insert into bucket(county_bucket, nat_bucket)
select distinct county_bucket, nat_bucket
from denormalized_table;

insert into location(city, state, latitude, longitude)
select distinct  city, state, latitude, longitude
from denormalized_table;
SET FOREIGN_KEY_CHECKS =0;
insert into State_Statistics(share_share_id, rate_rate_id, income_income_id, bucket_bucket_id, location_location_id)
select distinct share_share_id, rate_rate_id, income_income_id, bucket_bucket_id, location_location_id
from denormalized_table;




insert into victim(name, age, gender, police_agency_police_id, incident_incident_id, location_location_id, race_race_id, cause_cause_id)
select distinct  name, age, gender, police_agency_police_id, incident_incident_id, location_location_id, race_race_id, cause_cause_id
from denormalized_table;

insert into armed(armed, victim_victim_id)
select distinct  armed, victim_victim_id
from denormalized_table;


