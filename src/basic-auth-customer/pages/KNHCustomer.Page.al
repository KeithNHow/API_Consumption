namespace APIConsumption;

page 50008 "KNH Customer"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Customer';
    PageType = Card;
    SourceTable = "KNH Customer";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Source System Id"; Rec."Source System Id")
                {
                    ToolTip = 'Specifies the value of the Source System Id field.';
                }
            }
        }
    }
}
