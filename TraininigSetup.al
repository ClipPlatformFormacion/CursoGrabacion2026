table 50102 "Training Setup"
{
    CaptionML = ENU = 'Training Setup', ESP = 'Conf. formaciones';
    DataClassification = CustomerContent;
    DrillDownPageID = "Training Setup";
    LookupPageID = "Training Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            AllowInCustomizations = Never;
            CaptionML = ENU = 'Primary Key', ESP = 'Clave primaria';
        }
        field(2; "Training Nos."; Code[20])
        {
            CaptionML = ENU = 'Training Nos.', ESP = 'Nos. formaciones';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}

