{$mode ISO}

PROGRAM sumaParcialRecursiva;
    PROCEDURE sumaRecursiva(result: real);
        {Procedimiento que solicita numeros hasta recibir un 0,
        imprime los numeros ingresados y su suma parcial hasta el
        momento de ingreso.
        Para iniciar invocaci¢n, result := 0}
        VAR num: real;
        BEGIN
            write('Ingrese numero a sumar (0 para terminar): ');
            read(num);
            writeln;
            IF num = 0 THEN
                writeln('Suma total: ',result)
            ELSE
                BEGIN
                    result := result + num;
                    writeln('Sumando ',num,', acumulado: ',result);
                    sumaRecursiva(result)
                END;
        END;

    BEGIN
        writeln('--- Bienvenid@ al ejercicio 9 ---');
        sumaRecursiva(0) {Invocado en 0 ya que no se realizaron ingresos}
    END.
