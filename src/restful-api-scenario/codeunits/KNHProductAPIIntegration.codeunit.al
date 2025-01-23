namespace APIConsumption;
using System.RestClient;

codeunit 50004 "KNH Product API Integration"
{
    procedure GetRecords(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GenrateGetPayload()), this.HttpMethod::GET);
        this.KNHAPIDataMgmt.HandleGetResponse(this.ResponseMsg);
    end;

    procedure PostRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GenratePostPayload()), this.HttpMethod::POST);
        this.KNHAPIDataMgmt.HandlePostResponse(this.ResponseMsg);
    end;

    procedure PutRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GenratePutPayload()), this.HttpMethod::PUT);
        this.KNHAPIDataMgmt.HandlePutResponse(this.ResponseMsg);
    end;

    procedure PatchRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GenratePatchPayload()), this.HttpMethod::PATCH);
        this.KNHAPIDataMgmt.HandlePatchResponse(this.ResponseMsg);
    end;

    procedure DeleteRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GenrateDeletePayload()), this.HttpMethod::DELETE);
        this.KNHAPIDataMgmt.HandleDeleteResponse(this.ResponseMsg);
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

    procedure GetContentwithHeader(payload: Text) content: HttpContent
    var
        contentHeaders: HttpHeaders;
    begin
        Clear(this.Client);
        if payload <> '' then
            content.WriteFrom(payload);

        content.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        contentHeaders.Add('Content-Type', 'application/json');
    end;

    var
        KNHRestApiMgmt: Codeunit "KNH Rest API Mgmt.";
        PayloadGenerator: Codeunit "KNH Product API Payload";
        KNHAPIDataMgmt: Codeunit "KNH Product API Response";
        ResponseMsg: HttpResponseMessage;
        HttpMethod: Enum "Http Method";
        ResponseStatus: Boolean;
        Client: HttpClient;
}