namespace KNHAPIConsumption;

page 53705 "KNH Products"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Products API';
    PageType = Document;
    RefreshOnActivate = true;
    DataCaptionFields = Id, Name;
    SourceTable = "KNH Product Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the id field.';
                }
                field(name; Rec.Name)
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
                SubPageLink = Id = field(Id);
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Delete)
            {
                ApplicationArea = All;
                Caption = 'Delete All';
                ToolTip = 'Deletes all records.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = DeleteAllBreakpoints;
                trigger OnAction()
                begin
                    if Confirm('Do you want to delete all records?') then
                        Rec.DeleteAllImported();
                end;
            }
        }
    }
}
