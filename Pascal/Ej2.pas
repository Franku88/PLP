PROGRAM Ej2;
    VAR op: integer;

    PROCEDURE solicitaAyB(VAR a, b: real);
        {Procedimiento que solicita valores a y b por teclado}
        BEGIN
            write('Ingrese el valor de a: ');
            read(a);
            writeln;
            write('Ingrese el valor de b: ');
            read(b);
            writeln;
        END;

    FUNCTION suma(x, y: real): real;
        {Funcion que realiza suma entre x e y}
        BEGIN
            suma := x + y
        END;

    FUNCTION resta(x, y: real): real;
        {Funcion que realiza resta entre x e y}
        BEGIN
            resta := x - y
        END;

    PROCEDURE producto(VAR x, y, res: real);
        {Procedimiento que realiza el producto entre x e y,
        almacena el resultado en res}
        BEGIN
            res := x * y
        END;

    PROCEDURE division(VAR x, y, res: real);
        {Procedimiento que realiza la division entre x e y,
        almacena el resultado en res}
        BEGIN
            res := x / y;
        END;

    PROCEDURE opcion1;
        {Inciso a}
        VAR a, b: real;
        BEGIN
            solicitaAyB(a, b);
            writeln('Resultados: ');
            writeln(a,' + ',b,' = ', suma(a,b));
            writeln(a,' - ',b,' = ', resta(a,b));
        END;

    PROCEDURE opcion2;
        {Inciso b}
        VAR a, b, res: real;
        BEGIN
            res := 0;
            solicitaAyB(a, b);
            writeln('Resultados: ');
            producto(a, b, res);
            writeln(a,' * ',b,' = ', res);
            division(a,b, res);
            writeln(a,' / ',b,' = ', res)
        END;

    BEGIN
        {Programa principal}
        writeln('--- Bienvenid@ al ejercicio 2 ---');
        writeln('1. a+b y a-b con funciones.');
        writeln('2. a*b y a/b con procedimientos.');
        write('Ingrese una opcion: ');
        read(op);
        writeln;
        CASE op OF
            1: opcion1;
            2: opcion2
        ELSE
            BEGIN
                writeln;
                writeln('Error de seleccion.')
            END;
        END;
    END.

