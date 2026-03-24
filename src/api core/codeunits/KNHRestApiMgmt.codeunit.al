///<summary>
/// MakeContentRequest - Receives values for Url, Httpclient, HttpContent, HttpMethod, HttpResponse, Checks which HttpMethod has made call, and calls log trans proc.
/// MakeRequest - Receives values for Url, HttpRequest, HttpMethod, HttpResponse, Checks which HttpMethod has made call, and calls log trans proc
/// LogTransaction - Recives values for url, HttpMethod, RequestMessage, ResponseMessage, ResponseStatus, Reads content and calls AddNewLogEntry proc
///</summary>
namespace KNHAPIConsumption;

codeunit 53700 "KNH Rest Api Mgmt."
{
    internal procedure MakeContentRequest(URLToAccess: Text; Client: HttpClient; Content: HttpContent; HttpMethod: Enum System.RestClient."Http Method") HttpResponseMessage: HttpResponseMessage
    var
        ResponseStatus: Boolean;
        HttpRequestMessage: HttpRequestMessage;
    begin
        HttpRequestMessage.Content := Content;
        HttpRequestMessage.SetRequestUri(URLToAccess);

        case HttpMethod of
            HttpMethod::GET:
                HttpRequestMessage.Method := 'GET';
            HttpMethod::POST:
                HttpRequestMessage.Method := 'POST';
            HttpMethod::PUT:
                HttpRequestMessage.Method := 'PUT';
            HttpMethod::PATCH:
                HttpRequestMessage.Method := 'PATCH';
            HttpMethod::DELETE:
                HttpRequestMessage.Method := 'DELETE';
        end;
        ResponseStatus := Client.Send(HttpRequestMessage, HttpResponseMessage);
        this.LogTransaction(URLToAccess, HttpMethod, HttpRequestMessage, HttpResponseMessage, ResponseStatus);
    end;

    internal procedure MakeRequest(URLToAccess: Text; HttpRequestMethod: HttpRequestMessage; HttpMethod: Enum System.RestClient."Http Method") HttpResponseMessage: HttpResponseMessage
    var
        ResponseStatus: Boolean;
        HttpClient: HttpClient;
    begin
        HttpRequestMethod.SetRequestUri(URLToAccess);

        case HttpMethod of
            HttpMethod::GET:
                HttpRequestMethod.Method := 'GET';
            HttpMethod::POST:
                HttpRequestMethod.Method := 'POST';
            HttpMethod::PUT:
                HttpRequestMethod.Method := 'PUT';
            HttpMethod::PATCH:
                HttpRequestMethod.Method := 'PATCH';
            HttpMethod::DELETE:
                HttpRequestMethod.Method := 'DELETE';
        end;
        ResponseStatus := HttpClient.Send(HttpRequestMethod, HttpResponseMessage);
        this.LogTransaction(URLToAccess, HttpMethod, HttpRequestMethod, HttpResponseMessage, ResponseStatus);
    end;

    local procedure LogTransaction(URLToAccess: Text; HttpMethod: Enum System.RestClient."Http Method"; HttpRequestMessage: HttpRequestMessage; var HttpResponseMessage: HttpResponseMessage; ResponseStatus: Boolean)
    var
        LogEntry: Record "KNH Interface Log Entry";
        RequestInstream, ResponseInstream : InStream;
    begin
        HttpRequestMessage.Content.ReadAs(RequestInstream);
        HttpResponseMessage.Content.ReadAs(ResponseInstream);
        LogEntry.AddNewLogEntry(URLToAccess, HttpMethod, RequestInstream, ResponseInstream, HttpResponseMessage.HttpStatusCode, ResponseStatus);
    end;
}