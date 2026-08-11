tableextension 50100 Resource extends Resource
{
    fields
    {
        field(100; "Training No."; Code[20])
        {
            CaptionML = ENU = 'Training No.', ESP = 'Nº Formación';
            TableRelation = Training;

            trigger OnValidate()
            var
                Training: Record Training;
                Resource: Record Resource;
            begin
                if Rec."Training No." = '' then
                    exit;

                Resource.SetRange("Training No.", Rec."Training No.");
                Resource.SetFilter("No.", '<>%1', Rec."No.");
                if not Resource.IsEmpty() then
                    Error('Existen otros recursos vinculados a la formación %1', Rec."Training No.");

                Rec.Validate(Type, Enum::"Resource Type"::Training);
                Training.Get(Rec."Training No.");
                Rec.Validate(Name, Training.Name);
                Rec.Validate("Unit Price", Training.Price);
                Rec.Validate(Blocked, Training.Blocked);
            end;
        }
    }
}