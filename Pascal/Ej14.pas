PROGRAM cuentaLetras;
    VAR i, cont: integer; cadena: string;

    FUNCTION esLetra(l: char): boolean;
        VAR esMay, esMin: boolean;
        BEGIN
            esMay := (ord(l)>64) AND (ord(l)<91);
            esMin := (ord(l)>96) AND (ord(l)<123);
            esLetra :=  esMay OR esMin
        END;

BEGIN
    write('Ingrese cadena a contar (terminada en "."): ');
    read(cadena);
    writeln;
    cont := 0;
    i := 0;
    WHILE (cadena[i] <> '.') DO
        BEGIN
            IF esLetra(cadena[i]) THEN
                cont := cont + 1;
            i := i + 1;
        END;
    writeln('Letras contadas en cadena ingresada: ',cont);
END.
