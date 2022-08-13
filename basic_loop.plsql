DECLARE

sayac            binary_integer;

BEGIN

loop
    
    sayac := nvl(sayac,0)+1; --sayacin icerisinde NULL deger varsa 0 ata demektir
    
    --continue
    /*if mod(sayac , 2) = 0 then
        continue;
    end if;*/
    continue when mod(sayac , 2) = 1;
    
    dbms_output.put_line('Sayac:'||sayac);
    
    --exit
    /*if sayac = 5 then 
        exit;
    end if; */
    exit when sayac=5;
    
end loop;

 
END;