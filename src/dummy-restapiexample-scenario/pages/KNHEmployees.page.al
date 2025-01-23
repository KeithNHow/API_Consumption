namespace APIConsumption;

page 50002 "KNH Employees"
{
    ApplicationArea = All;
    Caption = 'Employees';
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
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(employee_name; Rec.employee_name)
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(employee_age; Rec.employee_age)
                {
                    ToolTip = 'Specifies the value of the Employee Age field.';
                }
                field(employee_salary; Rec.employee_salary)
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
