namespace APIConsumption;
using System.RestClient;

table 50000 "KNH API Log Entry"
{
    Caption = 'API Log Entries';
    DataClassification = CustomerContent;
    LookupPageId = "KNH API Log Entries";
    DrillDownPageId = "KNH API Log Entries";
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            ToolTip = 'Specifies the value of the Entry No. field.';
            AutoIncrement = true;
        }
        field(2; URL; Text[2048])
        {
            Caption = 'URL';
            ToolTip = 'Specifies the value of the URL field.';
            ExtendedDatatype = Url;
        }
        field(3; Method; Enum "Http Method")
        {
            Caption = 'Method';
            ToolTip = 'Specifies the value of the Method field.';
        }
        field(4; Request; Blob)
        {
            Caption = 'Request';
            ToolTip = 'Specifies the value of the Request field.';
        }
        field(5; Response; Blob)
        {
            Caption = 'Response';
            ToolTip = 'Specifies the value of the Response field.';
        }
        field(6; "Response Code"; Integer)
        {
            Caption = 'Response Code';
            ToolTip = 'Specifies the value of the Response Code field.';
        }
        field(7; Successful; Boolean)
        {
            Caption = 'Succesful';
            ToolTip = 'Specifies the value of the Succesful field.';
        }
        field(8; "Requested By"; Code[50])
        {
            Caption = 'Requested By';
            ToolTip = 'Specifies the value of the Requested By field.';
        }
        field(9; "Logged On"; Date)
        {
            Caption = 'Logged On';
            ToolTip = 'Specifies the value of the Logged On field.';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure DownloadRequest()
    var
        Instream: InStream;
        FileName: Text;
    begin
        if not Rec.Request.HasValue() then
            exit;
        Rec.SetAutoCalcFields(Request);
        Rec.Request.CreateInStream(Instream);
        FileName := Format(Rec."Entry No.") + '_' + Format(Rec.Method) + '_' + Rec."Requested By" + '_Request.json';
        DownloadFromStream(Instream, 'Export Request', '', 'Json Files (*.json)|*.json', FileName);
    end;

    procedure DownloadResponse()
    var
        Instr: InStream;
        FileName: Text;
    begin
        if not rec.Response.HasValue() then
            exit;
        Rec.SetAutoCalcFields(Response);
        Rec.Response.CreateInStream(Instr);
        FileName := Format(Rec."Entry No.") + '_' + Format(Rec.Method) + '_' + Rec."Requested By" + '_Response.json';
        DownloadFromStream(Instr, 'Export Request', '', 'Json Files (*.json)|*.json', FileName);
    end;

    procedure AddNewLogEntry(URLToAccess: Text; HttpMethod: Enum System.RestClient."Http Method"; RequestStream: InStream; ResponseStream: InStream; ResponseCode: Integer; Success: Boolean)
    var
        LogEntry: Record "KNH API Log Entry";
        OutStream: OutStream;
    begin
        LogEntry.Init();
        LogEntry.URL := CopyStr(URLToAccess, 1, 2048);
        LogEntry.Method := HttpMethod;
        LogEntry."Response Code" := ResponseCode;
        LogEntry.Successful := Success;
        LogEntry."Requested By" := CopyStr(UserId, 1, 50);
        LogEntry."Logged On" := Today();
        LogEntry.Insert(true);

        Clear(OutStream);
        LogEntry.Request.CreateOutStream(OutStream);
        CopyStream(OutStream, RequestStream);
        LogEntry.Modify();
    end;
}
