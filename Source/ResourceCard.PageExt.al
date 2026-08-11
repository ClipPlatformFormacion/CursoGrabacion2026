pageextension 50100 "Resource Card" extends "Resource Card"
{
    layout
    {
        addafter("No.")
        {
            field("Training No."; Rec."Training No.")
            {
                ApplicationArea = All;
            }
        }
    }
}