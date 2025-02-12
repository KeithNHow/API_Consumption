namespace APIConsumption;

codeunit 50008 "KNH Customer API Payload"
{
    internal procedure GetCustomerPayload() Payload: Text
    begin
        payload := '';
    end;

    internal procedure PostCustomerPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('displayName', 'Saurav Dhyani');
        JsonPayload.Add('addressLine1', 'Dehradun Uttrakhand');
        JsonPayload.Add('addressLine2', 'India');
        JsonPayload.Add('phoneNumber', '7812345784');
        JsonPayload.Add('email', 'postsaurav@gmail.com');
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure PutCustomerPayload() Payload: Text
    begin
    end;

    internal procedure PatchCustomerPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('displayName', 'API Patch');
        JsonPayload.Add('phoneNumber', '9999999999');
        JsonPayload.WriteTo(payload);
    end;

    internal procedure DeleteCustomerPayload() Payload: Text
    begin
        Payload := '';
    end;
}
