///<summary>
/// This page is the page that controls the API imports. It contains groups for Customer, Employee and Product.
/// Each group is is sub-divided into Reference and Action groups. The ref. group has fields for website URL, executing URL, username, password and output. The Action group has grids for Get, Post, Put, Patch and Delete actions. Each grid has two fields - one to set the URL to access and another to execute the action. The page also has a navigation area with actions to view API log entries and records for each of the three entities.   
///</summary>
namespace KNHAPIConsumption;

page 53700 "KNH API Interface"
{
    Caption = 'API Interface';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Customer)
            {
                Caption = 'Basic Auth Customer API';
                group(CustomerReferences)
                {
                    Caption = 'References';
                    field(CustomerAuthUrl; this.CustBasicAuthUrlLbl)
                    {
                        Caption = 'Website';
                        ToolTip = 'Specifies the value of the Website field.';
                        ExtendedDatatype = URL;
                        Editable = false;
                    }
                    field(CustomerUrlToAccess; this.CustBasicAuthUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ExtendedDatatype = URL;
                        ShowMandatory = true;
                    }
                    field(Username; this.Username)
                    {
                        Caption = 'User Name';
                        ToolTip = 'Specifies the value of the User Name field.';
                        ShowMandatory = true;
                    }
                    field(Password; this.Password)
                    {
                        Caption = 'Password';
                        ToolTip = 'Specifies the value of the Password field.';
                        ExtendedDatatype = Masked;
                        ShowMandatory = true;
                    }
                    field(CustomerOutput; this.CustBasicAuthResponse)
                    {
                        Caption = 'Output';
                        ToolTip = 'Specifies the value of the Output field.';
                        ExtendedDatatype = URL;
                        Editable = false;
                    }
                }
                group(CustomerActions)
                {
                    Caption = 'Actions';
                    grid(CustomerGet)
                    {
                        GridLayout = Columns;
                        field(CustomerGetSetUrl; this.GetUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.CustBasicAuthUrlToAccess := '';
                            end;
                        }
                        field(CustomerGetExecute; this.GetLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerIntegration.GetRecords(this.CustBasicAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(CustomerPost)
                    {
                        GridLayout = Columns;
                        field(CustomerPostSetUrl; this.PostUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.CustBasicAuthUrlToAccess := '';
                            end;
                        }
                        field(CustomerPostExecute; this.PostLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerIntegration.PostRecord(this.CustBasicAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(CustomerPut)
                    {
                        GridLayout = Columns;
                        field(CustomerPutSetUrl; this.PutUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.CustBasicAuthUrlToAccess := '';
                            end;
                        }
                        field(CustomerPutExecute; this.PutLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerIntegration.PutRecord(this.CustBasicAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(CustomerPatch)
                    {
                        GridLayout = Columns;
                        field(CustomerPatchSetUrl; this.PatchUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.CustBasicAuthUrlToAccess := '';
                            end;
                        }
                        field(CustomerPatchExecute; this.PatchLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerIntegration.PatchRecord(this.CustBasicAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(CustomerDelete)
                    {
                        GridLayout = Columns;
                        field(CustomerDeleteSetUrl; this.DeleteUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.CustBasicAuthUrlToAccess := '';
                            end;
                        }
                        field(CustomerDeleteExecute; this.DeleteLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerIntegration.DeleteRecord(this.CustBasicAuthUrlToAccess);
                            end;
                        }
                    }
                }
            }
            group(Employee)
            {
                Caption = 'No-Auth Employee API';
                group(EmployeeReferences)
                {
                    Caption = 'References';
                    field(EmployeeAuthUrl; this.EmployeeAuthUrlLbl)
                    {
                        Caption = 'Website';
                        ToolTip = 'Specifies the value of the Website field.';
                        ExtendedDatatype = URL;
                        Editable = false;
                    }
                    field(EmployeeUrlToAccess; this.EmployeeUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ExtendedDatatype = URL;
                        ShowMandatory = true;
                    }
                    field(EmployeeOutput; this.EmployeeNoAuthResponse)
                    {
                        Caption = 'Output';
                        ToolTip = 'Specifies the value of the Output field.';
                        ExtendedDatatype = URL;
                        Editable = false;
                    }
                }
                group(EmployeeActions)
                {
                    Caption = 'Actions';
                    grid(EmployeeGet)
                    {
                        GridLayout = Columns;
                        field(EmployeeGetSetUrl; this.GetUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.EmployeeUrlToAccess := 'https://dummy.restapiexample.com/api/v1/employees';
                            end;
                        }
                        field(EmployeeGetExecute; this.GetLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHEmployeeIntegration.GetRecord(this.EmployeeUrlToAccess);
                            end;
                        }
                    }
                    grid(EmployeePost)
                    {
                        GridLayout = Columns;
                        field(EmployeePostSetUrl; this.PostUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.EmployeeUrlToAccess := 'https://dummy.restapiexample.com/api/v1/create';
                            end;
                        }
                        field(EmployeePostExecute; this.PostLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHEmployeeIntegration.PostRecord(this.EmployeeUrlToAccess);
                            end;
                        }
                    }
                    grid(EmployeePut)
                    {
                        GridLayout = Columns;
                        field(EmployeePutSetUrl; this.PutUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.EmployeeUrlToAccess := 'https://dummy.restapiexample.com/api/v1/update/%1';
                            end;
                        }
                        field(EmployeePutExecute; this.PutLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHEmployeeIntegration.PutRecord(this.EmployeeUrlToAccess);
                            end;
                        }
                    }
                    grid(EmployeePatch)
                    {
                        GridLayout = Columns;
                        field(EmployeePatchSetUrl; this.PatchUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.EmployeeUrlToAccess := 'https://dummy.restapiexample.com/api/v1/update/%1';
                            end;
                        }
                        field(EmployeePatchExecute; this.PatchLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHEmployeeIntegration.PatchRecord(this.EmployeeUrlToAccess);
                            end;
                        }
                    }
                    grid(EmployeeDelete)
                    {
                        GridLayout = Columns;
                        field(EmployeeDeleteSetUrl; this.DeleteUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.EmployeeUrlToAccess := 'https://dummy.restapiexample.com/api/v1/delete/%1';
                            end;
                        }
                        field(EmployeeDeleteExecute; this.DeleteLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHEmployeeIntegration.DeleteRecord(this.EmployeeUrlToAccess);
                            end;
                        }
                    }
                }
            }
            group(Product)
            {
                Caption = 'No-Auth Product API';
                group(ProductReferences)
                {
                    Caption = 'References';
                    field(ProductAuthUrl; this.ProductAuthUrlLbl)
                    {
                        Caption = 'Website';
                        ToolTip = 'Specifies the value of the Website field.';
                        ExtendedDatatype = URL;
                        Editable = false;
                    }
                    field(ProductUrlToAccess; this.ProductUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ExtendedDatatype = URL;
                        ShowMandatory = true;
                    }
                    field(ProductOutput; this.ProductNoAuthResponse)
                    {
                        Caption = 'Output';
                        ToolTip = 'Specifies the value of the Output field.';
                        ExtendedDatatype = URL;
                        Editable = false;
                    }
                }
                group(ProductActions)
                {
                    Caption = 'Actions';
                    grid(ProductGet)
                    {
                        GridLayout = Columns;
                        field(ProductGetSetURL; this.GetUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.ProductUrlToAccess := 'https://api.restful-api.dev/objects';
                            end;
                        }
                        field(ProductGetExecute; this.GetLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHProductIntegration.GetRecord(this.ProductUrlToAccess);
                            end;
                        }
                    }
                    grid(ProductPost)
                    {
                        GridLayout = Columns;
                        field(ProductPostSetURL; this.PostUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.ProductUrlToAccess := 'https://api.restful-api.dev/objects';
                            end;
                        }
                        field(ProductPostExecute; this.PostLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHProductIntegration.PostRecord(this.ProductUrlToAccess);
                            end;
                        }
                    }
                    grid(ProductPut)
                    {
                        GridLayout = Columns;
                        field(ProductPutSetURL; this.PutUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.ProductUrlToAccess := 'https://api.restful-api.dev/objects/%1';
                            end;
                        }
                        field(ProductPutExecute; this.PutLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHProductIntegration.PutRecord(this.ProductUrlToAccess);
                            end;
                        }
                    }
                    grid(ProductPatch)
                    {
                        GridLayout = Columns;
                        field(ProductPatchSetURL; this.PatchUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.ProductUrlToAccess := 'https://api.restful-api.dev/objects/%1';
                            end;
                        }
                        field(ProductPatchExecute; this.PatchLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHProductIntegration.PatchRecord(this.ProductUrlToAccess);
                            end;
                        }
                    }
                    grid(ProductDelete)
                    {
                        GridLayout = Columns;
                        field(ProductDeleteSetURL; this.DeleteUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.ProductUrlToAccess := 'https://api.restful-api.dev/objects/%1';
                            end;
                        }
                        field(ProductDeleteExecute; this.DeleteLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHProductIntegration.DeleteRecord(this.ProductUrlToAccess);
                            end;
                        }
                    }
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(LogEntries)
            {
                Caption = 'API Log Entries';
                ToolTip = 'Shows the API log entries.';
                Image = ErrorLog;
                RunObject = page "KNH API Log Entries";
            }
            action(CustomerAPI)
            {
                Caption = 'Customer API Records';
                ToolTip = 'Shows the Customer API records.';
                Image = Customer;
                RunObject = page "KNH Customer List";
            }
            action(EmployeeAPI)
            {
                Caption = 'Employee API Records';
                ToolTip = 'Shows the Employee API records.';
                Image = Employee;
                RunObject = page "KNH Employee List";
            }
            action(ProductAPI)
            {
                Caption = 'Product API Records';
                ToolTip = 'Shows the Product API records.';
                Image = Item;
                RunObject = page "KNH Products";
            }
        }

        area(Promoted)
        {
            actionref(LogEntries_Ref; LogEntries) { }
            actionref(CustomerAPI_Ref; CustomerAPI) { }
            actionref(EmployeeAPI_Ref; EmployeeAPI) { }
            actionref(ProductAPI_Ref; ProductAPI) { }
        }
    }

    trigger OnOpenPage()
    begin
        this.ProductNoAuthResponse := CopyStr(GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"KNH Products"), 1, 1024);
        this.EmployeeNoAuthResponse := CopyStr(GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"KNH Employee List"), 1, 1024);
        this.CustBasicAuthResponse := CopyStr(GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"KNH Customer List"), 1, 1024);
    end;

    var
        KNHCustomerIntegration: Codeunit "KNH Customer Integration";
        KNHEmployeeIntegration: Codeunit "KNH Employee Integration";
        KNHProductIntegration: Codeunit "KNH Product Integration";
        CustBasicAuthUrlLbl: Label 'https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/resources/dynamics_customer';
        DeleteLbl: Label 'Delete';
        DeleteUrlLbl: Label 'Generate Delete URL';
        EmployeeAuthUrlLbl: Label 'https://dummy.restapiexample.com/';
        GetLbl: Label 'Get';
        GetUrlLbl: Label 'Generate Get URL';
        PatchLbl: Label 'Patch';
        PatchUrlLbl: Label 'Generate Patch URL';
        PostLbl: Label 'Post';
        PostUrlLbl: Label 'Generate Post URL';
        ProductAuthUrlLbl: Label 'https://restful-api.dev/';
        PutLbl: Label 'Put';
        PutUrlLbl: Label 'Generate Put URL';
        Password, Username : Text;
        CustBasicAuthResponse, EmployeeNoAuthResponse, ProductNoAuthResponse : Text[1024];
        CustBasicAuthUrlToAccess, EmployeeUrlToAccess, ProductUrlToAccess : Text[1024];
}
