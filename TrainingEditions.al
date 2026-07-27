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
        field(3; Type; Option)
        {
            CaptionML = ENU = 'Type', ESP = 'Tipo';
            OptionMembers = "Video Tutorial","Instructor-Led";
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