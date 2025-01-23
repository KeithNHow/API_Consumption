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
            group(Group1)
            {
                Caption = 'No-Auth Dummy Rest API';
                group(Group1Refrences)
                {
                    Caption = 'References';
                    field(Group1AuthUrl; this.DummyAuthUrlLbl)
                    {
                        Caption = 'Website';
                        ToolTip = 'Specifies the value of the Website field.';
                        Editable = false;
                        ExtendedDatatype = Url;
                    }
                    field(Group1URLToAccess; this.DummyUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ShowMandatory = true;
                        ExtendedDatatype = Url;
                    }
                    field(Group1output; this.DummyNoAuthResponse)
                    {
                        ApplicationArea = All;
                        ExtendedDatatype = Url;
                        Editable = false;
                        Caption = 'Output';
                        ToolTip = 'Specifies the value of the Output field.';
                    }
                }
                group(Group1actions)
                {
                    Caption = 'Actions';
                    grid(Group1Get)
                    {
                        GridLayout = Columns;
                        field(Group1GetSetURL; this.GetUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyUrlToAccess := 'https://dummy.restapiexample.com/api/v1/employees';
                            end;
                        }
                        field(Group1GetExecute; this.GetLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyRestAPIReqResMgmt.GetRecord(this.DummyUrlToAccess);
                            end;
                        }
                    }
                    grid(Group1Post)
                    {
                        GridLayout = Columns;
                        field(Group1PostSetURL; this.PostUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyUrlToAccess := 'https://dummy.restapiexample.com/api/v1/create';
                            end;
                        }
                        field(Group1PostExecute; this.PostLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyRestAPIReqResMgmt.PostRecord(this.DummyUrlToAccess);
                            end;
                        }
                    }
                    grid(Group1Put)
                    {
                        GridLayout = Columns;
                        field(Group1PutSetURL; this.PutUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyUrlToAccess := 'https://dummy.restapiexample.com/api/v1/update/%1';
                            end;
                        }
                        field(Group1PutExecute; this.PutLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyRestAPIReqResMgmt.PutRecord(this.DummyUrlToAccess);
                            end;
                        }
                    }
                    grid(Group1Patch)
                    {
                        GridLayout = Columns;
                        field(Group1PatchSetURL; this.PatchUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.NoAuthUrlToAccess := 'https://dummy.restapiexample.com/api/v1/update/%1';
                            end;
                        }
                        field(Group1PatchExecute; this.PatchLbl)
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyRestAPIReqResMgmt.PatchRecord(this.DummyUrlToAccess);
                            end;
                        }
                    }
                    grid(Group1Delete)
                    {
                        GridLayout = Columns;
                        field(Group1DeleteSetURL; this.DeleteUrlLbl)
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyUrlToAccess := 'https://dummy.restapiexample.com/api/v1/delete/%1';
                            end;
                        }
                        field(Group1DeleteExecute; this.DeleteLbl)
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.DummyRestAPIReqResMgmt.DeleteRecord(this.DummyUrlToAccess);
                            end;
                        }
                    }
                }
            }
            group(Group2)
            {
                Caption = 'No-Auth Restful API';
                group(Group2Refrences)
                {
                    Caption = 'References';
                    field(Group2AuthUrl; this.NoAuthUrlLbl)
                    {
                        Caption = 'Website';
                        ToolTip = 'Specifies the value of the Website field.';
                        Editable = false;
                        ExtendedDatatype = Url;
                    }
                    field(Group2URLToAccess; this.NoAuthUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ShowMandatory = true;
                        ExtendedDatatype = Url;
                    }
                    field(Group2output; this.NoAuthResponse)
                    {
                        ApplicationArea = All;
                        ExtendedDatatype = Url;
                        Editable = false;
                        Caption = 'Output';
                        ToolTip = 'Specifies the value of the Output field.';
                    }
                }
                group(Group2actions)
                {
                    Caption = 'Actions';
                    grid(Group2Get)
                    {
                        GridLayout = Columns;
                        field(Group2GetSetURL; this.GetUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.NoAuthUrlToAccess := 'https://api.restful-api.dev/objects';
                            end;
                        }
                        field(Group2GetExecute; this.GetLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.APINoAuthReqResMgmt.GetRecords(this.NoAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(Group2Post)
                    {
                        GridLayout = Columns;
                        field(Group2PostSetURL; this.PostUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.NoAuthUrlToAccess := 'https://api.restful-api.dev/objects';
                            end;
                        }
                        field(Group2PostExecute; this.PostLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.APINoAuthReqResMgmt.PostRecord(this.NoAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(Group2Put)
                    {
                        GridLayout = Columns;
                        field(Group2PutSetURL; this.PutUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.NoAuthUrlToAccess := 'https://api.restful-api.dev/objects/%1';
                            end;
                        }
                        field(Group2PutExecute; this.PutLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.APINoAuthReqResMgmt.PutRecord(this.NoAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(Group2Patch)
                    {
                        GridLayout = Columns;
                        field(Group2PatchSetURL; this.PatchUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.NoAuthUrlToAccess := 'https://api.restful-api.dev/objects/%1';
                            end;
                        }
                        field(Group2PatchExecute; this.PatchLbl)
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.APINoAuthReqResMgmt.PatchRecord(this.NoAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(Group2Delete)
                    {
                        GridLayout = Columns;
                        field(Group2DeleteSetURL; this.DeleteUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.NoAuthUrlToAccess := 'https://api.restful-api.dev/objects/%1';
                            end;
                        }
                        field(Group2DeleteExecute; this.DeleteLbl)
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.APINoAuthReqResMgmt.DeleteRecord(this.NoAuthUrlToAccess);
                            end;
                        }
                    }
                }
            }
            group(Group3)
            {
                Caption = 'Basic Auth API';
                Group(Group3Refrences)
                {
                    Caption = 'References';
                    field(Group3AuthUrl; this.BasicAuthUrlLbl)
                    {
                        Caption = 'Website';
                        ToolTip = 'Specifies the value of the Website field.';
                        Editable = false;
                        ExtendedDatatype = Url;
                    }
                    field(Group3URLToAccess; this.BasicAuthUrlToAccess)
                    {
                        Caption = 'Execute URL';
                        ToolTip = 'Specifies the value of the Execute URL field.';
                        ShowMandatory = true;
                        ExtendedDatatype = Url;
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
                    field(Group3output; this.BasicAuthResponse)
                    {
                        ApplicationArea = All;
                        ExtendedDatatype = Url;
                        Editable = false;
                        Caption = 'Output';
                        ToolTip = 'Specifies the value of the Output field.';
                    }
                }
                group(Group3actions)
                {
                    Caption = 'Actions';
                    grid(Group3Get)
                    {
                        GridLayout = Columns;
                        field(Group3GetSetURL; this.GetUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthUrlToAccess := 'http://localhost:7048/BC240/api/v2.0/companies(9de49c12-b738-ef11-8e52-6045bdaca463)/customers';
                            end;
                        }
                        field(Group3GetExecute; this.GetLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthReqResMgmt.SetUsernameandPassword(this.Username, this.Password);
                                this.BasicAuthReqResMgmt.GetRecords(this.BasicAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(Group3Post)
                    {
                        GridLayout = Columns;
                        field(Group3PostSetURL; this.PostUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthUrlToAccess := 'http://localhost:7048/BC240/api/v2.0/companies(9de49c12-b738-ef11-8e52-6045bdaca463)/customers';
                            end;
                        }
                        field(Group3PostExecute; this.PostLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthReqResMgmt.SetUsernameandPassword(this.Username, this.Password);
                                this.BasicAuthReqResMgmt.PostRecord(this.BasicAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(Group3Put)
                    {
                        GridLayout = Columns;
                        field(Group3PutSetURL; this.PutUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthUrlToAccess := 'http://localhost:7048/BC240/api/v2.0/companies(9de49c12-b738-ef11-8e52-6045bdaca463)/customers';
                            end;
                        }
                        field(Group3PutExecute; this.PutLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthReqResMgmt.SetUsernameandPassword(this.Username, this.Password);
                                this.BasicAuthReqResMgmt.PutRecord(this.BasicAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(Group3Patch)
                    {
                        GridLayout = Columns;
                        field(Group3PatchSetURL; this.PatchUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthUrlToAccess := 'http://localhost:7048/BC240/api/v2.0/companies(9de49c12-b738-ef11-8e52-6045bdaca463)/customers(%1)';
                            end;
                        }
                        field(Group3PatchExecute; this.PatchLbl)
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthReqResMgmt.SetUsernameandPassword(this.Username, this.Password);
                                this.BasicAuthReqResMgmt.PatchRecord(this.BasicAuthUrlToAccess);
                            end;
                        }
                    }
                    grid(Group3Delete)
                    {
                        GridLayout = Columns;
                        field(Group3DeleteSetURL; this.DeleteUrlLbl)
                        {
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthUrlToAccess := 'http://localhost:7048/BC240/api/v2.0/companies(9de49c12-b738-ef11-8e52-6045bdaca463)/customers(%1)';
                            end;
                        }
                        field(Group3DeleteExecute; this.DeleteLbl)
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                this.BasicAuthReqResMgmt.SetUsernameandPassword(this.Username, this.Password);
                                this.BasicAuthReqResMgmt.DeleteRecord(this.BasicAuthUrlToAccess);
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
                ApplicationArea = All;
                ToolTip = 'Shows the log entries.';
                Image = ErrorLog;
                RunObject = Page "KNH API Log Entries";
            }
        }
        area(Promoted)
        {
            actionref(LogEntries_Ref; LogEntries) { }
        }
    }

    trigger OnOpenPage()
    begin
        this.NoAuthResponse := CopyStr(GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"KNH Products"), 1, 1024);
        this.DummyNoAuthResponse := CopyStr(GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"KNH Employees"), 1, 1024);
        this.BasicAuthResponse := CopyStr(GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"KNH Customer"), 1, 1024);
    end;

    var
        BasicAuthReqResMgmt: Codeunit "KNH Customer API Integration";
        APINoAuthReqResMgmt: Codeunit "KNH Product API Integration";
        DummyRestAPIReqResMgmt: Codeunit "KNH Employee API Integration";
        NoAuthUrlToAccess, DummyUrlToAccess, BasicAuthUrlToAccess : Text[1024];
        NoAuthResponse, DummyNoAuthResponse, BasicAuthResponse : Text[1024];
        Username, Password : Text;
        NoAuthUrlLbl: Label 'https://restful-api.dev/';
        DummyAuthUrlLbl: Label 'https://dummy.restapiexample.com/';
        BasicAuthUrlLbl: Label 'https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/resources/dynamics_customer';
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
