table 53703 "KNH Product Lines"
{
    Caption = 'Product Lines Import';
    DataClassification = CustomerContent;
    LookupPageId = "KNH Product Subform";
    DrillDownPageId = "KNH Product Subform";
    fields
    {
        field(1; Id; code[50])
        {
            Caption = 'id';
            Editable = false;
            TableRelation = "KNH Product Header"."id";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(3; Parameter; Text[250])
        {
            Caption = 'Parameter';
        }
        field(4; Value; Text[250])
        {
            Caption = 'Value';
        }
    }
    keys
    {
        key(PK; "Id", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ProductLines: Record "KNH Product Lines";
    begin
        if Rec."Line No." = 0 then begin
            ProductLines.SetRange("id", Rec."id");
            if ProductLines.FindLast() then
                Rec."Line No." := ProductLines."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;
}
