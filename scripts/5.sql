USE pandemic;

DELIMITER //

CREATE FUNCTION calculate_year_difference(year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE year_date DATE;
    DECLARE date_now DATE;

    SET year_date = MAKEDATE(year, 1);
    SET date_now = CURDATE();

    RETURN TIMESTAMPDIFF(YEAR, year_date, date_now);
END //

DELIMITER ;

ALTER TABLE infectious_cases_normalized 
ADD COLUMN year_difference_function INT DEFAULT NULL;

UPDATE infectious_cases_normalized 
SET year_difference_function = calculate_year_difference(`Year`);

SELECT id, `Year`, year_difference_function 
FROM infectious_cases_normalized;
SELECT * FROM infectious_cases_normalized;