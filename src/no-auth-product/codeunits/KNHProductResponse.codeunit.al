namespace APIConsumption;

codeunit 53706 "KNH Product Response"
{
    internal procedure GetResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        this.WriteRecordinDatabase(this.ResponseText, false);
        Message('Get Processed Succesfully!');
    end;

    internal procedure PostResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        this.WriteRecordinDatabase(this.ResponseText, true);
        Message('Post Processed Succesfully!');
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

    local procedure WriteRecordinDatabase(pResponseText: Text; IsNotReserved: Boolean)
    var
        ProductObject: JsonObject;
        ProductArray: JsonArray;
        IsObject: Boolean;
    begin
        IsObject := ProductObject.ReadFrom(pResponseText);

        if not IsObject then
            if not ProductArray.ReadFrom(pResponseText) then
                Error('Invalid JSON format');

        if IsObject then
            this.ReadTheObject(ProductObject, IsNotReserved)
        else
            this.ReadTheArray(ProductArray, IsNotReserved);
    end;

    local procedure ReadTheObject(ProductObject: JsonObject; IsNotReserved: Boolean)
    var
        ProductDetailObject: JsonObject;
        ProductToken: JsonToken;
        i: Integer;
        parameterkeys: List of [Text];
        Responsename: Text;
        ResponseID: Code[50];
    begin
        Clear(ResponseID);
        Clear(Responsename);

        ProductObject.Get('id', ProductToken);
        ResponseID := CopyStr(ProductToken.AsValue().AsCode(), 1, 50);

        ProductObject.Get('name', ProductToken);
        Responsename := ProductToken.AsValue().AsText();

        this.WriteHeaderInDatabase(ResponseID, Responsename, IsNotReserved);

        if ProductObject.Get('data', ProductToken) then
            if ProductToken.IsObject() then
                ProductDetailObject := ProductToken.AsObject();

        parameterkeys := ProductDetailObject.Keys();

        for i := 1 to parameterkeys.Count() do begin
            ProductDetailObject.Get(parameterkeys.Get(i), ProductToken);
            this.writeLineinDatabase(ResponseID, parameterkeys.Get(i), ProductToken.AsValue().AsText());
        end;
    end;

    local procedure ReadTheArray(ProductArray: JsonArray; IsNotReserved: Boolean)
    var
        ProductToken: JsonToken;
        ProductObject: JsonObject;
    begin
        foreach ProductToken in ProductArray do begin
            ProductObject := ProductToken.AsObject();
            this.ReadTheObject(ProductObject, IsNotReserved);
        end;
    end;

    local procedure WriteHeaderInDatabase(ResponseID: Code[50]; Responsename: Text; IsNotReserved: Boolean)
    var
        KNHProductNoAuthHeader: Record "KNH Product Header";
    begin
        if ResponseID = '' then
            exit;

        if KNHProductNoAuthHeader.Get(ResponseID) then
            exit;

        KNHProductNoAuthHeader.Init();
        KNHProductNoAuthHeader.id := ResponseID;
        KNHProductNoAuthHeader.name := CopyStr(Responsename, 1, 250);
        KNHProductNoAuthHeader."Not Reserved" := IsNotReserved;
        KNHProductNoAuthHeader.Insert(true);
    end;

    local procedure writeLineinDatabase(ResponseID: Code[50]; Param: Text; Val: Text)
    var
        KNHProductNoAuthLine: Record "KNH Product Lines";
    begin
        if ResponseID = '' then
            exit;

        KNHProductNoAuthLine.SetRange("id", ResponseID);
        KNHProductNoAuthLine.SetRange(Parameter, Param);
        if not KNHProductNoAuthLine.IsEmpty() then
            exit;

        KNHProductNoAuthLine.Init();
        KNHProductNoAuthLine.id := ResponseID;
        KNHProductNoAuthLine."Line No." := 0;
        KNHProductNoAuthLine.Parameter := CopyStr(Param, 1, 250);
        KNHProductNoAuthLine.Value := Copystr(Val, 1, 250);
        KNHProductNoAuthLine.Insert(true);
    end;

    var
        ResponseText: Text;
}