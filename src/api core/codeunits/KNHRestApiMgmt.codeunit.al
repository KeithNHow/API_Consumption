///<summary>
///</summary>
namespace KNHAPIConsumption;

codeunit 53700 "KNH Rest Api Mgmt."
{
    internal procedure MakeContentRequest(URLToAccess: Text; Client: HttpClient; Content: HttpContent; HttpMethod: Enum System.RestClient."Http Method") Response: HttpResponseMessage
    var
        ResponseStatus: Boolean;
        Request: HttpRequestMessage;
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

    internal procedure MakeRequest(URLToAccess: Text; Request: HttpRequestMessage; HttpMethod: Enum System.RestClient."Http Method") response: HttpResponseMessage
    var
        ResponseStatus: Boolean;
        Client: HttpClient;
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
        ResponseStatus := Client.Send(Request, response);
        this.LogApiTransaction(URLToAccess, HttpMethod, Request, response, ResponseStatus);
    end;

    local procedure LogApiTransaction(URLToAccess: Text; HttpMethod: Enum System.RestClient."Http Method"; Request: HttpRequestMessage; var Response: HttpResponseMessage; ResponseStatus: Boolean)
    var
        LogEntry: Record "KNH Interface Log Entry";
        RequestInstream, ResponseInstream : InStream;
    begin
        Request.Content.ReadAs(RequestInstream);
        Response.Content.ReadAs(ResponseInstream);
        LogEntry.AddNewLogEntry(URLToAccess, HttpMethod, RequestInstream, ResponseInstream, Response.HttpStatusCode, ResponseStatus);
    end;
}