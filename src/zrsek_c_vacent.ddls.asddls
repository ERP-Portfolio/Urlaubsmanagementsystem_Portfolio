@EndUserText.label: 'Urlaubsanspruch'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZRSEK_C_VacEnt
  as projection on ZRSEK_R_VacEnt
{
  key EntitlementUuid,
      EmployeeUuid,
      Jahr, DaysTotal, DaysCarryOver,
      CreatedBy, CreatedAt, LastChangedBy, LastChangedAt,

  _Employee : redirected to parent ZRSEK_C_Employee
}
