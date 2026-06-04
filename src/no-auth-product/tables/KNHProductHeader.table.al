///<summary>
/// This table is used to store the header information of products imported from KNH API. It includes fields for product ID, name, and a boolean field indicating if the product is not reserved. The table has a primary key on the product ID and includes a trigger to delete related product lines when a product header is deleted. Additionally, it has a procedure to delete all imported product headers.
/// </summary>
namespace KNHAPIConsumption;

table 53702 "KNH Product Header"
{
    Caption = 'Product Import';
    DataClassification = CustomerContent;
    LookupPageId = "KNH Products";
    DrillDownPageId = "KNH Products";
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(1; Id; Code[50])
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
        ProductLines.SetRange(Id, Rec.Id);
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
