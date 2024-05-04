PROGRAM veinteConsecutivos;
    VAR desde, i: integer;
    BEGIN
        writeln('--- Bienvenid@ al Ejercicio 7 ----');
        write('Ingrese desde que numero imprimir: ');
        read(desde);
        writeln;
        writeln('20 Numeros desde ',desde,': ');
        FOR i := 0 TO 19 DO
        BEGIN
            write(i+desde,' ');
        END;
        writeln;
    END.