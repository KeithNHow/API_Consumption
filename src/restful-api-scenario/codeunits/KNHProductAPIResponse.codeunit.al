namespace APIConsumption;

codeunit 50006 "KNH Product API Response"
{
    internal procedure HandleGetResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        this.WriteRecordinDatabase(this.ResponseText, false);
        Message('Get Processed Succesfully!');
    end;

    internal procedure HandlePostResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        this.WriteRecordinDatabase(this.ResponseText, true);
        Message('Post Processed Succesfully!');
    end;

    internal procedure HandlePutResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        Message('%1', this.ResponseText);
    end;

    internal procedure HandlePatchResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        Message('%1', this.ResponseText);
    end;

    internal procedure HandleDeleteResponse(ResponseMsg: HttpResponseMessage)
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
        clear(ResponseID);
        clear(Responsename);

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
            ProductDetailObject.get(parameterkeys.Get(i), ProductToken);
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
        SDHRestNoAuthHeader: Record "KNH Product Header";
    begin
        if ResponseID = '' then
            exit;

        if SDHRestNoAuthHeader.Get(ResponseID) then
            exit;

        SDHRestNoAuthHeader.Init();
        SDHRestNoAuthHeader.id := ResponseID;
        SDHRestNoAuthHeader.name := CopyStr(Responsename, 1, 250);
        sdhRestNoAuthHeader."Not Reserved" := IsNotReserved;
        SDHRestNoAuthHeader.Insert(true);
    end;

    local procedure writeLineinDatabase(ResponseID: Code[50]; Param: Text; Val: Text)
    var
        SDHRestNoAuthLine: Record "KNH Product Lines";
    begin
        if ResponseID = '' then
            exit;

        SDHRestNoAuthLine.SetRange("id", ResponseID);
        SDHRestNoAuthLine.SetRange(Parameter, Param);
        if not SDHRestNoAuthLine.IsEmpty() then
            exit;

        SDHRestNoAuthLine.Init();
        SDHRestNoAuthLine.id := ResponseID;
        SDHRestNoAuthLine."Line No." := 0;
        SDHRestNoAuthLine.Parameter := CopyStr(Param, 1, 250);
        SDHRestNoAuthLine.Value := Copystr(Val, 1, 250);
        SDHRestNoAuthLine.Insert(true);
    end;

    var
        ResponseText: Text;
}