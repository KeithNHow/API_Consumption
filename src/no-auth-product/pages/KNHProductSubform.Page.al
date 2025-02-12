namespace APIConsumption;

page 50006 "KNH Product Subform"
{
    ApplicationArea = All;
    Caption = 'Product Lines Import';
    PageType = ListPart;
    SourceTable = "KNH Product Lines";

    layout
    {
        area(Content)
        {
            repeater(ParametersLines)
            {
                Caption = 'Parameters and Values';
                field(Parameter; Rec.Parameter)
                {
                    ToolTip = 'Specifies the value of the Parameter field.';
                }
                field("Value"; Rec."Value")
                {
                    ToolTip = 'Specifies the value of the Value field.';
                }
            }
        }
    }
}
