@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Entity for ZDR_EMPLOYEE'

define view entity ZI_DR_EMPLOYEE as select from zdr_employee as Employee
    association [0..*] to ZI_DR_ENROLLMENT as _Enrollment
        on $projection.EmployeeUUID = _Enrollment.EmployeeUUID
{
    key employeeuuid as EmployeeUUID,
    @Search.defaultSearchElement: true
    employeid as EmployeeID,
    name as Name,
    surname as Surname,
    email as Email,
    
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
    _Enrollment
}
