PROGRAM vocales;
    VAR i: integer; cadena: string;

    FUNCTION esLetra(l: char): boolean;
        VAR esMay, esMin: boolean;
        BEGIN
            esMay := (ord(l)>64) AND (ord(l)<91);
            esMin := (ord(l)>96) AND (ord(l)<123);
            esLetra :=  esMay OR esMin
        END;

BEGIN
    write('Ingrese cadena a reescribir: ');
    read(cadena);
    writeln;
    FOR i := 0 TO length(cadena) DO
        write(cadena[i]);
    writeln;
END.
