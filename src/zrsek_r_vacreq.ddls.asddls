@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Urlaubsantrag'
define view entity ZRSEK_R_VacReq
  as select from zrsek_vacreq_a
  association to parent ZRSEK_R_Employee as _Employee on $projection.EmployeeUuid = _Employee.EmployeeUuid
{
  key request_uuid    as RequestUuid,
      /* Felder */
      employee_uuid   as EmployeeUuid,
      request_id      as RequestId,
      approver_id     as ApproverId,
      start_date      as StartDate,
      end_date        as EndDate,
      days_requested  as DaysRequested,
      status          as Status,
      comments        as Comments,

      /* Administrative Daten */
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,

      /* Assoziation zum Parent */
      _Employee
}
