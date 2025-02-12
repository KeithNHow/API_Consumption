namespace APIConsumption;

codeunit 50005 "KNH Product API Payload"
{
    internal procedure GetProductPayload() Payload: Text
    begin
        Payload := '';
    end;

    internal procedure PostProductPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('name', 'Post Request');
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure PutProductPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('name', 'Put Request');
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure PatchProductPayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('name', 'Patch Request');
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure DeleteProductPayload() Payload: Text
    begin
        Payload := '';
    end;
}