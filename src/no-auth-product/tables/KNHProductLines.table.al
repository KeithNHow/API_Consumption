///<summary>
/// This table is used to store the lines of products imported from KNH API. It includes fields for product ID, line number, parameter, and value. The table has a composite primary key on the product ID and line number. It also includes a trigger to automatically assign a line number if it is not provided during insertion, ensuring that line numbers are unique for each product header.
///</summary>
namespace KNHAPIConsumption;

table 53703 "KNH Product Lines"
{
    Caption = 'Product Lines Import';
    DataClassification = CustomerContent;
    LookupPageId = "KNH Product Subform";
    DrillDownPageId = "KNH Product Subform";
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(1; Id; Code[50])
        {
            Caption = 'id';
            Editable = false;
            TableRelation = "KNH Product Header".Id;
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
        key(PK; Id, "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ProductLines: Record "KNH Product Lines";
    begin
        if Rec."Line No." = 0 then begin
            ProductLines.SetRange(Id, Rec.Id);
            if ProductLines.FindLast() then
                Rec."Line No." := ProductLines."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;
}
