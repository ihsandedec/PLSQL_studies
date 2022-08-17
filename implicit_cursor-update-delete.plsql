--CURSORS 
--SQL%FOUND :       Kayit varsa:True / Kayit yoksa:False
--SQL%NOTFOUND :    Kayit varsa:False / Kayit yoksa:True
--SQL%ROWCOUNT :    Kayit sayisi
DECLARE

rec_emp employess2%rowtype;

BEGIN

--id si 50 olan departmanin maasina %20 zam yapıyoruz.
--UPDATE [tablo adi] SET [yeni bilgiler] WHERE [sartlar]
UPDATE EMPLOYEES2 SET SALARY = SALARY / 1.20 WHERE DEPARTMENT_ID = 50;

if sql%found then 
    dbms_output.put_line(sql%rowcount || 'Kayit Update edildi 1');
else
    dbms_output.put_line('Update edilecek kayit bulunamadi a');
end if;
    

if sql%notfound then 
    dbms_output.put_line('Update edilecek kayit bulunamadi 2');
else
    dbms_output.put_line(sql%rowcount || 'Kayit Update edildi b');
end if;    

--id si 100,80 olan departmani sayisini siliyoruz.
--DELETE FROM [tablo adi] WHERE [sartlar]    
DELETE FROM EPLOYEES2 WHERE DEPARTMENT_ID IN (100,80)
    
if sql%found then 
    dbms_output.put_line(sql%rowcount || 'Kayit Delete edildi 1');
else
    dbms_output.put_line('Delete edilecek kayit bulunamadi a');
end if;
    

if sql%notfound then 
    dbms_output.put_line('Delete edilecek kayit bulunamadi 2');
else
    dbms_output.put_line(sql%rowcount || 'Kayit Delete edildi b');
end if;

END;