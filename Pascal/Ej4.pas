PROGRAM compararConCero;
    VAR numero: real;

    FUNCTION mayor(n, m: real): boolean;
        {Retorna TRUE si n es mayor a m,
         Retorna FALSE si n es menor a m}
        BEGIN
            mayor := n > m
        END;

    BEGIN
        writeln('--- Bienvenid@ al ejercicio 4 ---');
        write('Ingrese un numero a comparar con 0: ');
        read(numero);
        IF mayor(numero, 0) THEN
            BEGIN
                writeln('El numero ',numero,' es mayor a 0.');
            END
        ELSE
            IF (numero = 0) THEN
                BEGIN
                    writeln('El numero ',numero,' es igual a 0.');
                END
            ELSE
                BEGIN
                    writeln('El numero ',numero,' es menor a 0.');
                END;
    END.