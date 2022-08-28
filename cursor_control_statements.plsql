--BEGIN END arasında SELECT sadece 1 kayit okur. Eger birden fazla kayit okunacaksa CORSOR kullanmak zorundayiz.
--%ISPOEN : CURSOR lari kontrollu acip kapatmak icin kullanilir.
DECLARE 
    CURSOR c_emp IS select employee_id,last_name from employees order by employee_id;
    wemployee_id    employees.employee_id%type;
    wlast_name      employees.last_name%type;
BEGIN 
    --eger cursor acik değilse ac
    if not c_emp%ısopen then 
        OPEN c_emp;,
    end if;
    
    LOOP
    
    FETCH c_emp into wemployee_id,wlast_name;
       EXIT WHEN c_emp%notfound or c_emp%rowcount > 10 ; --ilk 10 kayit sayisi
    dbms_output.put_line('Sira No:' || c_emp%rowcount || 'Sicil No:' || wemployee_id || ' Soyisim:' || wlast_name);
    END LOOP;
    
     --eger cursor kapali ise kapat
    if c_emp%isopen then
        CLOSE c_emp;
    end if;

END;