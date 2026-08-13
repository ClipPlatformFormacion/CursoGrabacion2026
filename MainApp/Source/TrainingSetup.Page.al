page 50104 "Training Setup"
{
    AccessByPermission = TableData Training = R;
    ApplicationArea = Jobs;
    CaptionML = ENU = 'Training Setup', ESP = 'Conf. formaciones';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Training Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Invoicing)
            {
                CaptionML = ENU = 'Invoicing', ESP = 'Facturación';
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group") { }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group") { }
                field("Base Unit of Measure"; Rec."Base Unit of Measure") { }
            }
            group(Numbering)
            {
                CaptionML = ENU = 'Numbering', ESP = 'Numeración';
                field("Training Nos."; Rec."Training Nos.")
                {
                    ApplicationArea = Jobs;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

