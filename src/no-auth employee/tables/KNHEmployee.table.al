namespace APIConsumption;

table 50001 "KNH Employee"
{
    Caption = 'Employees';
    DataClassification = CustomerContent;
    DrillDownPageId = "KNH Employees";
    LookupPageId = "KNH Employees";
    DataCaptionFields = id, employee_name;
    fields
    {
        field(1; "id"; Integer)
        {
            Caption = 'ID';
            ToolTip = 'Specifies the value of the ID field.';
        }
        field(2; "employee_name"; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Employee Name field.';
        }
        field(3; "employee_salary"; Decimal)
        {
            Caption = 'Salary';
            ToolTip = 'Specifies the value of the Employee Salary field.';
        }
        field(4; "employee_age"; Integer)
        {
            Caption = 'Age';
            ToolTip = 'Specifies the value of the Employee Age field.';
        }
    }
    keys
    {
        key(PK; "id")
        {
            Clustered = true;
        }
    }

    internal procedure DeleteAllImported()
    var
        Employees: Record "KNH Employee";
    begin
        if not Employees.IsEmpty() then
            Employees.DeleteAll(true);
    end;
}