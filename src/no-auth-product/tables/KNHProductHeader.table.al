table 53702 "KNH Product Header"
{
    Caption = 'Product Import';
    DataClassification = CustomerContent;
    LookupPageId = "KNH Products";
    DrillDownPageId = "KNH Products";
    fields
    {
        field(1; Id; code[50])
        {
            Caption = 'id';
        }
        field(2; Name; Text[250])
        {
            Caption = 'name';
        }
        field(3; "Not Reserved"; Boolean)
        {
            Caption = 'Not Reserved';
        }
    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        ProductLines: Record "KNH Product Lines";
    begin
        ProductLines.SetRange(id, Rec.id);
        if not ProductLines.IsEmpty() then
            ProductLines.DeleteAll(true);
    end;

    procedure DeleteAllImported()
    var
        ProductHeader: Record "KNH Product Header";
    begin
        if not ProductHeader.IsEmpty() then
            ProductHeader.DeleteAll(true);
    end;
}
