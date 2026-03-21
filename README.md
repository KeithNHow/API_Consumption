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

GetPostPutPatchDelete Record
----------------------------
CheckMandatoryAndReset
Get,Post,Put,Patch,Delete Payload (MakeContentRequest(PostPayload,GetContent,MakeContent))
GetResponse(ReviewResponse)

Customer table - 6 fields "No.", Name, Addr, Addr2, "Phone No.", System Id
Employee table - 4 fields Id, Name, Salary, Age
Product Header table - 3 fields - Id, Name, "Not Reserved"
Product Line table - 4 fields - Id, "Line No.", Parameter, Value

Log Entries table - 9 fields "Entry No.", Url, Method, Request, Response, "Resp Code", Successful, "Requested By", "Logged On"
Procedures - Download Request, Download Response, Add New Entry

# Core
------
# Rest API Management codeunit
MakeContentRequest, MakeRequest, LogApiTransaction
# Interface Handler card page 
Drilldown Actions 
# Interface Log Entries page
Rec DownloadReq, DownloadResp
# Interface Log Entries table
DownloadRequest Procedure - called from
DownloadResponse Procedure - called from
AddNewLogEntry Procedure - called from

# Basic Auth
------------
# Codeunits 
CustomerAPIIntegration, CustomerAPIPayload, CustomerAPIResponse
# Pages
CustomerCard, CustomerList
# Tables
Customer



# Dummy - Rest API
------------------
# EmployeeAPIIntegration CU 
Proc GetRec, PodtRec, PutRec, PatchRec, DeleteRec --> CheckReset, MakeReq, GetContent, GenProc, HandleProc
Proc CheckReset, GetContent
# EmployeeAPIPayload CU
Proc GenGetPayload, GenPostPayload, GenPutPayload, GenPatchPayload, GenDeletePayload --> WriteToFile
# EmployeeAPIResponse CU
Proc HandleGetResp, HandlePostResp, HandlePutResp, HandlePatchResp, HandleDeleteResp --> ReviewRespCode, ParseEmpResp
Proc ReviewRespCode, ParseEmpResp
# Employees Page 
Rec DeleteAllImported
# Employee Table
A DeleteAllImported

# Restful API
-------------
# ProductAPIIntegration CU
Proc GetRec, PodtRec, PutRec, PatchRec, DeleteRec --> CheckReset, MakeReq, GetContent, GenProc, HandleProc
Proc CheckReset, GetContent
# ProductAPIPayload CU
Proc GenGetPayload, GenPostPayload, GenPutPayload, GenPatchPayload, GenDeletePayload --> WriteToFile
# ProductAPIResponse CU
Proc HandleGetResp, HandlePostResp, HandlePutResp, HandlePatchResp, HandleDeleteResp --> ReviewRespCode, ParseEmpResp
Proc ReviewRespCode, ParseEmpResp
# Product Header Page
# Product Lines Page
Rec DeleteAllImported
# Product Table
A DeleteAllImported

# APIPermissions PermSet