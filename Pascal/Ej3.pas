{$mode ISO}

PROGRAM radioEsfera;
    VAR rad: real;
    FUNCTION superficieEsfera(r: real): real;
        BEGIN
            superficieEsfera := 4 * pi * sqr(r)
        END;

    FUNCTION volumenEsfera(r: real): real;
        BEGIN
            volumenEsfera := (4/3) * pi * (sqr(r)*r);
        END;

    BEGIN
        writeln('--- Bienvenid@ al Ejercicio 3 ---');
        write('Ingrese el radio de la esfera: ');
        read(rad);
        writeln('Superficie de esfera con radio =',rad,': ',superficieEsfera(rad));
        writeln('Volumen de esfera con radio =',rad,': ',volumenEsfera(rad));
    END.