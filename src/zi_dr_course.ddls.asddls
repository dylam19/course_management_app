 @AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Entity for ZDR_COURSE'

define root view entity ZI_DR_COURSE as select from zdr_course as Course
composition[0..*] of ZI_DR_CONTENT as _Content
composition[0..*] of ZI_DR_ENROLLMENT as _Enrollment
{
    key courseuuid as CourseUUID,
    courseid as CourseID,
    title as Title,
    description as Description,
    startdate as StartDate,
    enddate as EndDate,
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
    _Content,
    _Enrollment
}
