-- CHALLENGE #1:
-- Select the id of Manhattan
SELECT 
  id
FROM
  boroughs
WHERE
  name = 'Manhattan';



-- CHALLENGE #2:
-- Select all of Manhattan's neighborhoods using its id
SELECT
  *
FROM
  neighborhoods
WHERE
  location_id = 3;



-- CHALLENGE #3:
-- Select the line names and service bullets from those formerly operated by
-- private companies (whose line names start with BMT or IRT).
SELECT
  line_name, service_bullets
FROM
  services
WHERE
  line_name LIKE 'BMT%' OR line_name LIKE 'IRT%'; -- starts with
  -- line_name LIKE '%BMT' OR line_name LIKE '%IRT'; -- ends with
  -- line_name LIKE '%BMT%' OR line_name LIKE '%IRT%'; -- contains
  -- line_name LIKE 'BMT\%'; -- 'escapes' or ignores the percent sign



-- CHALLENGE #4:
-- Select the populations of Manhattan, Bronx, and Staten Island
SELECT
  boroughs.name, boroughs.population
FROM
  boroughs
WHERE
  boroughs.name IN ('Manhattan', 'Bronx', 'Staten Island');
  -- be specific about the table that the column is in, this is necessary when selecting from multiple tables



-- CHALLENGE #5:
-- Select all the subway service bullets and line names, give the L status as
-- 'Service Change', the B/D/F/M as 'Delays', and all others as 'Good Service'
SELECT
  service_bullets,
  line_name,
  CASE service_bullets
    WHEN 'L' THEN 'Service Change'
    WHEN 'B/D/F/M' THEN 'Delays'
    ELSE 'Good Service'
  END AS status
  -- END AS "status" -- equivalent result to above
FROM
  services;



-- CHALLENGE #6:
-- Select all the lines without an official color
SELECT
  *
FROM
  services
WHERE
  color_name IS NULL;
  -- color_name = NULL; -- will not throw error, but won't give result (i.e. fails silently)
  -- NULL represents an unknown value, so SQL can't compare it to anything



-- CHALLENGE #7:
-- Select all the lines and their colors. If the line does not have a color,
-- substitute something appropriate.

SELECT
  line_name,
  COALESCE (color_name, 'Fire engine red') AS color -- if the color_name is NULL, 'Fire engine red' will be substituted
FROM
  services;



-- CHALLENGE #8:
-- Select all of Manhattan's neighborhoods using a subquery
SELECT
  *
FROM
  neighborhoods
WHERE
  location_id = (
    SELECT
      id
    FROM
      boroughs
    WHERE
      name = 'Manhattan'
  );
-- use a subquery when you don't know the value OR to avoid hard-coding



-- CHALLENGE #9:
-- Select all of the neighborhoods in boroughs with a population over 2 million
SELECT
  neighborhoods.name
FROM
  neighborhoods
WHERE
  neighborhoods.location_id IN (
    SELECT
      id
    FROM 
      boroughs
    WHERE
      boroughs.population > 2000000
  );
-- the subquery returns just the ids of the boroughs with pop > 2,000,000
-- the outer query selects neighborhoods with location_ids matching that list



-- CHALLENGE #10:
-- Select all of the neighborhoods in boroughs with a population over 2 million,
-- this time using joins
SELECT
  neighborhoods.name
FROM
  neighborhoods
JOIN boroughs ON boroughs.id = neighborhoods.location_id
WHERE
  population > 2000000;
-- this does not create a new table or edit our existing ones
-- just JOIN implies Inner Join, meaning only return results for when we have a borough id that matches a neighborhood's location_id
-- order of tables does not matter


-- CHALLENGE #11:
-- Select all the boroughs with 0 neighborhoods
SELECT
  *
FROM
  boroughs
LEFT OUTER JOIN neighborhoods ON neighborhoods.location_id = boroughs.id
WHERE
  location_id IS NULL;
-- use a LEFT OUTER JOIN to return everything from the table on the left (boroughs in this case) whether or not it has a corresponding value from the table on the right (neighborhoods in this case)
-- order of tables matters, the following query returns no results
  -- SELECT
  --   *
  -- FROM
  --   neighborhoods
  -- LEFT OUTER JOIN boroughs ON boroughs.id = neighborhoods.location_id
  -- WHERE
  --   location_id IS NULL; 



-- CHALLENGE #12:
-- Select the borough with three neighborhoods
SELECT
  boroughs.*, COUNT (neighborhoods.id)
FROM
  boroughs
JOIN neighborhoods ON boroughs.id = neighborhoods.location_id
GROUP BY
  boroughs.id
HAVING
  COUNT (neighborhoods.id) = 3;


-- CHALLENGE #13:
-- Select all the boroughs and the number of neighborhoods they have. Order by
-- number of neighborhoods descending.
SELECT
  boroughs.*, COUNT (neighborhoods.id) AS num_neighborhoods
FROM
  boroughs
LEFT OUTER JOIN neighborhoods ON boroughs.id = neighborhoods.location_id
GROUP BY
  boroughs.id
ORDER BY
  COUNT (neighborhoods.id) DESC;
-- here we need a LEFT OUTER JOIN to include boroughs with a neighborhood count of 0
  


-- CHALLENGE #14:
-- Find the boroughs serviced by the B/D/F/M, ordered by borough population.

SELECT
  *
FROM
  boroughs
JOIN service_connections ON boroughs.id = service_connections.borough_id
JOIN services ON services.id = service_connections.service_id
WHERE
  services.service_bullets = 'B/D/F/M'
ORDER BY
  boroughs.population DESC;
-- ORDER BY defaults to ASC