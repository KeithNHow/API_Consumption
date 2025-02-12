//Proc Make Content Request - Url, client, content, method - returns response
//Proc Make Request - Url, request, method - returns response 

namespace APIConsumption;

codeunit 50000 "KNH Rest Api Mgmt."
{
    procedure MakeContentRequest(URLToAccess: Text; Client: HttpClient; Content: HttpContent; HttpMethod: Enum System.RestClient."Http Method") Response: HttpResponseMessage
    var
        Request: HttpRequestMessage;
        ResponseStatus: Boolean;
    begin
        Request.Content := Content;
        Request.SetRequestUri(URLToAccess);

        case HttpMethod of
            HttpMethod::GET:
                Request.Method := 'GET';
            HttpMethod::POST:
                Request.Method := 'POST';
            HttpMethod::PUT:
                Request.Method := 'PUT';
            HttpMethod::PATCH:
                Request.Method := 'PATCH';
            HttpMethod::DELETE:
                Request.Method := 'DELETE';
        end;
        ResponseStatus := Client.Send(Request, Response);
        this.LogApiTransaction(URLToAccess, HttpMethod, Request, Response, ResponseStatus);
    end;

    procedure MakeRequest(URLToAccess: Text; Request: HttpRequestMessage; HttpMethod: Enum System.RestClient."Http Method") response: HttpResponseMessage
    var
        Client: HttpClient;
        ResponseStatus: Boolean;
    begin
        Request.SetRequestUri(URLToAccess);

        case HttpMethod of
            HttpMethod::GET:
                Request.Method := 'GET';
            HttpMethod::POST:
                Request.Method := 'POST';
            HttpMethod::PUT:
                Request.Method := 'PUT';
            HttpMethod::PATCH:
                Request.Method := 'PATCH';
            HttpMethod::DELETE:
                Request.Method := 'DELETE';
        end;
        ResponseStatus := Client.Send(Request, Response);
        this.LogApiTransaction(URLToAccess, HttpMethod, Request, Response, ResponseStatus);
    end;

    local procedure LogApiTransaction(URLToAccess: Text; HttpMethod: Enum System.RestClient."Http Method"; Request: HttpRequestMessage; var Response: HttpResponseMessage; ResponseStatus: Boolean)
    var
        LogEntry: Record "KNH API Log Entry";
        RequestInstream, ResponseInstream : InStream;
    begin
        Request.Content.ReadAs(RequestInstream);
        Response.Content.ReadAs(ResponseInstream);
        LogEntry.AddNewLogEntry(URLToAccess, HttpMethod, RequestInstream, ResponseInstream, Response.HttpStatusCode, ResponseStatus);
    end;
}