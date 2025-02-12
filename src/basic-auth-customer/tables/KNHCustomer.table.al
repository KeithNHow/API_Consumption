namespace APIConsumption;

table 50004 "KNH Customer"
{
    Caption = 'Customers API';
    LookupPageId = "KNH Customer";
    DrillDownPageId = "KNH Customer";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No. field.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(3; Address; Text[100])
        {
            Caption = 'Address';
            ToolTip = 'Specifies the value of the Address field.';
        }
        field(4; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            ToolTip = 'Specifies the value of the Address 2 field.';
        }
        field(5; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ToolTip = 'Specifies the value of the Phone No. field.';
        }
        field(6; "Source System Id"; Guid)
        {
            Caption = 'Source System Id';
            ToolTip = 'Specifies the value of the Source System Id field.';
            Editable = false;
        }
        field(7; Email; Text[80])
        {
            Caption = 'Email';
            ToolTip = 'Specifies the value of the Email field.';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    internal procedure DeleteAllImported()
    var
        Customers: Record "KNH Customer";
    begin
        if not Customers.IsEmpty() then
            Customers.DeleteAll(true);
    end;
}
