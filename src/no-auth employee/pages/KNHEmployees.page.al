namespace APIConsumption;

page 53702 "KNH Employees"
{
    ApplicationArea = All;
    Caption = 'Employees Import';
    PageType = List;
    Editable = false;
    SourceTable = "KNH Employee";
    CardPageId = "KNH Employee";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Age; Rec.Age)
                {
                    ToolTip = 'Specifies the value of the Employee Age field.';
                }
                field(Salary; Rec.Salary)
                {
                    ToolTip = 'Specifies the value of the Employee Salary field.';
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
