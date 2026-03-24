# Dynamics365BC-API-Consumption
Code examples and tutorials for consuming APIs in MS D365 BC

Program begins with API Handler page in the core module. The page consists of three groups.
- Basic-auth customer API, No-auth employee API, No-auth product Hdr + lines API 
Each group has three reference fields - Website, Url and Output
Each group contains action types for Get, Post, Put, Patch, Delete

Each action type has a Get procedure and an execute procedure
- The get procedure returns a url to the url field
- The execute procedure performs an action

Get - Reads record from api table
Post - creates record in api table
Put - updates all fields for record in api table
Patch - update specific fields for record in api table
Delete - removes record in api table

----------
# Api Core
----------
# Interface Log Entry table
IP DownloadRequest called from Interface Log Entries page
IP DownloadResponse Called from Interface Log Entries page
IP AddNewLogEntry Called from Rest Mgmt codeunit

# API Interface card page 
Page Area
    Group Customer References - Website, Execute Url, Username, Password, Output
    Group Customer Actions - GetUrlLbl, GetLbl, same for Post, Put, Patch and Delete

    Group Employee References - Website, Execute Url, Output
    Group Employee Actions - GetUrl, GetLbl, same for Post, Put, Patch and Delete

    Group Product References - Website, Execute Url, Output
    Group Product Actions - GetUrl, GetLbl, same for Post, Put, Patch and Delete

    LP SetUsernameandPassword

Page Actions - Log Entries, Customer records, Employee records, Product records 

# API Log Entries list page
Action - Download Request 
Action - Download Response
Action - Delete All

# Rest API Management codeunit
IP MakeContentRequest called from EmloyeeIntegration and ProductIntegration
IP MakeRequest called from CustomerIntegration
LP LogTransaction called from MakeContentRequest and MakeRequest

---------------------
# Basic Auth Customer
---------------------
# Customer table
GP - Delete All Imported
# Customer card page
Action - Delete Imported
# Customer list page

# Customer Integration codeunit 
IP - GetRecord, PostRecord, PutRecord, PatchRecord, DeleteRecord called from API Interface page

IP GetRecord
------------
CheckUrlandReset
ResponseMessage - RestMgmt.MakeContentRequest, GetContentWithHeader, EmployeePayload.GetEmployeePayload, 
EmployeeResponse.PostResponse

LP CheckUrlAndReset
LP GetContentwithHeader
LP GetHttpRequestMessage calls GetAuthorizationHeader
LP GetAuthroizationHeader

# Customer Payload codeunit
IP Get Employee Payload
IP Post Employee Payload
IP Put Employee Payload
IP Patch Employee Payload
IP Delete Employee Payload

# Customer Response codeunit
IP Get Response
IP Post Response
IP Put Response
IP Patch Response
IP Delete Response

LP ReviewResponseStatusCode
LP WriteRecordinDatabase
LP ReadTheObject
LP ReadTheArray
LP WriteHeaderInDatabase

------------------
# No-Auth Employee
------------------
# Employee table
GP - Delete All Imported
# Employee card page 
Action - Delete Imported
# Employee List page

# Employee Integration codeunit 
IP - GetRecord, PostRecord, PutRecord, PatchRecord, DeleteRecord called from API Interface page

IP GetRecord
------------
CheckUrlandReset
ResponseMessage - RestMgmt.MakeContentRequest, GetContentWithHeader, EmployeePayload.GetEmployeePayload, 
EmployeeResponse.PostResponse

LP CheckUrlAndReset
LP GetContentwithHeader

# Employee Payload codeunit 
IP Get Employee Payload
IP Post Employee Payload
IP Put Employee Payload
IP Patch Employee Payload
IP Delete Employee Payload

# Employee Response codeunit
IP Get Response
IP Post Response
IP Put Response
IP Patch Response
IP Delete Response

LP ReviewResponseStatusCode
LP ParseEmployeeResponse
LP WriteRecordsinDatabase

-----------------
# No Auth Product
-----------------
# Product table
GP - Delete All Imported
# Products page
Action - Delete All Imported
# Product document page
# Product subform page

# Product Integration codeunit
IP - GetRecord, PostRecord, PutRecord, PatchRecord, DeleteRecord called from API Interface page

IP GetRecord
------------
CheckUrlandReset
ResponseMessage - RestMgmt.MakeContentRequest, GetContentWithHeader, EmployeePayload.GetEmployeePayload, 
EmployeeResponse.PostResponse

LP CheckUrlAndReset
LP GetContentwithHeader

# Product Payload codeunit 
IP Get Product Payload
IP Post Product Payload
IP Put Product Payload
IP Patch Product Payload
IP Delete Product Payload

# Product Response codeunit
IP Get Response
IP Post Response
IP Put Response
IP Patch Response
IP Delete Response

LP WriteRecordinDatabase
LP ReadTheObject
LP ReadTheArray
LP WriteHeaderInDatabase
LP WriteLineinDatabase