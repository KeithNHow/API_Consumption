namespace APIConsumption;
using System.RestClient;

codeunit 53704 "KNH Product Integration"
{
    procedure GetRecords(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHProductAPIPayload.GetProductPayload()), this.HttpMethod::GET);
        this.KNHProductAPIResponse.GetResponse(this.ResponseMsg);
    end;

    procedure PostRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHProductAPIPayload.PostProductPayload()), this.HttpMethod::POST);
        this.KNHProductAPIResponse.PostResponse(this.ResponseMsg);
    end;

    procedure PutRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHProductAPIPayload.PutProductPayload()), this.HttpMethod::PUT);
        this.KNHProductAPIResponse.PutResponse(this.ResponseMsg);
    end;

    procedure PatchRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHProductAPIPayload.PatchProductPayload()), this.HttpMethod::PATCH);
        this.KNHProductAPIResponse.PatchResponse(this.ResponseMsg);
    end;

    procedure DeleteRecord(URLToAccess: Text)
    begin
        this.CheckMandatoryAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.client, this.GetContentwithHeader(this.KNHProductAPIPayload.DeleteProductPayload()), this.HttpMethod::DELETE);
        this.KNHProductAPIResponse.DeleteResponse(this.ResponseMsg);
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
        contentHeaders: HttpHeaders;
    begin
        Clear(this.Client);
        if Payload <> '' then
            Content.WriteFrom(payload);

        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
    end;

    var
        KNHRestApiMgmt: Codeunit "KNH Rest API Mgmt.";
        KNHProductAPIPayload: Codeunit "KNH Product Payload";
        KNHProductAPIResponse: Codeunit "KNH Product Response";
        Client: HttpClient;
        ResponseMsg: HttpResponseMessage;
        HttpMethod: Enum "Http Method";
        ResponseStatus: Boolean;
}