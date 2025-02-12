namespace APIConsumption;

codeunit 50003 "KNH Employee API Response"
{
    internal procedure GetResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        this.ParseEmployeeResponse(this.ResponseText);
        Message('Get Processed Succesfully!');
    end;

    internal procedure PostResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        Message('%1', this.ResponseText);
    end;

    internal procedure PutResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        Message('%1', this.ResponseText);
    end;

    internal procedure PatchResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        Message('%1', this.ResponseText);
    end;

    internal procedure DeleteResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        Message('%1', this.ResponseText);
    end;

    local procedure ReviewResponseStatusCode(ResponseMsg: HttpResponseMessage)
    begin
        Clear(this.ResponseText);
        ResponseMsg.Content.ReadAs(this.ResponseText);
        if not ResponseMsg.IsSuccessStatusCode then
            Error('%1 - %2', ResponseMsg.HttpStatusCode, this.ResponseText);
    end;

    local procedure ParseEmployeeResponse(OutputString: Text)
    var
        EmployeeJson, EmployeeObject : JsonObject;
        EmployessArray: JsonArray;
        StatusJsonToken, EmployeesToken, EmployeeToken, ResultToken : JsonToken;
        ResponseID, ResponseAge : Integer;
        ResponseName: Text;
        ResponseSalary: Decimal;
    begin
        EmployeeJson.ReadFrom(OutputString);

        if not EmployeeJson.Get('status', StatusJsonToken) then
            Error('Invalid Response!');

        if StatusJsonToken.AsValue().AsText() <> 'success' then
            Error('Invalid Response!');

        if EmployeeJson.Get('data', EmployeesToken) then
            if EmployeesToken.IsArray() then
                EmployessArray := EmployeesToken.AsArray();

        foreach EmployeeToken in EmployessArray do begin

            EmployeeObject := EmployeeToken.AsObject();

            EmployeeObject.Get('id', ResultToken);
            ResponseID := ResultToken.AsValue().AsInteger();

            EmployeeObject.Get('employee_name', ResultToken);
            ResponseName := ResultToken.AsValue().AsText();

            EmployeeObject.Get('employee_salary', ResultToken);
            ResponseSalary := ResultToken.AsValue().AsDecimal();

            EmployeeObject.Get('employee_age', ResultToken);
            ResponseAge := ResultToken.AsValue().AsInteger();

            this.WriteRecordsinDatabase(ResponseID, ResponseName, ResponseSalary, ResponseAge);
        end;
    end;

    local procedure WriteRecordsinDatabase(var ResponseID: Integer; var ResponseName: Text; var ResponseSalary: Decimal; var ResponseAge: Integer)
    var
        DemoTable: Record "KNH Employee";
    begin
        if ResponseID = 0 then
            exit;

        if DemoTable.Get(ResponseID) then
            exit;

        DemoTable.Init();
        DemoTable.Validate(id, ResponseID);
        DemoTable.Validate(Name, ResponseName);
        DemoTable.Validate(Salary, ResponseSalary);
        DemoTable.Validate(Age, ResponseAge);
        DemoTable.Insert(true);

        Clear(ResponseID);
        Clear(ResponseName);
        Clear(ResponseSalary);
        Clear(ResponseAge);
    end;

    var
        ResponseText: Text;
}