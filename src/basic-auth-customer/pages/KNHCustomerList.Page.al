namespace KNHAPIConsumption;

page 53707 "KNH Customer List"
{
    ApplicationArea = All;
    Caption = 'Customers API List';
    PageType = List;
    SourceTable = "KNH Customer";
    CardPageId = "KNH Customer Card";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(DeleteImported)
            {
                ApplicationArea = All;
                Caption = 'Delete All';
                ToolTip = 'Deletes all records.';
                Image = DeleteAllBreakpoints;
                trigger OnAction()
                begin
                    if Confirm('Do you want to delete all record?') then
                        Rec.DeleteAllImported();
                end;
            }
        }
        area(Promoted)
        {
            actionref(DeleteImported_Ref; DeleteImported) { }
        }
    }
}
