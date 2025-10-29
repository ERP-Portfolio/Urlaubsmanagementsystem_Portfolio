@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base View Mitarbeiter'
define root view entity ZRSEK_R_Employee
  as select from zrsek_employee_a
{
  /* Schlüssel */
  key id_uuid           as EmployeeUuid,

  /* Stammdaten */
      mitarbeiternummer as EmployeeNo,
      vorname           as FirstName,
      nachname          as LastName,
      eintrittsdatum    as EntryDate,
    /*  concat_with_space(vorname, nachname, 1) as FullName,  // für Anzeige/Suche */

  /* Administrative Daten */
      created_by        as CreatedBy,
      created_at        as CreatedAt,
      last_changed_by   as LastChangedBy,
      last_changed_at   as LastChangedAt
}
