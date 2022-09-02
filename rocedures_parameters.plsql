--Nested Procedures
--Example1 : Unnamed Blok icinde , calisan ismini yazdiran bir Procedure yazalim.
--Example2 : Unnamed Blok icinde , calisan ismini degistiren bir Procedure yazalim.
--Example2 : Statik olan degerleri dinamik hale getirelim.

DECLARE
    cursor c_emp IS SELECT employee_id FROM EMPLOYEES WHERE department_id = 90;
    r_emp c_emp%rowtype;
    
    PROCEDURE show_name ( p_id IN employees.employe_id%type ) IS
        wname employee.last_name%type;
    BEGIN 
        SELECT last_name INTO wname FROM EMPLOYEES WHERE employee_id = p_id; 
        dbms_output.put_line('Ismi: ' || wname);
    END;

     PROCEDURE change_name ( p_id IN employees.employe_id%type ) IS
        wname employee.last_name%type;
    BEGIN 
       UPDATE employees SET
            last_name = UPPER (last_name)
       WHERE employee.id = p_id;
       RETURNING last_name INTO wname;   --SELECT last_name INTO wname FROM EMPLOYEES
        
       dbms_output.put_line('Yeni Ismi: ' || wname);
       
    END;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO r_emp;
        EXIT WHEN c_emp%NOTFOUND;
        show_name(r_emp.employee_id);
        change_name(r_emp.employee_id)
    END LOOP;
    
END;