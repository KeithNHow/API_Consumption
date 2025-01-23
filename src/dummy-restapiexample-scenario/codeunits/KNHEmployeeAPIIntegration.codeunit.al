namespace APIConsumption;
using System.RestClient;

codeunit 50001 "KNH Employee API Integration"
{
    procedure GetRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GenerateGetPayload()), this.HttpMethod::GET);
        this.KNHDummyRestApiDataMgmt.HandleGetResponse(this.ResponseMsg);
    end;

    procedure PostRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GeneratePostPayload()), this.HttpMethod::POST);
        this.KNHDummyRestApiDataMgmt.HandlePostResponse(this.ResponseMsg);
    end;

    procedure PutRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GeneratePutPayload()), this.HttpMethod::PUT);
        this.KNHDummyRestApiDataMgmt.HandlePutResponse(this.ResponseMsg);
    end;

    procedure PatchRecord(URLToAccess: Text)
    begin
        Error('This API does not support patch request.');
    end;

    procedure DeleteRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.client, this.GetContentwithHeader(this.PayloadGenerator.GenrateDeletePayload()), this.HttpMethod::DELETE);
        this.KNHDummyRestApiDataMgmt.HandleDeleteResponse(this.ResponseMsg);
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
        PayloadGenerator: Codeunit "KNH Employee API Payload";
        KNHDummyRestApiDataMgmt: Codeunit "KNH Employee API Response";
        ResponseMsg: HttpResponseMessage;
        HttpMethod: Enum "Http Method";
        ResponseStatus: Boolean;
        Client: HttpClient;
}