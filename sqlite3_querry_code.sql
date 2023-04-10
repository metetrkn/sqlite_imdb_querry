-- Enable the output mode as a CSV file
.mode csv

-- Set the output file name and location
.output output_file.csv

-- Run the query
SELECT DISTINCT(name)
FROM people
JOIN stars ON people.id = stars.person_id
WHERE movie_id IN (
    SELECT id
    FROM movies
    JOIN stars ON movies.id = stars.movie_id
    WHERE person_id = (
        SELECT id
        FROM people
        WHERE name = 'Kevin Bacon'
        AND birth = 1958
    )
);

-- Reset the output to the default (console)
.output stdout

