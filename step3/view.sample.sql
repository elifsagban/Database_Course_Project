#view

Create View Vlocation As
 Select location_id, city,state,latitude,longitude  From location;

select *
from Vlocation
where location_id =3;

Create View Cityyyy As
Select city_id, city from city;

select*
from Cityyyy
where city_id >145;

#stored procedure

DELIMITER //
CREATE PROCEDURE GetByState(IN stateName CHAR(2))
 BEGIN
 SELECT * 
 FROM location
 WHERE state = stateName;
 END //
DELIMITER ;

CALL GetByState('TX');


DELIMITER //
CREATE PROCEDURE CountByCity(
 IN city VARCHAR(45),
 OUT total INT)
BEGIN
 SELECT count(location_id)
 INTO total
 FROM location
 WHERE cityy = city;
END//
DELIMITER ;

CALL CountByRate('Phoenix',@total);
SELECT @total;



DELIMITER $$
CREATE PROCEDURE set_counter(INOUT count INT(4),IN inc INT(4))
BEGIN
 SET count = count + inc;
END$$
DELIMITER ;

SET @counter = 1;
CALL set_counter(@counter,1);
CALL set_counter(@counter,1); 
CALL set_counter(@counter,5);
SELECT @counter; 
