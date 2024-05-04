Program Traza;
{Declaracion de variables}
Var a, b, c, d, s:integer;

    function alfa(e:integer; var f:integer):integer; (* Funcion llamada en programa principal*)
    begin
        e := 1;
        f := 2;
        alfa := e+f;
    end;

begin (* Inicio del programa*)
    b := 10;
    c := 20;
    d := b+c;
    a := alfa(b,c);
    s := b+c;
end.
