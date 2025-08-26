@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Entity for ZDR_CONTENT'

define view entity ZI_DR_CONTENT as select from zdr_content as Content

 association to parent ZI_DR_COURSE as _Course on $projection.CourseUUID = _Course.CourseUUID
 
{
    key contentuuid as ContentUUID,
    courseuuid as CourseUUID,
    contentid as ContentID,
    title as Title,
    description as Description,
    contenturl as ContentURL,
    
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
    _Course
}
