

insert into location(city, state, latitude, longitude)
select distinct  city, state, latitude, longitude
from denormalized_table;



select concat(month, ' ', day, ' ', year) AS combined_date
from denormalized_table;
UPDATE  denormalized_table SET combined_date =0 
WHERE combined_date IS NULL;
ALTER TABLE denormalized_table
MODIFY combined_date DATETIME NOT NULL;



ALTER TABLE denormalized_table
ADD combined_date VARCHAR(45) NOT NULL;





insert into incident(combined_date)
select distinct  combined_date
from denormalized_table;

insert into victim(name, age, gender, police_agency_police_id, incident_incident_id, location_location_id)
select distinct  name, age, gender, police_agency_police_id, incident_incident_id, location_location_id
from denormalized_table;
