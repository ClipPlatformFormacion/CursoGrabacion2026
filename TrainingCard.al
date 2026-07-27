page 50101 "Training Card"
{
    CaptionML = ENU = 'Training Card', ESP = 'Ficha formación';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Training;

    layout
    {
        area(Content)
        {
            group(General)
            {
                CaptionML = ENU = 'General', ESP = 'General';
                field("No."; Rec."No.") { }
                field(Name; Rec.Name)
                {
                    Importance = Promoted;
                }
                field(Blocked; Rec.Blocked) { }
            }
            group(Invoicing)
            {
                CaptionML = ENU = 'Invoicing', ESP = 'Facturación';
                field(Price; Rec.Price) { }
            }
            group(TrainingDetails)
            {
                CaptionML = ENU = 'Training Details', ESP = 'Detalles formativos';
                field("Language Code"; Rec."Language Code")
                {
                    Importance = Additional;
                }
                field("Duration (hours)"; Rec."Duration (hours)")
                {
                    Importance = Promoted;
                }
                field("No. of Sessions"; Rec."No. of Sessions") { }
                field("Hours per session"; Rec."Hours per session") { }
            }
            part(EditionsLines; "Training Editions Factbox")
            {
                SubPageLink = "Training No." = field("No.");
            }
        }
    }
    actions
    {
        area(Promoted)
        {
            actionref(TrainingEditionsPromoted; TrainingEditions) { }
        }
        area(Navigation)
        {
            action(TrainingEditions)
            {
                CaptionML = ENU = 'Editions', ESP = 'Ediciones';
                RunObject = page "Training Editions";
                RunPageLink = "Training No." = field("No.");
                // Promoted = true;
                // PromotedCategory = Category4;
                // PromotedOnly = true; // Parece que no hace nada
                // PromotedIsBig = true; // No hace nada en el cliente web
            }
        }
    }
}