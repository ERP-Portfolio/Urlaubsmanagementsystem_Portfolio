@EndUserText.label: 'Employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZRSEK_C_Employee
 provider contract transactional_query
  as projection on ZRSEK_R_Employee
{
  key EmployeeUuid,
      EmployeeNo,

  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.7
  FirstName,

  @Search.fuzzinessThreshold: 0.7
  LastName,

  EntryDate,

  /* Admin */
  CreatedBy, CreatedAt, LastChangedBy, LastChangedAt,

  /* Redirects */
  _Requests     : redirected to composition child ZRSEK_C_VacReq,
  _Entitlements : redirected to composition child ZRSEK_C_VacEnt
}

