@EndUserText.label: 'Projection View for ZI_DR_CONTENT'
 @AccessControl.authorizationCheck: #NOT_REQUIRED
 @Search.searchable: true
 @Metadata.allowExtensions: true
 
define view entity ZC_DR_CONTENT as projection on ZI_DR_CONTENT as Content
{
    key ContentUUID,
    CourseUUID,
    @Search.defaultSearchElement: true
    
    ContentID,
    Title,
    Description,
    ContentURL,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChanged,
    /* Associations */
    _Course : redirected to parent ZC_DR_COURSE
}
