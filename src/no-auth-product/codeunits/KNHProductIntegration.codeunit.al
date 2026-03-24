namespace KNHAPIConsumption;
using System.RestClient;

codeunit 53704 "KNH Product Integration"
{
    var
        KNHProductPayload: Codeunit "KNH Product Payload";
        KNHProductResponse: Codeunit "KNH Product Response";
        KNHRestAPIMgmt: Codeunit "KNH Rest Api Mgmt.";
        ResponseStatus: Boolean;
        HttpMethod: Enum "Http Method";
        HttpClient: HttpClient;
        ResponseMsg: HttpResponseMessage;

    internal procedure GetRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.HttpClient, this.GetContentwithHeader(this.KNHProductPayload.GetProductPayload()), this.HttpMethod::GET);
        this.KNHProductResponse.GetResponse(this.ResponseMsg);
    end;

    internal procedure PostRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.HttpClient, this.GetContentwithHeader(this.KNHProductPayload.PostProductPayload()), this.HttpMethod::POST);
        this.KNHProductResponse.PostResponse(this.ResponseMsg);
    end;

    internal procedure PutRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.HttpClient, this.GetContentwithHeader(this.KNHProductPayload.PutProductPayload()), this.HttpMethod::PUT);
        this.KNHProductResponse.PutResponse(this.ResponseMsg);
    end;

    internal procedure PatchRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.HttpClient, this.GetContentwithHeader(this.KNHProductPayload.PatchProductPayload()), this.HttpMethod::PATCH);
        this.KNHProductResponse.PatchResponse(this.ResponseMsg);
    end;

    internal procedure DeleteRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeContentRequest(URLToAccess, this.HttpClient, this.GetContentwithHeader(this.KNHProductPayload.DeleteProductPayload()), this.HttpMethod::DELETE);
        this.KNHProductResponse.DeleteResponse(this.ResponseMsg);
    end;

    local procedure CheckUrlAndReset(URLToAccess: Text)
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
        Clear(this.HttpClient);
        if Payload <> '' then
            Content.WriteFrom(Payload);

        Content.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        contentHeaders.Add('Content-Type', 'application/json');
    end;
}