-- 1

CREATE SCHEMA pandemic;
USE pandemic;

SELECT * FROM `pandemic`.`infectious_cases`;

-- 2

CREATE TABLE pandemic.entities (
    entity_id INT AUTO_INCREMENT PRIMARY KEY,
    Entity VARCHAR(255) NOT NULL,
    Code VARCHAR(10) NOT NULL,
    UNIQUE(Entity, Code)
);

CREATE TABLE pandemic.infectious_cases (
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT NOT NULL,
    Year INT NOT NULL,
    Number_yaws INT,
    polio_cases INT,
    cases_guinea_worm INT,
    Number_rabies INT,
    Number_malaria INT,
    Number_hiv INT,
    Number_tuberculosis INT,
    Number_smallpox INT,
    Number_cholera_cases INT,
    FOREIGN KEY (entity_id) REFERENCES pandemic.entities(entity_id),
    UNIQUE(entity_id, Year)
);

CREATE TABLE pandemic.infectious_cases (
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT NOT NULL,
    Year INT NOT NULL,
    Number_yaws INT,
    polio_cases INT,
    cases_guinea_worm INT,
    Number_rabies INT,
    Number_malaria INT,
    Number_hiv INT,
    Number_tuberculosis INT,
    Number_smallpox INT,
    Number_cholera_cases INT,
    FOREIGN KEY (entity_id) REFERENCES pandemic.entities(entity_id),
    UNIQUE(entity_id, Year)
);


-- 3

SELECT 
    e.Entity,
    e.Code,
    AVG(ic.Number_rabies) AS avg_rabies,
    MIN(ic.Number_rabies) AS min_rabies,
    MAX(ic.Number_rabies) AS max_rabies,
    SUM(ic.Number_rabies) AS sum_rabies
FROM pandemic.infectious_cases ic
JOIN pandemic.entities e ON ic.entity_id = e.entity_id
GROUP BY e.Entity, e.Code
ORDER BY avg_rabies DESC
LIMIT 10;


-- 4

SELECT
    entity_id,
    Year,
    DATE(CONCAT(Year, '-01-01')) AS year_start_date,
    CURRENT_DATE() AS today_date,
    TIMESTAMPDIFF(YEAR, DATE(CONCAT(Year, '-01-01')), CURRENT_DATE()) AS years_difference
FROM pandemic.infectious_cases;

