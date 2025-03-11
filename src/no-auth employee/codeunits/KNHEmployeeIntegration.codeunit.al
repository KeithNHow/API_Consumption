namespace APIConsumption;
using System.RestClient;

codeunit 50001 "KNH Employee Integration"
{
    procedure GetRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHEmployeeAPIPayload.GetEmployeePayload()), this.HttpMethod::GET);
        this.KNHEmployeeAPIResponse.GetResponse(this.ResponseMsg);
    end;

    procedure PostRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHEmployeeAPIPayload.PostEmployeePayload()), this.HttpMethod::POST);
        this.KNHEmployeeAPIResponse.PostResponse(this.ResponseMsg);
    end;

    procedure PutRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHEmployeeAPIPayload.PutEmployeePayload()), this.HttpMethod::PUT);
        this.KNHEmployeeAPIResponse.PutResponse(this.ResponseMsg);
    end;

    procedure PatchRecord(URLToAccess: Text)
    begin
        Error('This API does not support patch request.');
    end;

    procedure DeleteRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHEmployeeAPIPayload.DeleteEmployeePayload()), this.HttpMethod::DELETE);
        this.KNHEmployeeAPIResponse.DeleteResponse(this.ResponseMsg);
    end;

    local procedure CheckMandatoryAndReset(URLToAccess: Text)
    begin
        if URLToAccess = '' then
            Error('URL cannot be empty');

        if StrPos(URLToAccess, '%1') > 0 then
            Error('Execute URL cannot have %1');

        Clear(this.ResponseMsg);
        Clear(this.HttpMethod);
        Clear(this.ResponseStatus);
    end;

    procedure GetContentwithHeader(Payload: Text) Content: HttpContent
    var
        ContentHeaders: HttpHeaders;
    begin
        Clear(this.Client);
        if Payload <> '' then
            Content.WriteFrom(payload);

        Content.GetHeaders(contentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
    end;

    var
        KNHRestApiMgmt: Codeunit "KNH Rest API Mgmt.";
        KNHEmployeeAPIPayload: Codeunit "KNH Employee Payload";
        KNHEmployeeAPIResponse: Codeunit "KNH Employee Response";
        ResponseMsg: HttpResponseMessage;
        HttpMethod: Enum "Http Method";
        ResponseStatus: Boolean;
        Client: HttpClient;
}