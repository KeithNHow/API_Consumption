namespace APIConsumption;

codeunit 50002 "KNH Employee API Payload"
{
    internal procedure GetEmployeePayload() payload: Text
    begin
        payload := '';
    end;

    internal procedure PostEmployeePayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('name', 'Saurav');
        JsonPayload.Add('salary', 100);
        JsonPayload.Add('age', 39);
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure PutEmployeePayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('name', 'Saurav');
        JsonPayload.Add('salary', 100);
        JsonPayload.Add('age', 39);
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure PatchEmployeePayload() payload: Text
    begin
        payload := '';
    end;

    internal procedure DeleteEmployeePayload() payload: Text
    begin
        payload := '';
    end;
}
