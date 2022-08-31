--Nested Procedures
--Example1 : Unnamed Blok icinde , calisan ismini yazdiran bir Procedure yazalim.
--Example2 : Unnamed Blok icinde , calisan ismini degistiren bir Procedure yazalim.

DECLARE

    PROCEDURE show_name IS
        wname employee.last_name%type;
    BEGIN 
        SELECT last_name INTO wname FROM EMPLOYEES WHERE employee_id = 101; 
        dbms_output.put_line('Ismi: ' || wname);
    END;

     PROCEDURE change_name IS
        wname employee.last_name%type;
    BEGIN 
       UPDATE employees SET
            last_name = UPPER (last_name)
       WHERE employee.id = 101;
       RETURNING last_name INTO wname;   --SELECT last_name INTO wname FROM EMPLOYEES
        
       dbms_output.put_line('Yeni Ismi: ' || wname);
       
    END;
BEGIN
    show_name;
	change_name;
END;