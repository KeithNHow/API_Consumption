namespace KNHAPIConsumption;
using System.RestClient;

codeunit 53701 "KNH Employee Integration"
{
    var
        KNHEmployeeAPIPayload: Codeunit "KNH Employee Payload";
        KNHEmployeeAPIResponse: Codeunit "KNH Employee Response";
        KNHRestApiMgmt: Codeunit "KNH Rest Api Mgmt.";
        ResponseStatus: Boolean;
        HttpMethod: Enum "Http Method";
        Client: HttpClient;
        ResponseMsg: HttpResponseMessage;

    internal procedure GetRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.Client, this.GetContentwithHeader(this.KNHEmployeeAPIPayload.GetEmployeePayload()), this.HttpMethod::GET);
        this.KNHEmployeeAPIResponse.GetResponse(this.ResponseMsg);
    end;

    internal procedure PostRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.Client, this.GetContentwithHeader(this.KNHEmployeeAPIPayload.PostEmployeePayload()), this.HttpMethod::POST);
        this.KNHEmployeeAPIResponse.PostResponse(this.ResponseMsg);
    end;

    internal procedure PutRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.Client, this.GetContentwithHeader(this.KNHEmployeeAPIPayload.PutEmployeePayload()), this.HttpMethod::PUT);
        this.KNHEmployeeAPIResponse.PutResponse(this.ResponseMsg);
    end;

    internal procedure PatchRecord(URLToAccess: Text)
    begin
        Error('This API does not support patch request.');
    end;

    internal procedure DeleteRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.Client, this.GetContentwithHeader(this.KNHEmployeeAPIPayload.DeleteEmployeePayload()), this.HttpMethod::DELETE);
        this.KNHEmployeeAPIResponse.DeleteResponse(this.ResponseMsg);
    end;

    local procedure CheckUrlAndReset(URLToAccess: Text)
    begin
        if URLToAccess = '' then
            Error('URL cannot be empty');

        if StrPos(URLToAccess, '.') = 0 then
            Error('Execute URL must have a dot');

        Clear(this.ResponseMsg);
        Clear(this.HttpMethod);
        Clear(this.ResponseStatus);
    end;

    local procedure GetContentwithHeader(Payload: Text) Content: HttpContent
    var
        ContentHeaders: HttpHeaders;
    begin
        Clear(this.Client);
        if Payload <> '' then
            Content.WriteFrom(Payload);

        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
    end;
}