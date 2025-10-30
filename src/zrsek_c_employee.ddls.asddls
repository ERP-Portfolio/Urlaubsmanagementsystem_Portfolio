@EndUserText.label: 'Employee'
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
      LastChangedAt
}
