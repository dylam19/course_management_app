@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Entity for ZDR_ENROLLMENT'

define view entity ZI_DR_ENROLLMENT as select from zdr_enrollment as Enrollment
 association to parent ZI_DR_COURSE as _Course on $projection.CourseUUID = _Course.CourseUUID
association [1..1] to ZI_DR_EMPLOYEE as _Employee on $projection.EmployeeUUID = _Employee.EmployeeUUID
{
    key enrollmentuuid as EnrollmentUUID,
    courseuuid as CourseUUID,
    employeeuuid as EmployeeUUID,
    enrollmentid as EnrollmentID,
    enrollmentdate as EnrollmenDdate,
    status as Status,

    @Semantics.user.createdBy: true
    createdby as CreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
    createdat as CreatedAt,
    
    @Semantics.user.lastChangedBy: true
    lastchangedby as LastChangedBy,
    
    @Semantics.systemDateTime.lastChangedAt: true
    lastchangedat as LastChangedAt,
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    locallastchanged as LocalLastChanged,
    
    /* Associations */
    _Course,
    _Employee
}
