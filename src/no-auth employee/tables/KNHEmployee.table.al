namespace APIConsumption;

table 50001 "KNH Employee"
{
    Caption = 'Employees API';
    DataClassification = CustomerContent;
    DrillDownPageId = "KNH Employees";
    LookupPageId = "KNH Employees";
    DataCaptionFields = Id, Name;
    fields
    {
        field(1; "Id"; Integer)
        {
            Caption = 'ID';
            ToolTip = 'Specifies the value of the ID field.';
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Employee Name field.';
        }
        field(3; "Salary"; Decimal)
        {
            Caption = 'Salary';
            ToolTip = 'Specifies the value of the Employee Salary field.';
        }
        field(4; "Age"; Integer)
        {
            Caption = 'Age';
            ToolTip = 'Specifies the value of the Employee Age field.';
        }
    }
    keys
    {
        key(PK; "Id")
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