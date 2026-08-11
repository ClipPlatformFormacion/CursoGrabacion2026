page 50103 "Training Editions Factbox"
{
    CaptionML = ENU = 'Training Editions', ESP = 'Ediciones formación';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Training Edition";
    DataCaptionFields = "Training No.";

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("Training No."; Rec."Training No.")
                {
                    Visible = false;
                }
                field(Edition; Rec.Edition) { }
                field("Type (Option)"; Rec."Type (Option)") { }
                field("Type (Enum)"; Rec."Type (Enum)") { }
                field("Start Date"; Rec."Start Date") { }
                field("End Date"; Rec."End Date") { }
                field("Max. Students"; Rec."Max. Students") { }
            }
        }
    }
}