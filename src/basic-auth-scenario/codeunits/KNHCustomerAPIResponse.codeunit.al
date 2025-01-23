namespace APIConsumption;

codeunit 50009 "KNH Customer API Response"
{
    internal procedure HandleGetResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        this.WriteRecordinDatabase(this.ResponseText);
        Message('Get Processed Succesfully!');
    end;

    internal procedure HandlePostResponse(ResponseMsg: HttpResponseMessage)
    begin
        this.ReviewResponseStatusCode(ResponseMsg);
        this.WriteRecordinDatabase(this.ResponseText);
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

    local procedure WriteRecordinDatabase(pResponseText: Text)
    var
        CustomerObject: JsonObject;
        CustomerArray: JsonArray;
        CustomerToken: JsonToken;
        IsObject: Boolean;
    begin
        CustomerObject.ReadFrom(pResponseText);
        IsObject := not (CustomerObject.Contains('value'));

        if not IsObject then begin
            CustomerObject.ReadFrom(pResponseText);
            CustomerObject.Get('value', CustomerToken);
            CustomerArray := CustomerToken.AsArray();
        end;

        if IsObject then
            ReadTheObject(CustomerObject)
        else
            this.ReadTheArray(CustomerArray);
    end;

    local procedure ReadTheObject(CustomerObject: JsonObject)
    var
        CustomerToken: JsonToken;
        Responsename, ResponseAddress : Text[100];
        ResponseAddress2: Text[50];
        ResponsePhoneNo: Text[30];
        ResponseGUID: Guid;
        ResponseCustomerNo: Code[20];
    begin
        clear(Responsename);
        Clear(ResponseAddress);
        Clear(ResponseAddress2);
        Clear(ResponsePhoneNo);
        Clear(ResponseGUID);
        clear(ResponseCustomerNo);

        CustomerObject.Get('number', CustomerToken);
        ResponseCustomerNo := CopyStr(CustomerToken.AsValue().AsCode(), 1, 20);

        CustomerObject.Get('displayName', CustomerToken);
        Responsename := Copystr(CustomerToken.AsValue().AsText(), 1, 100);

        CustomerObject.Get('addressLine1', CustomerToken);
        ResponseAddress := CopyStr(CustomerToken.AsValue().AsText(), 1, 100);

        CustomerObject.Get('addressLine2', CustomerToken);
        ResponseAddress2 := CopyStr(CustomerToken.AsValue().AsText(), 1, 50);

        CustomerObject.Get('phoneNumber', CustomerToken);
        ResponsePhoneNo := CopyStr(CustomerToken.AsValue().AsText(), 1, 30);

        CustomerObject.Get('id', CustomerToken);
        Evaluate(ResponseGUID, CustomerToken.AsValue().AsText());

        this.WriteHeaderInDatabase(ResponseCustomerNo, Responsename, ResponseAddress, ResponseAddress2, ResponsePhoneNo, ResponseGUID);
    end;

    local procedure ReadTheArray(CustomerArray: JsonArray)
    var
        CustomerToken: JsonToken;
        CustomerObject: JsonObject;
    begin
        foreach CustomerToken in CustomerArray do begin
            CustomerObject := CustomerToken.AsObject();
            this.ReadTheObject(CustomerObject);
        end;
    end;

    local procedure WriteHeaderInDatabase(ResponseCustomerNo: Code[20]; Responsename: Text[100]; ResponseAddress: Text[100]; ResponseAddress2: Text[50]; ResponsePhoneNo: Text[30]; ResponseGUID: Guid)
    var
        SDHCustomer: Record "KNH Customer";
    begin
        if SDHCustomer.Get(ResponseCustomerNo) then
            exit;
        SDHCustomer.Init();
        SDHCustomer.Validate("No.", ResponseCustomerNo);
        SDHCustomer.Validate(Name, Responsename);
        SDHCustomer.Validate(Address, ResponseAddress);
        SDHCustomer.Validate("Address 2", ResponseAddress2);
        SDHCustomer.Validate("Phone No.", ResponsePhoneNo);
        SDHCustomer.Validate("Source System Id", ResponseGUID);
        SDHCustomer.Insert(true);
    end;

    var
        ResponseText: Text;
}