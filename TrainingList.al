page 50100 "Training List"
{
    CaptionML = ENU = 'Trainings', ESP = 'Formaciones';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Training;
    Editable = false;
    CardPageId = "Training Card";
    // PromotedActionCategoriesML = ENU = 'New,Process,Report,Related', ESP = 'Nuevo,Proceso,Informe,Relacionado';

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("No."; Rec."No.") { }
                field(Name; Rec.Name) { }
                field(Price; Rec.Price) { }
                field(Blocked; Rec.Blocked) { }
                field("Language Code"; Rec."Language Code")
                {
                    Visible = false;
                }
                field("Duration (hours)"; Rec."Duration (hours)")
                {
                    Visible = false;
                }
                field("No. of Sessions"; Rec."No. of Sessions")
                {
                    Visible = false;
                }
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