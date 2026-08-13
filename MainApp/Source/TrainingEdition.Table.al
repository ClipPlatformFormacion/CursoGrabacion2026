table 50101 "Training Edition"
{
    CaptionML = ENU = 'Training Edition', ESP = 'Edición formación';
    LookupPageId = "Training Editions";

    fields
    {
        field(1; "Training No."; Code[20])
        {
            CaptionML = ENU = 'Training No.', ESP = 'Nº formación';
            TableRelation = Training."No.";
        }
        field(2; Edition; Code[20])
        {
            CaptionML = ENU = 'Edition', ESP = 'Edición';
        }
        field(3; "Type (Option)"; Option)
        {
            CaptionML = ENU = 'Type (Option)', ESP = 'Tipo (Option)';
            OptionMembers = " ","Video Tutorial","Instructor-Led";
            OptionCaptionML = ENU = ' ,Video Tutorial,Instructor-Led', ESP = ' ,Vídeo tutorial,Guiado por Instructor';
        }
        field(7; "Type (Enum)"; Enum "Edition Type")
        {
            CaptionML = ENU = 'Type (Enum)', ESP = 'Tipo (Enum)';
        }
        field(4; "Start Date"; Date)
        {
            CaptionML = ENU = 'Start Date', ESP = 'Fecha inicio';
        }
        field(5; "End Date"; Date)
        {
            CaptionML = ENU = 'End Date', ESP = 'Fecha inicio';
        }
        field(6; "Max. Students"; Integer)
        {
            CaptionML = ENU = 'Max. Students', ESP = 'Máx. estudiantes';
        }
    }

    keys
    {
        key(PK; "Training No.", Edition)
        {
            Clustered = true;
        }
    }
}