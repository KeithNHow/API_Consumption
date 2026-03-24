namespace KNHAPIConsumption;

codeunit 53708 "KNH Customer Payload"
{
    internal procedure GetCustomerPayload() Payload: Text
    begin
        Payload := '';
    end;

    internal procedure PostCustomerPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('Name', '');
        JsonPayload.Add('Address', '');
        JsonPayload.Add('Address 2', '');
        JsonPayload.Add('Phone No.', '');
        JsonPayload.Add('Email', '');
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure PutCustomerPayload() Payload: Text
    begin
    end;

    internal procedure PatchCustomerPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('Name', '');
        JsonPayload.Add('Email', '');
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure DeleteCustomerPayload() Payload: Text
    begin
        Payload := '';
    end;
}
