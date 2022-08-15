--CURSORS 
--SQL%FOUND :       Kayit varsa:True / Kayit yoksa:False
--SQL%NOTFOUND :    Kayit varsa:False / Kayit yoksa:True
--SQL%ROWCOUNT :    Kayit sayisi
DECLARE

rec_emp employess2%rowtype;

BEGIN

select * into rec_emp from employess2 where employee_id=100;

if sql%found then 
    dbms_output.put_line('Kayit Var1');
else
    dbms_output.put_line('Kayit Yok1');
end if;
    
exception when no_data_found then
     dbms_output.put_line('Kayit Yok2');
     
if sql%notfound then 
    dbms_output.put_line('Kayit Yok3');
else
    dbms_output.put_line('Kayit Var3'); 
end if;
    
END;