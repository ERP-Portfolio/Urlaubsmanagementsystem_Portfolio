@EndUserText.label: 'Urlaubsantrag'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZRSEK_C_VacReq
  as projection on ZRSEK_R_VacReq
{
  key RequestUuid,
      EmployeeUuid,
      RequestId,
      ApproverId,
      StartDate,
      EndDate,
      DaysRequested,
      Status,
      Comments,

  /* Admin */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

  /* Associations */
      _Employee : redirected to parent ZRSEK_C_Employee
}
