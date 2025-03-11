namespace APIConsumption;

codeunit 50008 "KNH Customer Payload"
{
    internal procedure GetCustomerPayload() Payload: Text
    begin
        payload := '';
    end;

    internal procedure PostCustomerPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('Name', 'Keith How');
        JsonPayload.Add('Address', 'Shepherds Bush');
        JsonPayload.Add('Address 2', 'London');
        JsonPayload.Add('Phone No.', '+44 (0) 7816 509415');
        JsonPayload.Add('Email', 'keithhow@metronet.co.com');
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure PutCustomerPayload() Payload: Text
    begin
    end;

    internal procedure PatchCustomerPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('Name', 'Mark How');
        JsonPayload.Add('Email', 'markhow@metronet.co.uk');
        JsonPayload.WriteTo(payload);
    end;

    internal procedure DeleteCustomerPayload() Payload: Text
    begin
        Payload := '';
    end;
}
