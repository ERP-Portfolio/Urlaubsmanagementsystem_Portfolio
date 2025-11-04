@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee'
define root view entity ZRSEK_R_Employee
  as select from zrsek_employee_a
  composition [0..*] of ZRSEK_R_VacReq as _Requests
  composition [0..*] of ZRSEK_R_VacEnt as _Entitlements
{
  key id_uuid           as EmployeeUuid,
      mitarbeiternummer as EmployeeNo,
      vorname           as FirstName,
      nachname          as LastName,
      eintrittsdatum    as EntryDate,

      created_by        as CreatedBy,
      created_at        as CreatedAt,
      last_changed_by   as LastChangedBy,
      last_changed_at   as LastChangedAt,

      _Requests,
      _Entitlements
}

