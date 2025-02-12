namespace APIConsumption;

page 50003 "KNH Employee"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Employee Import';
    PageType = Card;
    SourceTable = "KNH Employee";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
}
