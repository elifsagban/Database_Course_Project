select *
from denormalized_table;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\police_killings(clean).csv'

into table denormalized_table  
fields terminated by "," 
lines terminated by '\r\n' 
IGNORE 1 LINES;


show variables like "secure_file_priv";