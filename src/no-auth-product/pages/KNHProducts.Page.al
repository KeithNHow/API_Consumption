namespace KNHAPIConsumption;

page 53704 "KNH Products"
{
    Caption = 'Products Import';
    PageType = List;
    DataCaptionFields = Id, Name;
    CardPageId = "KNH Product";
    SourceTable = "KNH Product Header";
    Editable = false;
    RefreshOnActivate = true;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
                    if Confirm('Do you want to delete all record?') then
                        Rec.DeleteAllImported();
                end;
            }
        }
    }
}
