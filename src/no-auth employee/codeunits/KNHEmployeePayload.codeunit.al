namespace APIConsumption;

codeunit 53702 "KNH Employee Payload"
{
    internal procedure GetEmployeePayload() payload: Text
    begin
        payload := '';
    end;

    internal procedure PostEmployeePayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('name', 'Mary How');
        JsonPayload.Add('salary', 25000);
        JsonPayload.Add('age', 84);
        JsonPayload.WriteTo(Payload);
    end;

    internal procedure PutEmployeePayload() Payload: Text
    var
        JsonPayload: JsonObject;
    begin
        JsonPayload.Add('name', 'Keith How');
        JsonPayload.Add('salary', 20000);
        JsonPayload.Add('age', 61);
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
