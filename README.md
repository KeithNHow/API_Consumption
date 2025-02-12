# Dynamics365BC-API-Consumption
Code examples and tutorials for consuming APIs in MS D365 BC
Program begins with API Handler page in the core module. The page consists of three groups.
- Basic-auth customer API
- No-auth employee API
- No-auth product Hdr + lines API 
Each group has three ref fields - Website, Url and Output
Each group contains 5 actions - Get, Post, Put, Patch, Delete
Get - returns response Url into Url field 
Post - creates record in api table
Put - updates all fields for record in api table
Patch - update specific fields for record in api table
Delete - removes record in api table

Customer table - 6 fields "No.", Name, Addr, Addr2, "Phone No.", System Id
Employee table - 4 fields Id, Name, Salary, Age
Product Header table - 3 fields - Id, Name, "Not Reserved"
Product Line table - 4 fields - Id, "Line No.", Parameter, Value

Log Entries table - 9 fields "Entry No.", Url, Method, Request, Response, "Response Code", Successful, "Requested By", "Logged On"
Procs - Download Request, Download Response, Add New Entry

# Basic Auth
------------
# Codeunits 
CustomerAPIIntegration
CustomerAPIPayload
CustomerAPIResponse
# Pages
Customer - Card
Customers - List
# Tables
Customer

# Core
------
# RestAPIMgmt CU
MakeReq, LogApiTrans (AddNewLogEntry)
# APIHandler Page 
Drilldown Actions 
# APILogEntries Page
Rec DownloadReq, DownloadResp
# APILogEntry Table
DownloadReq (DownloadFrStr), DownloadResp (DownloadFrStr), AddNewLogEntry (HandleStreams), HandleStreams

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