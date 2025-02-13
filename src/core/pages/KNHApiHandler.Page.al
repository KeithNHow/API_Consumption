namespace APIConsumption;

page 50000 "KNH API Handler"
{
    Caption = 'API Handler';
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
                        ExtendedDatatype = Url;
                        Editable = false;
                    }
                    field(CustomerUrlToAccess; this.CustBasicAuthUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ExtendedDatatype = Url;
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
                        ExtendedDatatype = Url;
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
                                this.CustBasicAuthUrlToAccess := 'http://localhost:7048/BC250/api/v2.0/companies(dd117d67-3f89-ef11-8a6d-7c1e521d1853)/customers';
                            end;
                        }
                        field(CustomerGetExecute; this.GetLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerAPIIntegration.SetUsernameandPassword(this.Username, this.Password);
                                this.KNHCustomerAPIIntegration.GetRecords(this.CustBasicAuthUrlToAccess);
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
                                this.CustBasicAuthUrlToAccess := 'http://localhost:7048/BC250/api/v2.0/companies(dd117d67-3f89-ef11-8a6d-7c1e521d1853)/customers';
                            end;
                        }
                        field(CustomerPostExecute; this.PostLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerAPIIntegration.SetUsernameandPassword(this.Username, this.Password);
                                this.KNHCustomerAPIIntegration.PostRecord(this.CustBasicAuthUrlToAccess);
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
                                this.CustBasicAuthUrlToAccess := 'http://localhost:7048/BC250/api/v2.0/companies(dd117d67-3f89-ef11-8a6d-7c1e521d1853)/customers';
                            end;
                        }
                        field(CustomerPutExecute; this.PutLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerAPIIntegration.SetUsernameandPassword(this.Username, this.Password);
                                this.KNHCustomerAPIIntegration.PutRecord(this.CustBasicAuthUrlToAccess);
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
                                this.CustBasicAuthUrlToAccess := 'http://localhost:7048/BC250/api/v2.0/companies(dd117d67-3f89-ef11-8a6d-7c1e521d1853)/customers(%1)';
                            end;
                        }
                        field(CustomerPatchExecute; this.PatchLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerAPIIntegration.SetUsernameandPassword(this.Username, this.Password);
                                this.KNHCustomerAPIIntegration.PatchRecord(this.CustBasicAuthUrlToAccess);
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
                                this.CustBasicAuthUrlToAccess := 'http://localhost:7048/BC250/api/v2.0/companies(dd117d67-3f89-ef11-8a6d-7c1e521d1853)/customers(%1)';
                            end;
                        }
                        field(CustomerDeleteExecute; this.DeleteLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.KNHCustomerAPIIntegration.SetUsernameandPassword(this.Username, this.Password);
                                this.KNHCustomerAPIIntegration.DeleteRecord(this.CustBasicAuthUrlToAccess);
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
                        ExtendedDatatype = Url;
                        Editable = false;
                    }
                    field(EmployeeUrlToAccess; this.EmployeeUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ExtendedDatatype = Url;
                        ShowMandatory = true;
                    }
                    field(EmployeeOutput; this.EmployeeNoAuthResponse)
                    {
                        Caption = 'Output';
                        ToolTip = 'Specifies the value of the Output field.';
                        ExtendedDatatype = Url;
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
                                this.KNHEmployeeAPIIntegration.GetRecord(this.EmployeeUrlToAccess);
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
                                this.KNHEmployeeAPIIntegration.PostRecord(this.EmployeeUrlToAccess);
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
                                this.KNHEmployeeAPIIntegration.PutRecord(this.EmployeeUrlToAccess);
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
                                this.KNHEmployeeAPIIntegration.PatchRecord(this.EmployeeUrlToAccess);
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
                                this.KNHEmployeeAPIIntegration.DeleteRecord(this.EmployeeUrlToAccess);
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
                        ExtendedDatatype = Url;
                        Editable = false;
                    }
                    field(ProductUrlToAccess; this.ProductUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ExtendedDatatype = Url;
                        ShowMandatory = true;
                    }
                    field(ProductOutput; this.ProductNoAuthResponse)
                    {
                        Caption = 'Output';
                        ToolTip = 'Specifies the value of the Output field.';
                        ExtendedDatatype = Url;
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
                                this.KNHEmployeeAPIIntegration.GetRecord(this.EmployeeUrlToAccess);
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
                                this.KNHProductAPIIntegration.PostRecord(this.ProductUrlToAccess);
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
                                this.KNHProductAPIIntegration.PutRecord(this.ProductUrlToAccess);
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
                                this.KNHProductAPIIntegration.PatchRecord(this.ProductUrlToAccess);
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
                                this.KNHProductAPIIntegration.DeleteRecord(this.ProductUrlToAccess);
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
                ToolTip = 'Shows the log entries.';
                Image = ErrorLog;
                RunObject = Page "KNH API Log Entries";
            }
            action(CustomerAPI)
            {
                ToolTip = 'Shows the Customer API.';
                Image = Customer;
                RunObject = Page "KNH Customers";
            }
            action(EmployeeAPI)
            {
                ToolTip = 'Shows the Employee API.';
                Image = Employee;
                RunObject = Page "KNH Employees";
            }
            action(ProductAPI)
            {
                ToolTip = 'Shows the Product API.';
                Image = Item;
                RunObject = Page "KNH Products";
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
        this.EmployeeNoAuthResponse := CopyStr(GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"KNH Employees"), 1, 1024);
        this.CustBasicAuthResponse := CopyStr(GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"KNH Customer"), 1, 1024);
    end;

    var
        KNHCustomerAPIIntegration: Codeunit "KNH Customer API Integration";
        KNHProductAPIIntegration: Codeunit "KNH Product API Integration";
        KNHEmployeeAPIIntegration: Codeunit "KNH Employee API Integration";
        ProductUrlToAccess, EmployeeUrlToAccess, CustBasicAuthUrlToAccess : Text[1024];
        ProductNoAuthResponse, EmployeeNoAuthResponse, CustBasicAuthResponse : Text[1024];
        Username, Password : Text;
        EmployeeAuthUrlLbl: Label 'https://dummy.restapiexample.com/';
        ProductAuthUrlLbl: Label 'https://restful-api.dev/';
        CustBasicAuthUrlLbl: Label 'https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/resources/dynamics_customer';
        GetLbl: Label 'Get';
        PostLbl: Label 'Post';
        PutLbl: Label 'Put';
        PatchLbl: Label 'Patch';
        DeleteLbl: Label 'Delete';
        GetUrlLbl: Label 'Generate Get URL';
        PostUrlLbl: Label 'Generate Post URL';
        PutUrlLbl: Label 'Generate Put URL';
        PatchUrlLbl: Label 'Generate Patch URL';
        DeleteUrlLbl: Label 'Generate Delete URL';
}
