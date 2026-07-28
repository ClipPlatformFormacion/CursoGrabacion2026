table 50100 Training
{
    CaptionML = ENU = 'Training', ESP = 'Formación';
    LookupPageId = "Training List";

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU = 'No.', ESP = 'Nº';

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateNo(Rec, xRec, IsHandled);
                if IsHandled then
                    exit;

                if "No." <> xRec."No." then begin
                    ResSetup.Get();
                    NoSeries.TestManual(ResSetup."Resource Nos.");
                    "No. Series" := '';
                end;
            end;
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
        field(56; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, Price, "Language Code", "Duration (hours)") { }
        fieldgroup(Brick; "No.", Name, "No. of Sessions") { }
    }

    var
        ResSetup: Record "Resources Setup";
        NoSeries: Codeunit "No. Series";
        Res: Record Training;

    trigger OnInsert()
    var
        Resource: Record Training;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnInsert(Rec, IsHandled, xRec);
        if IsHandled then
            exit;

        if "No." = '' then begin
            ResSetup.Get();
            ResSetup.TestField("Resource Nos.");
            "No. Series" := ResSetup."Resource Nos.";
            if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series");
            Resource.ReadIsolation(IsolationLevel::ReadUncommitted);
            Resource.SetLoadFields("No.");
            while Resource.Get("No.") do
                "No." := NoSeries.GetNextNo("No. Series");
        end;
    end;

    local procedure CalcDurations()
    begin
        if Rec."No. of Sessions" = 0 then
            Rec."No. of Sessions" := 1;

        Rec."Hours per session" := Rec."Duration (hours)" / Rec."No. of Sessions";
    end;

    procedure AssistEdit(OldRes: Record Training) Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, OldRes, IsHandled, Result);
        if IsHandled then
            exit(Result);

        Res := Rec;
        ResSetup.Get();
        ResSetup.TestField("Resource Nos.");
        if NoSeries.LookupRelatedNoSeries(ResSetup."Resource Nos.", OldRes."No. Series", Res."No. Series") then begin
            Res."No." := NoSeries.GetNextNo(Res."No. Series");
            Rec := Res;
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateNo(var Resource: Record Training; xResource: Record Training; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnInsert(var Resource: Record Training; var IsHandled: Boolean; var xResource: Record Training)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var Resource: Record Training; xOldRes: Record Training; var IsHandled: Boolean; var Result: Boolean)
    begin
    end;
}