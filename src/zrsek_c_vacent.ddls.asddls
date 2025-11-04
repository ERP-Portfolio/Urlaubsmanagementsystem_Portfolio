@EndUserText.label: 'Urlaubsanspruch'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZRSEK_C_VacEnt
  as projection on ZRSEK_R_VacEnt
{
  key EntitlementUuid,
      EmployeeUuid,
      Jahr,
      DaysTotal,
      DaysCarryOver,

  /* Admin */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

  /* Redirect zum Parent */
      _Employee : redirected to parent ZRSEK_C_Employee
}
