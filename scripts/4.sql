USE pandemic;
ALTER TABLE infectious_cases_normalized ADD COLUMN start_date DATE DEFAULT NULL;
UPDATE infectious_cases_normalized SET start_date = MAKEDATE(`Year`, 1);
ALTER TABLE infectious_cases_normalized ADD COLUMN cur_date DATE DEFAULT NULL;
UPDATE infectious_cases_normalized 
SET cur_date = CURDATE();
ALTER TABLE infectious_cases_normalized ADD COLUMN subtract_year INT DEFAULT NULL;
UPDATE infectious_cases_normalized 
SET subtract_year = TIMESTAMPDIFF(YEAR, start_date, cur_date);
SELECT id, `Year`, start_date, cur_date, subtract_year 
FROM infectious_cases_normalized;
