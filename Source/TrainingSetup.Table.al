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
            CaptionML = ENU = 'Training Nos.', ESP = 'Nº formaciones';
            TableRelation = "No. Series";
        }
        field(51; "Gen. Prod. Posting Group"; Code[20])
        {
            CaptionML = ENU = 'Gen. Prod. Posting Group', ESP = 'Grupo contable prod. gen.';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            var
                GenProdPostingGrp: Record "Gen. Product Posting Group";
            begin
                if xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then
                    if GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group", GenProdPostingGrp."Def. VAT Prod. Posting Group");
            end;
        }
        field(58; "VAT Prod. Posting Group"; Code[20])
        {
            CaptionML = ENU = 'VAT Prod. Posting Group', ESP = 'Grupo contable IVA prod.';
            TableRelation = "VAT Product Posting Group";
        }
        field(18; "Base Unit of Measure"; Code[10])
        {
            CaptionML = ENU = 'Base Unit of Measure', ESP = 'Unidad medida base';
            TableRelation = "Unit of Measure";
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

