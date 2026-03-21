namespace APIConsumption;
using KNHAPIConsumption;

permissionset 53700 KNHAPIConsumption
{
    Assignable = true;
    Caption = 'API Permissions', MaxLength = 30;
    Permissions = table "KNH Employee" = X,
        tabledata "KNH Employee" = RMID,
        page "KNH Employee List" = X,
        page "KNH Employee Card" = X,
        codeunit "KNH Employee Response" = X,
        tabledata "KNH Interface Log Entry" = RIMD,
        tabledata "KNH Product Header" = RIMD,
        tabledata "KNH Product Lines" = RIMD,
        table "KNH Interface Log Entry" = X,
        table "KNH Product Header" = X,
        table "KNH Product Lines" = X,
        codeunit "KNH Employee Payload" = X,
        codeunit "KNH Employee Integration" = X,
        codeunit "KNH Product Response" = X,
        codeunit "KNH Product Payload" = X,
        codeunit "KNH Product Integration" = X,
        codeunit "KNH Rest Api Mgmt." = X,
        page "KNH API Interface" = X,
        page "KNH Interface Log Entries" = X,
        page "KNH Products" = X,
        page "KNH Product Subform" = X,
        tabledata "KNH Customer" = RIMD,
        table "KNH Customer" = X,
        codeunit "KNH Customer Integration" = X,
        codeunit "KNH Customer Payload" = X,
        codeunit "KNH Customer Response" = X,
        page "KNH Customer Card" = X,
        page "KNH Customer List" = X;
}