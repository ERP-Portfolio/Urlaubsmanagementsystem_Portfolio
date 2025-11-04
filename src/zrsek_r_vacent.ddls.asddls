@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Urlaubsanspruch'
define view entity ZRSEK_R_VacEnt
  as select from zrsek_vacent_a
  association to parent ZRSEK_R_Employee as _Employee
             on $projection.EmployeeUuid = _Employee.EmployeeUuid
{
  /* Schlüssel + Parent */
  key entitlement_uuid as EntitlementUuid,
      employee_uuid    as EmployeeUuid,

  /* Felder */
      jahr            as Jahr,
      days_total       as DaysTotal,
      days_carryover   as DaysCarryOver,

  /* Admin */
      created_by       as CreatedBy,
      created_at       as CreatedAt,
      last_changed_by  as LastChangedBy,
      last_changed_at  as LastChangedAt,

  /* Parent-Assoc */
      _Employee
}
