
/* question 1*/
CREATE OR REPLACE VIEW ALL_WORKERS AS
SELECT
    last_name,
    first_name,
    age,
    first_day AS arrival_date
FROM
    WORKERS_FACTORY_1
WHERE
    last_day IS NULL
UNION ALL
SELECT
    last_name,
    first_name,
    NULL AS age,
    start_date AS arrival_date
FROM
    WORKERS_FACTORY_2
WHERE
    end_date IS NULL
ORDER BY
    arrival_date DESC;


/* question 2*/

CREATE OR REPLACE VIEW ALL_WORKERS_ELAPSED AS
SELECT
    last_name,
    first_name,
    age,
    arrival_date,
    TRUNC(SYSDATE) - TRUNC(arrival_date) AS days_elapsed
FROM
    ALL_WORKERS;


/* question 3*/
CREATE OR REPLACE VIEW BEST_SUPPLIERS AS
SELECT
    s.name AS supplier_name,
    COUNT(*) AS total_pieces_delivered
FROM
    SUPPLIERS s
JOIN
    SUPPLIERS_BRING_TO_FACTORY_1 sf1 ON s.supplier_id = sf1.supplier_id
JOIN
    SUPPLIERS_BRING_TO_FACTORY_2 sf2 ON s.supplier_id = sf2.supplier_id
WHERE
    sf1.quantity + sf2.quantity > 1000
GROUP BY
    s.name
ORDER BY
    total_pieces_delivered DESC;

/*question 4*/
CREATE OR REPLACE VIEW ROBOTS_FACTORIES AS
SELECT
    r.id AS robot_id,
    r.model AS robot_model,
    f.main_location AS factory_location
FROM
    ROBOTS r
JOIN
    ROBOTS_FROM_FACTORY rf ON r.id = rf.robot_id
JOIN
    FACTORIES f ON rf.factory_id = f.id;
