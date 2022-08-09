declare 

tarih date := to_date('06.08.2022','dd.MM.yyyy');
gun varchar2(20);

BEGIN

gun := trim(to_char(tarih,'DAY'));

if gun = 'SATURDAY' OR gun = 'SUNDAY' then
    dbms_output.put_line('Hafta Sonu');
else
    dbms_output.put_line('Hafta Ici');
end if;

end;