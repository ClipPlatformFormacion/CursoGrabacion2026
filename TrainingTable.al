table 50100 Training
{
    CaptionML = ENU = 'Training', ESP = 'Formación';

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU = 'No.', ESP = 'Nº';
        }
        field(2; Name; Text[100])
        {
            CaptionML = ENU = 'Name', ESP = 'Nombre';
        }
        field(3; Price; Decimal)
        {
            CaptionML = ENU = 'Price', ESP = 'Precio';
            BlankZero = true;
        }
        field(4; Blocked; Boolean)
        {
            CaptionML = ENU = 'Blocked', ESP = 'Bloqueado';
        }
        field(5; "Language Code"; Code[10])
        {
            CaptionML = ENU = 'Language Code', ESP = 'Cód. idioma';
            TableRelation = Language;
        }
        field(6; "Duration (hours)"; Decimal)
        {
            CaptionML = ENU = 'Duration (hours)', ESP = 'Duración (horas)';
            MinValue = 1;
            BlankZero = true;
            DecimalPlaces = 0 : 2;
            trigger OnValidate()
            begin
                CalcDurations();
            end;
        }
        field(7; "No. of Sessions"; Integer)
        {
            CaptionML = ENU = 'No. of Sessions', ESP = 'Nº sesiones';
            // MinValue = 1;
            InitValue = 1;
            BlankZero = true;
            trigger OnValidate()
            var
                SessionsCannotBeNegative: TextConst ENU = 'No. of sessions cannot be negative',
                                                    ESP = 'El número de sesiones no puede ser negativo';
            begin
                if Rec."No. of Sessions" < 0 then
                    Error(SessionsCannotBeNegative);

                CalcDurations();
            end;
        }
        field(8; "Hours per session"; Decimal)
        {
            CaptionML = ENU = 'Hours per Session', ESP = 'Horas por sesión';
            MinValue = 1;
            BlankZero = true;
            DecimalPlaces = 0 : 2;
            trigger OnValidate()
            begin
                if Rec."Hours per session" <> 0 then
                    Rec."No. of Sessions" := Rec."Duration (hours)" / Rec."Hours per session"
                else begin
                    Rec."Hours per session" := Rec."Duration (hours)";
                    Rec."No. of Sessions" := 1;
                end;
            end;
        }
    }

    local procedure CalcDurations()
    begin
        if Rec."No. of Sessions" = 0 then
            Rec."No. of Sessions" := 1;

        Rec."Hours per session" := Rec."Duration (hours)" / Rec."No. of Sessions";
    end;
}