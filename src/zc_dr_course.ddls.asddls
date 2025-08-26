@EndUserText.label: 'Projection View for ZI_DR_COURSE'
 @AccessControl.authorizationCheck: #NOT_REQUIRED
 @Search.searchable: true
 @Metadata.allowExtensions: true
 
define root view entity ZC_DR_COURSE as projection on ZI_DR_COURSE as Course
{
    key CourseUUID,
    @Search.defaultSearchElement: true
    CourseID,
    Title,
    Description,
    StartDate,
    EndDate,
    Status,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChanged,
    /* Associations */
    _Content : redirected to composition child ZC_DR_CONTENT,
    _Enrollment : redirected to composition child ZC_DR_ENROLLMENT
}
