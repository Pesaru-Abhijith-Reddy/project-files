/* TASK 1*/
SELECT CONTINENT, NAME, POPULATION FROM COUNTRY AS C1 WHERE population = 
(SELECT MAX(POPULATION) FROM COUNTRY AS C2 WHERE C1.CONTINENT = C2.CONTINENT AND POPULATION > 0) ORDER BY POPULATION DESC;

/* TASK 2*/
SELECT SUM(POPULATION) AS CONTINENT_SUM FROM COUNTRY GROUP BY CONTINENT;
SELECT AVG (CONTINENT_SUM) FROM (SELECT CONTINENT, SUM(POPULATION) AS CONTINENT_SUM FROM COUNTRY GROUP BY CONTINENT) AS CP;


/*TASK 3*/
SELECT DISTINCT(CODE), NAME, CONTINENT, LANGUAGE FROM COUNTRY, COUNTRYLANGUAGE 
WHERE LANGUAGE = 'FRENCH' AND CODE IN (SELECT COUNTRYCODE FROM countrylanguage WHERE LANGUAGE = 'FRENCH') AND CONTINENT ='EUROPE';


/* TASK 4*/
SELECT NAME, CODE FROM COUNTRY WHERE CODE in ('USA', 'GBR', 'ARE')