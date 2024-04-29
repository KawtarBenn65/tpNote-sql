/*DECLARE
    num_workers NUMBER;
BEGIN
    num_workers := GET_NB_WORKERS(1); -- Remplacez 1 par l'ID de l'usine souhaitée
    DBMS_OUTPUT.PUT_LINE('Nombre de travailleurs dans l''usine : ' || num_workers);
END;
/
*/

/*question 2*/
CREATE OR REPLACE FUNCTION GET_NB_BIG_ROBOTS RETURN NUMBER IS
    total_big_robots NUMBER;
BEGIN
    SELECT COUNT(DISTINCT robot_id)
    INTO total_big_robots
    FROM ROBOTS_HAS_SPARE_PARTS
    GROUP BY robot_id
    HAVING COUNT(spare_part_id) > 3;

    RETURN total_big_robots;
END;
/


/*question3*/

CREATE OR REPLACE FUNCTION GET_BEST_SUPPLIER RETURN VARCHAR2 IS
    best_supplier_name VARCHAR2(100);
BEGIN
    SELECT supplier_name INTO best_supplier_name
    FROM BEST_SUPPLIERS
    WHERE ROWNUM = 1;

    RETURN best_supplier_name;
END;
/



