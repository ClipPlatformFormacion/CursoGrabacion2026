table 50102 "Training Setup"
{
    Caption = 'Training Setup';
    DataClassification = CustomerContent;
    DrillDownPageID = "Training Setup";
    LookupPageID = "Training Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            AllowInCustomizations = Never;
            Caption = 'Primary Key';
        }
        field(2; "Training Nos."; Code[20])
        {
            Caption = 'Training Nos.';
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

