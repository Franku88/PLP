PROGRAM EjemploCase;
VAR Mes, CantDias: integer;
BEGIN
    CantDias := 0;
    writeln('Ingresa el Mes (De 1 a 12): ');
    read(Mes);
    CASE Mes OF
        1, 3, 5, 7, 8, 10, 12:
            CantDias := 31;
        4, 6, 9, 11:
            CantDias := 30;
        2:
            CantDias := 28;
    ELSE
        writeln('Error en la entrada.');
    END; { <= del CASE}
    IF (Mes > 0) AND (Mes < 13) THEN BEGIN
        write('El mes n£mero ',Mes);
        writeln(' tiene ',CantDias,' d¡as.')
    END;
END.
