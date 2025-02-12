namespace APIConsumption;

page 50003 "KNH Employee"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Employee API';
    PageType = Card;
    SourceTable = "KNH Employee";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
}
