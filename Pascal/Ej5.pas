{$mode ISO}

PROGRAM divisionTieneResto;
    VAR n, m: integer;
    FUNCTION esDivisible(n,m: integer): boolean;
        {Retorna TRUE si la conciente entre n y m no tiene resto}
        BEGIN
            esDivisible := (n mod m) = 0
        END;

    BEGIN
        writeln('--- Bienvenid@ al ejercicio 5 ---');
        write('Ingrese el valor de n: ');
        read(n);
        writeln;
        write('Ingrese el valor de m: ');
        read(m);
        writeln;
        IF esDivisible(n, m) THEN
            writeln(n,' es divisible por ',m,' (',n,' es multiplo de ',m,')')
        ELSE
            writeln(n,' no es divisible por ',m,' (',n,' no es multiplo de ',m,')')
    END.