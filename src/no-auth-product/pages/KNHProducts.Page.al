/// <summary>
/// This list page is used to display and manage the details of products imported from KNH API.
/// </summary>
namespace KNHAPIConsumption;

page 53704 "KNH Products"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Products API';
    PageType = List;
    Editable = false;
    SourceTable = "KNH Product Header";
    CardPageId = "KNH Product";

    layout
    {
        area(Content)
        {
            repeater(General)
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
