pageextension 50100 "Resource Card" extends "Resource Card"
{
    layout
    {
        addafter("No.")
        {
            field("Training No."; Rec."Training No.")
            {
                ApplicationArea = All;
                Editable = TrainingNoEditable;
            }
        }
        modify(Name)
        {
            Editable = Rec."Training No." = '';
        }
        modify(Type)
        {
            Editable = Rec."Training No." = '';
        }
        modify("Unit Price")
        {
            Editable = Rec."Training No." = '';
        }
        modify(Blocked)
        {
            Editable = Rec."Training No." = '';
        }
        modify("Personal Data")
        {
            Visible = Rec."Training No." = '';
        }
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        TrainingNoEditable := not ResourceHasEntries();
    end;

    local procedure ResourceHasEntries(): Boolean
    var
        ResLedgerEntry: Record "Res. Ledger Entry";
    begin
        ResLedgerEntry.SetRange("Resource No.", Rec."No.");
        exit(not ResLedgerEntry.IsEmpty());
    end;

    var
        TrainingNoEditable: Boolean;
}