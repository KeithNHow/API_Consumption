namespace KNHAPIConsumption;
using System.RestClient;
using System.Text;

codeunit 53707 "KNH Customer Integration"
{
    var
        KNHCustomerAPIPayload: Codeunit "KNH Customer Payload";
        KNHCustomerAPIResponse: Codeunit "KNH Customer Response";
        KNHRestApiMgmt: Codeunit "KNH Rest Api Mgmt.";
        ResponseStatus: Boolean;
        HttpMethod: Enum "Http Method";
        ResponseMsg: HttpResponseMessage;
        Password, Username : Text;

    procedure GetRecords(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.GetHttpRequestMessage(this.KNHCustomerAPIPayload.GetCustomerPayload()), this.HttpMethod::GET);
        this.KNHCustomerAPIResponse.GetResponse(this.ResponseMsg);
    end;

    procedure PostRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.GetHttpRequestMessage(this.KNHCustomerAPIPayload.PostCustomerPayload()), this.HttpMethod::POST);
        this.KNHCustomerAPIResponse.PostResponse(this.ResponseMsg);
    end;

    procedure PutRecord(URLToAccess: Text)
    begin
        Error('This API does not support put request.');
    end;

    procedure PatchRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.GetHttpRequestMessage(this.KNHCustomerAPIPayload.PatchCustomerPayload()), this.HttpMethod::PATCH);
        this.KNHCustomerAPIResponse.PatchResponse(this.ResponseMsg);
    end;

    procedure DeleteRecord(URLToAccess: Text)
    begin
        this.CheckUrlAndReset(URLToAccess);
        this.ResponseMsg := this.KNHRestApiMgmt.MakeRequest(URLToAccess, this.GetHttpRequestMessage(this.KNHCustomerAPIPayload.DeleteCustomerPayload()), this.HttpMethod::DELETE);
        this.KNHCustomerAPIResponse.DeleteResponse(this.ResponseMsg);
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

    local procedure GetHttpRequestMessage(payload: Text) RequestMessage: HttpRequestMessage
    var
        HttpContent: HttpContent;
        ContentHeader, RequestHeader : HttpHeaders;
    begin
        RequestMessage.GetHeaders(RequestHeader);
        RequestHeader.Add('Authorization', this.GetAuthroizationHeader());
        RequestHeader.Add('If-Match', '*');

        HttpContent.WriteFrom(payload);
        HttpContent.GetHeaders(ContentHeader);
        ContentHeader.Remove('Content-Type');
        ContentHeader.Add('Content-Type', 'application/json');

        RequestMessage.Content(HttpContent);
    end;

    local procedure GetAuthroizationHeader() AuthString: Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        AuthStringLbl: Label 'Basic %1', Comment = '%1 = Username';
    begin
        AuthString := StrSubstNo('%1:%2', this.Username, this.Password);
        AuthString := Base64Convert.ToBase64(AuthString);
        AuthString := StrSubstNo(AuthStringLbl, AuthString);
    end;
}