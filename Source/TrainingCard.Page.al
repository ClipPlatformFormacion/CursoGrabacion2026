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
                field("No."; Rec."No.")
                {
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
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
            actionref(CreateResourcePromoted; CreateResource) { }
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
        area(Processing)
        {
            action(CreateResource)
            {
                CaptionML = ENU = 'Create Resource', ESP = 'Crear recurso';

                trigger OnAction()
                var
                    Resource: Record Resource;
                    ActionExecutedSuccesfully: TextConst ENU = 'Resource %1 created successfully', ESP = 'Recurso %1 creado correctamente';
                begin
                    Resource.Init();
                    Resource.Validate("No.", Rec."No.");
                    Resource.Insert(true);

                    Resource.Validate("Training No.", Rec."No.");
                    Resource.Modify(true);

                    Message(ActionExecutedSuccesfully, Resource."No.");
                end;
            }
        }
    }
}