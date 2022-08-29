--Nested Procedures
--Example1 : Unnamed Blok icinde , calisan ismini yazdiran bir Procedure yazalim.

DECLARE

    PROCEDURE show_name IS
        wname employee.last_name%type;
    BEGIN 
        SELECT last_name INTO wname FROM EMPLOYEES WHERE employee_id = 101; 
        dbms_output.put_line('Ismi: ' || wname);
    END;

BEGIN
    show_name;
END;