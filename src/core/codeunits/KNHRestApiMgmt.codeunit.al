//Two MakeRequest procs - Overload example
//1 - Url, client, content, method      returns response
//2 - Url, request, method              returns response 

namespace APIConsumption;

codeunit 50000 "KNH Rest Api Mgmt."
{
    procedure MakeRequest(URLToAccess: Text; client: HttpClient; content: HttpContent; HttpMethod: Enum System.RestClient."Http Method") response: HttpResponseMessage
    var
        request: HttpRequestMessage;
        ResponseStatus: Boolean;
    begin
        request.Content := content;
        request.SetRequestUri(URLToAccess);

        case HttpMethod of
            HttpMethod::GET:
                request.Method := 'GET';
            HttpMethod::POST:
                request.Method := 'POST';
            HttpMethod::PUT:
                request.Method := 'PUT';
            HttpMethod::PATCH:
                request.Method := 'PATCH';
            HttpMethod::DELETE:
                request.Method := 'DELETE';
        end;
        ResponseStatus := client.Send(request, response);
        this.LogApiTransaction(URLToAccess, HttpMethod, request, response, ResponseStatus);
    end;

    procedure MakeRequest(URLToAccess: Text; request: HttpRequestMessage; HttpMethod: Enum System.RestClient."Http Method") response: HttpResponseMessage
    var
        client: HttpClient;
        ResponseStatus: Boolean;
    begin
        request.SetRequestUri(URLToAccess);

        case HttpMethod of
            HttpMethod::GET:
                request.Method := 'GET';
            HttpMethod::POST:
                request.Method := 'POST';
            HttpMethod::PUT:
                request.Method := 'PUT';
            HttpMethod::PATCH:
                request.Method := 'PATCH';
            HttpMethod::DELETE:
                request.Method := 'DELETE';
        end;
        ResponseStatus := client.Send(request, response);
        this.LogApiTransaction(URLToAccess, HttpMethod, request, response, ResponseStatus);
    end;

    local procedure LogApiTransaction(URLToAccess: Text; HttpMethod: Enum System.RestClient."Http Method"; request: HttpRequestMessage; var response: HttpResponseMessage; ResponseStatus: Boolean)
    var
        LogEntry: Record "KNH API Log Entry";
        RequestInstream, ResponseInstream : InStream;
    begin
        request.Content.ReadAs(RequestInstream);
        response.Content.ReadAs(ResponseInstream);
        LogEntry.AddNewLogEntry(URLToAccess, HttpMethod, RequestInstream, ResponseInstream, response.HttpStatusCode, ResponseStatus);
    end;
}