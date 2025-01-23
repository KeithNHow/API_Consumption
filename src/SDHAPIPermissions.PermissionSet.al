namespace APIConsumption;

permissionset 50000 "SDH API Permissions"
{
    Assignable = true;
    Caption = 'API Permissions', MaxLength = 30;
    Permissions = table "KNH Employee" = X,
        tabledata "KNH Employee" = RMID,
        page "KNH Employees" = X,
        page "KNH Employee" = X,
        codeunit "KNH Employee API Response" = X,
        tabledata "KNH API Log Entry" = RIMD,
        tabledata "KNH Product Header" = RIMD,
        tabledata "KNH Product Lines" = RIMD,
        table "KNH API Log Entry" = X,
        table "KNH Product Header" = X,
        table "KNH Product Lines" = X,
        codeunit "KNH Employee API Payload" = X,
        codeunit "KNH Employee API Integration" = X,
        codeunit "KNH Product API Response" = X,
        codeunit "KNH Product API Payload" = X,
        codeunit "KNH Product API Integration" = X,
        codeunit "KNH Rest Api Mgmt." = X,
        page "KNH API Handler" = X,
        page "KNH API Log Entries" = X,
        page "KNH Product" = X,
        page "KNH Product Subform" = X,
        page "KNH Products" = X,
        tabledata "KNH Customer" = RIMD,
        table "KNH Customer" = X,
        codeunit "KNH Customer API Integration" = X,
        codeunit "KNH Customer API Payload" = X,
        codeunit "KNH Customer API Response" = X,
        page "KNH Customer" = X,
        page "KNH Customers" = X;
}