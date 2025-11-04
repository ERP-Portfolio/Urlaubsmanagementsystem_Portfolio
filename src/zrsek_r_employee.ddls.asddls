@AccessControl.authorizationCheck: #NOT_REQUIRED @EndUserText.label: 'Base View Mitarbeiter'
define root view entity ZRSEK_R_Employee
  as select from zrsek_employee_a
  composition [0..*] of ZRSEK_R_VacReq as _Requests
  composition [0..*] of ZRSEK_R_VacEnt as _Entitlements
{
  /* Schlüssel */ key id_uuid                            as EmployeeUuid,
                      /* Stammdaten */ mitarbeiternummer as EmployeeNo,
                      vorname                            as FirstName,
                      nachname                           as LastName,
                      eintrittsdatum                     as EntryDate,
                      created_by                         as CreatedBy,
                      created_at                         as CreatedAt,
                      last_changed_by                    as LastChangedBy,
                      last_changed_at                    as LastChangedAt,
                      /* Associations */ _Requests,
                      _Entitlements
}
