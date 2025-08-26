@EndUserText.label: 'Projection View for ZI_DR_ENROLLMENT'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define view entity ZC_DR_ENROLLMENT
  as projection on ZI_DR_ENROLLMENT as Enrollment
{
  key EnrollmentUUID,
      CourseUUID,
      @Consumption.valueHelpDefinition: [ {
        entity: { name: 'ZC_DR_EMPLOYEE', element: 'EmployeeUUID' },
        additionalBinding: [ {
          localElement: 'EmployeeUUID',
          element: 'EmployeeUUID',
          usage: #RESULT
        } ]
      } ]
      EmployeeUUID,
      @Search.defaultSearchElement: true
      EnrollmentID,
      EnrollmenDdate,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChanged,

      _Employee.EmployeeID as EmployeeID,
      _Employee.Name       as EmployeeName,
      _Employee.Surname    as EmployeeSurname,
      _Employee.Email as EmployeeEmail,
      
      /* Associations */
      _Course : redirected to parent ZC_DR_COURSE,
      _Employee
}
