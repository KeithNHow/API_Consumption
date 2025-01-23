# Dynamics365BC-API-Consumption
Code examples and tutorials for consuming APIs in Microsoft Dynamics 365 Business Central.

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