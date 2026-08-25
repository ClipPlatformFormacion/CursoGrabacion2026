codeunit 90001 "GetMin Test"
{
    Subtype = Test;

    [Test]
    procedure GetMinTest001()
    var
        Variable1, Variable2 : Integer;
        Resultado: Integer;
        GetMinCodeunit: Codeunit GetMin;
    begin
        // [Scenario] Dados los números 1 y 2, la función GetMin devuelve el 1

        // [Given] Dos números: el 1 y el 2
        Variable1 := 1;
        Variable2 := 2;

        // [When] Se realiza una llamada a la función GetMin
        Resultado := GetMinCodeunit.GetMin(Variable1, Variable2);

        // [Then] El resultado es el 1
        if Resultado <> Variable1 then
            Error('El resultado no es correcto');
    end;

    [Test]
    procedure GetMinTest002()
    var
        Variable1, Variable2 : Integer;
        Resultado: Integer;
        GetMinCodeunit: Codeunit GetMin;
    begin
        // [Scenario] Dados los números 2 y 1, la función GetMin devuelve el 1

        // [Given] Dos números: el 2 y el 1
        Variable1 := 2;
        Variable2 := 1;

        // [When] Se realiza una llamada a la función GetMin
        Resultado := GetMinCodeunit.GetMin(Variable1, Variable2);

        // [Then] El resultado es el 1
        if Resultado <> Variable2 then
            Error('El resultado no es correcto');
    end;

    [Test]
    procedure GetMinTest003()
    var
        Variable1, Variable2 : Integer;
        Resultado: Integer;
        GetMinCodeunit: Codeunit GetMin;
    begin
        // [Scenario] Dados los números 2 y 2, la función GetMin devuelve el 1

        // [Given] Dos números: el 2 y el 2
        Variable1 := 2;
        Variable2 := 2;

        // [When] Se realiza una llamada a la función GetMin
        Resultado := GetMinCodeunit.GetMin(Variable1, Variable2);

        // [Then] El resultado es el 2
        if Resultado <> Variable2 then
            Error('El resultado no es correcto');
    end;
}