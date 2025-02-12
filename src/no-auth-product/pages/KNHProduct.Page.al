namespace APIConsumption;

page 50005 "KNH Product"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Product Import';
    PageType = Document;
    RefreshOnActivate = true;
    DataCaptionFields = id, name;
    SourceTable = "KNH Product Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field.';
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field.';
                }
                field("Not Reserved"; Rec."Not Reserved")
                {
                    ToolTip = 'Specifies the value of the Not Reserved field.', Comment = '%';
                }
            }
            part(Lines; "KNH Product Subform")
            {
                ApplicationArea = All;
                SubPageLink = "id" = field("id");
                UpdatePropagation = Both;
            }
        }
    }
}
