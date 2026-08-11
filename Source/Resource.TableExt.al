tableextension 50100 Resource extends Resource
{
    fields
    {
        field(100; "Training No."; Code[20])
        {
            CaptionML = ENU = 'Training No.', ESP = 'Nº Formación';
            TableRelation = Training;
        }
    }
}