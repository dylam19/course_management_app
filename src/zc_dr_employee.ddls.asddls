@EndUserText.label: 'Projection View for ZI_DR_EMPLOYEE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_DR_EMPLOYEE
  as select from ZI_DR_EMPLOYEE as Employee
{
  key EmployeeUUID,
      @Search.defaultSearchElement: true
      EmployeeID,
      Name,
      Surname,
      Email,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChanged,
      /* Associations */
      _Enrollment
}
