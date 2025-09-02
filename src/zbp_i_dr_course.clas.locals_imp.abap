CLASS lhc_Course DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Course RESULT result.
    METHODS determineCourseID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Course~determineCourseID.
    METHODS validateMandatoryFields FOR VALIDATE ON SAVE
      IMPORTING keys FOR Course~validateMandatoryFields.

ENDCLASS.

CLASS lhc_Course IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD determineCourseID.

    READ ENTITIES OF zi_dr_course IN LOCAL MODE
      ENTITY Course
        FIELDS ( CourseUUID CourseID ) WITH CORRESPONDING #( keys )
      RESULT DATA(courses).

    DELETE courses WHERE CourseID NE '00000000'.

    IF courses IS NOT INITIAL.
      " Obtener el máximo CourseID existente de la tabla real
      SELECT MAX( courseid )
      FROM zdr_course
      INTO @DATA(max_id_string).

      SELECT MAX( courseid )
        FROM zdr_course_d
        INTO @DATA(max_draft_id).


      " Comparar y tomar el mayor entre real y draft
      DATA(max_num) = COND i(
        WHEN max_id_string > max_draft_id THEN CONV i( max_id_string )
        ELSE CONV i( max_draft_id )
      ).

      LOOP AT courses ASSIGNING FIELD-SYMBOL(<course>).

        max_num += 1.

        " Formatear el nuevo número a 8 dígitos con ceros a la izquierda
        DATA(next_id) = |{ max_num }|.

        " Asignar el nuevo CourseID
        <course>-CourseID = next_id.

      ENDLOOP.

      " Devuelvo los cambios
      MODIFY ENTITIES OF zi_dr_course IN LOCAL MODE
        ENTITY Course
          UPDATE FIELDS ( CourseID )
          WITH CORRESPONDING #( courses ).
    ENDIF.

  ENDMETHOD.

  METHOD validateMandatoryFields.
    " Leer los registros a validar
    READ ENTITIES OF zi_dr_course IN LOCAL MODE
      ENTITY Course
        FIELDS ( Title StartDate EndDate )
        WITH CORRESPONDING #( keys )
      RESULT DATA(courses).

    LOOP AT courses ASSIGNING FIELD-SYMBOL(<course>).
      IF <course>-Title IS INITIAL OR <course>-StartDate IS INITIAL OR <course>-EndDate IS INITIAL.
        APPEND VALUE #(
          %key = <course>-%key
          %msg = new_message(
            id       = 'ZMSG_COURSE'
            number   = '001'
            severity = if_abap_behv_message=>severity-error
            v1       = 'Title'
          )
          %element-Title = if_abap_behv=>mk-on
        ) TO reported-course.

        APPEND VALUE #( %key = <course>-%key ) TO failed-course.
      ENDIF.
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

CLASS lhc_Content DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Content RESULT result.
    METHODS determineContentID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Content~determineContentID.

ENDCLASS.

CLASS lhc_Content IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD determineContentID.

    READ ENTITIES OF zi_dr_course IN LOCAL MODE
      ENTITY Content
        FIELDS ( ContentUUID ContentID ) WITH CORRESPONDING #( keys )
      RESULT DATA(contents).

    DELETE contents WHERE ContentID NE '00000000'.

    IF contents IS NOT INITIAL.
      " Traigo el max ID de la tabla física
      SELECT MAX( contentid )
        FROM zdr_content
        INTO @DATA(max_id_string).

      SELECT MAX( contentid )
        FROM zdr_content_d
        INTO @DATA(max_draft_id).

      DATA(max_num) = COND i(
        WHEN max_id_string > max_draft_id THEN CONV i( max_id_string )
        ELSE CONV i( max_draft_id )
      ).

      LOOP AT contents ASSIGNING FIELD-SYMBOL(<content>).

        max_num += 1.

        " Formatear el nuevo número a 8 dígitos con ceros a la izquierda
        DATA(next_id) = |{ max_num }|.

        " Asignar el nuevo CourseID
        <content>-ContentID = next_id.

      ENDLOOP.


      MODIFY ENTITIES OF zi_dr_course IN LOCAL MODE
        ENTITY Content
          UPDATE FIELDS ( ContentID )
          WITH CORRESPONDING #( contents ).

    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Enrollment DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Enrollment RESULT result.
    METHODS determineEnrollmentID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Enrollment~determineEnrollmentID.

ENDCLASS.

CLASS lhc_Enrollment IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD determineEnrollmentID.

    READ ENTITIES OF zi_dr_course IN LOCAL MODE
    ENTITY Enrollment
      FIELDS ( EnrollmentUUID EnrollmentID ) WITH CORRESPONDING #( keys )
    RESULT DATA(enrollments).

    DELETE enrollments WHERE EnrollmentID NE '00000000'.

    IF enrollments IS NOT INITIAL.
      " Traigo el max ID de la tabla física
      SELECT MAX( enrollmentid )
        FROM zdr_enrollment
        INTO @DATA(max_id_string).

      SELECT MAX( enrollmentid )
        FROM zdr_enrollment_d
        INTO @DATA(max_draft_id).

      DATA(max_num) = COND i(
        WHEN max_id_string > max_draft_id THEN CONV i( max_id_string )
        ELSE CONV i( max_draft_id )
      ).

      LOOP AT enrollments ASSIGNING FIELD-SYMBOL(<enrollment>).

        max_num += 1.

        " Formatear el nuevo número a 8 dígitos con ceros a la izquierda
        DATA(next_id) = |{ max_num }|.

        " Asignar el nuevo CourseID
        <enrollment>-EnrollmentID = next_id.

      ENDLOOP.


      MODIFY ENTITIES OF zi_dr_course IN LOCAL MODE
        ENTITY Enrollment
          UPDATE FIELDS ( EnrollmentID )
          WITH CORRESPONDING #( enrollments ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.
