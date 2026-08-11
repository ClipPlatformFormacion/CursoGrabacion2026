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
                    TrainingSetup.Get();
                    NoSeries.TestManual(TrainingSetup."Training Nos.");
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
            CaptionML = ENU = 'No. Series', ESP = 'No. Serie';
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
        TrainingSetup: Record "Training Setup";
        NoSeries: Codeunit "No. Series";
        Training: Record Training;

    trigger OnInsert()
    var
        Training2: Record Training;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnInsert(Rec, IsHandled, xRec);
        if IsHandled then
            exit;

        if "No." = '' then begin
            TrainingSetup.Get();
            TrainingSetup.TestField("Training Nos.");
            "No. Series" := TrainingSetup."Training Nos.";
            if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series");
            Training2.ReadIsolation(IsolationLevel::ReadUncommitted);
            Training2.SetLoadFields("No.");
            while Training2.Get("No.") do
                "No." := NoSeries.GetNextNo("No. Series");
        end;
    end;

    local procedure CalcDurations()
    begin
        if Rec."No. of Sessions" = 0 then
            Rec."No. of Sessions" := 1;

        Rec."Hours per session" := Rec."Duration (hours)" / Rec."No. of Sessions";
    end;

    procedure AssistEdit(OldTraining: Record Training) Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, OldTraining, IsHandled, Result);
        if IsHandled then
            exit(Result);

        Training := Rec;
        TrainingSetup.Get();
        TrainingSetup.TestField("Training Nos.");
        if NoSeries.LookupRelatedNoSeries(TrainingSetup."Training Nos.", OldTraining."No. Series", Training."No. Series") then begin
            Training."No." := NoSeries.GetNextNo(Training."No. Series");
            Rec := Training;
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateNo(var Training: Record Training; xTraining: Record Training; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnInsert(var Training: Record Training; var IsHandled: Boolean; var xTraining: Record Training)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var Training: Record Training; xOldTraining: Record Training; var IsHandled: Boolean; var Result: Boolean)
    begin
    end;
}