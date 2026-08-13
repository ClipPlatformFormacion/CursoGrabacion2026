codeunit 90000 "Framework Test"
{
    Subtype = Test;

    [Test]
    procedure Test001()
    begin

    end;

    [Test]
    procedure Test002()
    begin
        Error('Un error');
    end;

    [Test]
    procedure Test003()
    var
        UnitOfMeasure: Record "Unit of Measure";
        TextoConPlaceholders: Text;
        Variable1: Integer;
        Variable2: Text;
        Resultado: Text;
        ResultadoTeorico: Text;
    begin
        // [Scenario]  Dado un texto con placeholders y unas variables, se obtiene un
        // texto final en el que se sustituyen los placeholders con las variables

        // [Given] Un texto con placeholders y 2 variables
        TextoConPlaceholders := 'Un texto con %1 y %2 %3';
        Variable1 := 8;
        Variable2 := 'texto';
        UnitOfMeasure.Init();
        UnitOfMeasure.Validate(Code, 'Test');
        UnitOfMeasure.Validate(Description, 'Una unidad de medida de test');
        UnitOfMeasure.Insert(true);

        // [When] usamos la función StrSubstNo
        Resultado := StrSubstNo(TextoConPlaceholders, Variable1, Variable2, UnitOfMeasure.Code);

        // [Then] obtenemos un texto en el que los placeholders están sustituidos
        ResultadoTeorico := 'Un texto con 8 y texto TEST';
        if Resultado <> ResultadoTeorico then
            Error('El resultado no es correcto');
    end;
}