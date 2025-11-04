@EndUserText.label: 'Mitarbeiter'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZRSEK_C_Employee
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

  /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
       /* Associations */
      _Requests : redirected to composition child ZRSEK_C_VacReq,
      _Entitlements : redirected to composition child ZRSEK_C_VacEnt
     
}
