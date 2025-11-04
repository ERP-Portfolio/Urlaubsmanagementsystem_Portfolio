CLASS zrsek_cl_employee_generator DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zrsek_cl_employee_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " --- Datentypen -----------------------------------------------------
    DATA ls_employee TYPE zrsek_employee_a.
    DATA lt_employee TYPE TABLE OF zrsek_employee_a.

    DATA ls_vacreq  TYPE zrsek_vacreq_a.
    DATA lt_vacreq  TYPE TABLE OF zrsek_vacreq_a.

    DATA ls_vacent TYPE zrsek_vacent_a.
    DATA lt_vacent TYPE TABLE OF zrsek_vacent_a.


    " UUIDs der neu angelegten Mitarbeiter merken (für Requests)
    DATA uuid_raphael TYPE sysuuid_x16.
    DATA uuid_simon   TYPE sysuuid_x16.
    DATA uuid_eren    TYPE sysuuid_x16.
    DATA uuid_kjell   TYPE sysuuid_x16.

    " --- Bestehende Daten löschen (erst Kind, dann Parent!) -------------
    DELETE FROM zrsek_vacreq_a.
    out->write( |Deleted Vacation Requests: { sy-dbcnt }| ).

    DELETE FROM zrsek_employee_a.
    out->write( |Deleted Employees: { sy-dbcnt }| ).

    DELETE FROM zrsek_vacent_a.
    out->write( |Deleted Vacation Entitlements: { sy-dbcnt }| ).


    " --- Mitarbeiter anlegen -------------------------------------------
    " 1) Raphael
    CLEAR ls_employee.
    ls_employee-mandant           = sy-mandt.
    uuid_raphael                  = cl_system_uuid=>create_uuid_x16_static( ).
    ls_employee-id_uuid           = uuid_raphael.
    ls_employee-mitarbeiternummer = 1.
    ls_employee-vorname          = 'Raphael'.
    ls_employee-nachname          = 'Falk'.
    ls_employee-eintrittsdatum    = '19990701'.
    ls_employee-created_by        = 'GENERATOR'.
    GET TIME STAMP FIELD ls_employee-created_at.
    ls_employee-last_changed_by   = 'GENERATOR'.
    GET TIME STAMP FIELD ls_employee-last_changed_at.
    APPEND ls_employee TO lt_employee.

    " 2) Simon
    CLEAR ls_employee.
    ls_employee-mandant           = sy-mandt.
    uuid_simon                    = cl_system_uuid=>create_uuid_x16_static( ).
    ls_employee-id_uuid           = uuid_simon.
    ls_employee-mitarbeiternummer = 2.
    ls_employee-vorname           = 'Simon'.
    ls_employee-nachname          = 'Gerthofer'.
    ls_employee-eintrittsdatum    = '20240101'.
    ls_employee-created_by        = 'GENERATOR'.
    GET TIME STAMP FIELD ls_employee-created_at.
    ls_employee-last_changed_by   = 'GENERATOR'.
    GET TIME STAMP FIELD ls_employee-last_changed_at.
    APPEND ls_employee TO lt_employee.

    " 3) Eren
    CLEAR ls_employee.
    ls_employee-mandant           = sy-mandt.
    uuid_eren                     = cl_system_uuid=>create_uuid_x16_static( ).
    ls_employee-id_uuid           = uuid_eren.
    ls_employee-mitarbeiternummer = 3.
    ls_employee-vorname           = 'Eren'.
    ls_employee-nachname          = 'Budak'.
    ls_employee-eintrittsdatum    = '20140901'.
    ls_employee-created_by        = 'GENERATOR'.
    GET TIME STAMP FIELD ls_employee-created_at.
    ls_employee-last_changed_by   = 'GENERATOR'.
    GET TIME STAMP FIELD ls_employee-last_changed_at.
    APPEND ls_employee TO lt_employee.

    " 4) Kjell
    CLEAR ls_employee.
    ls_employee-mandant           = sy-mandt.
    uuid_kjell                    = cl_system_uuid=>create_uuid_x16_static( ).
    ls_employee-id_uuid           = uuid_kjell.
    ls_employee-mitarbeiternummer = 4.
    ls_employee-vorname           = 'Kjell'.
    ls_employee-nachname          = 'Fiebinger'.
    ls_employee-eintrittsdatum    = '20181101'.
    ls_employee-created_by        = 'GENERATOR'.
    GET TIME STAMP FIELD ls_employee-created_at.
    ls_employee-last_changed_by   = 'GENERATOR'.
    GET TIME STAMP FIELD ls_employee-last_changed_at.
    APPEND ls_employee TO lt_employee.

    " Insert Employees
    INSERT zrsek_employee_a FROM TABLE @lt_employee.
    out->write( |Inserted Employees: { sy-dbcnt }| ).

    " --- Urlaubsanträge anlegen (Kind) ---------------------------------
    " Annahme: zrsek_vacreq_a hat Felder
    " mandant, request_uuid, employee_uuid, request_id (NUMC),
    " approver_id (NUMC), start_date, end_date, days_requested (INT),
    " status (B/G/A), comment (CHAR), created_*, last_changed_*

    " 1) Raphael: Beantragt
    CLEAR ls_vacreq.
    ls_vacreq-mandant        = sy-mandt.
    ls_vacreq-request_uuid   = cl_system_uuid=>create_uuid_x16_static( ).
    ls_vacreq-employee_uuid  = uuid_raphael.
    ls_vacreq-request_id     = '00000001'.
    ls_vacreq-approver_id    = '00000002'.     " Simon als Genehmigender
    ls_vacreq-start_date     = '20250115'.
    ls_vacreq-end_date       = '20250120'.
    ls_vacreq-days_requested = 4.
    ls_vacreq-status         = 'B'.
    ls_vacreq-comments        = 'Skiurlaub'.
    ls_vacreq-created_by     = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacreq-created_at.
    ls_vacreq-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacreq-last_changed_at.
    APPEND ls_vacreq TO lt_vacreq.

    " 2) Raphael: Genehmigt
    CLEAR ls_vacreq.
    ls_vacreq-mandant        = sy-mandt.
    ls_vacreq-request_uuid   = cl_system_uuid=>create_uuid_x16_static( ).
    ls_vacreq-employee_uuid  = uuid_raphael.
    ls_vacreq-request_id     = '00000002'.
    ls_vacreq-approver_id    = '00000002'.
    ls_vacreq-start_date     = '20240603'.
    ls_vacreq-end_date       = '20240607'.
    ls_vacreq-days_requested = 5.
    ls_vacreq-status         = 'G'.
    ls_vacreq-comments        = 'Sommerferien'.
    ls_vacreq-created_by     = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacreq-created_at.
    ls_vacreq-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacreq-last_changed_at.
    APPEND ls_vacreq TO lt_vacreq.

    " 3) Simon: Abgelehnt
    CLEAR ls_vacreq.
    ls_vacreq-mandant        = sy-mandt.
    ls_vacreq-request_uuid   = cl_system_uuid=>create_uuid_x16_static( ).
    ls_vacreq-employee_uuid  = uuid_simon.
    ls_vacreq-request_id     = '00000003'.
    ls_vacreq-approver_id    = '00000004'.     " Kjell genehmigt/prüft
    ls_vacreq-start_date     = '20250310'.
    ls_vacreq-end_date       = '20250314'.
    ls_vacreq-days_requested = 5.
    ls_vacreq-status         = 'A'.
    ls_vacreq-comments        = 'Städtetrip'.
    ls_vacreq-created_by     = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacreq-created_at.
    ls_vacreq-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacreq-last_changed_at.
    APPEND ls_vacreq TO lt_vacreq.

    " 4) Eren: Beantragt (Fehlerfall für Validierung A1.13)
    CLEAR ls_vacreq.
    ls_vacreq-mandant        = sy-mandt.
    ls_vacreq-request_uuid   = cl_system_uuid=>create_uuid_x16_static( ).
    ls_vacreq-employee_uuid  = uuid_eren.
    ls_vacreq-request_id     = '00000004'.
    ls_vacreq-approver_id    = '00000001'.     " Raphael genehmigt/prüft
    ls_vacreq-start_date     = '20250210'.
    ls_vacreq-end_date       = '20250207'.     " absichtlich < Start (A1.13)
    ls_vacreq-days_requested = 0.
    ls_vacreq-status         = 'B'.
    ls_vacreq-comments        = 'Test falsche Daten'.
    ls_vacreq-created_by     = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacreq-created_at.
    ls_vacreq-last_changed_by = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacreq-last_changed_at.
    APPEND ls_vacreq TO lt_vacreq.

    " Insert Vacation Requests
    INSERT zrsek_vacreq_a FROM TABLE @lt_vacreq.
    out->write( |Inserted Vacation Requests: { sy-dbcnt }| ).



    " --- Urlaubsansprüche anlegen ----------------------------------------
    " Beispielwerte: Jahr = 2025, Gesamt = 30, Übertrag = 2

    CLEAR ls_vacent.
    ls_vacent-mandant          = sy-mandt.
    ls_vacent-entitlement_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    ls_vacent-employee_uuid    = uuid_raphael.
    ls_vacent-jahr             = '2025'.
    ls_vacent-days_total       = 30.
    ls_vacent-days_carryover   = 2.
    ls_vacent-created_by       = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacent-created_at.
    ls_vacent-last_changed_by  = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacent-last_changed_at.
    APPEND ls_vacent TO lt_vacent.

    CLEAR ls_vacent.
    ls_vacent-mandant          = sy-mandt.
    ls_vacent-entitlement_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    ls_vacent-employee_uuid    = uuid_simon.
    ls_vacent-jahr             = '2025'.
    ls_vacent-days_total       = 28.
    ls_vacent-days_carryover   = 0.
    ls_vacent-created_by       = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacent-created_at.
    ls_vacent-last_changed_by  = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacent-last_changed_at.
    APPEND ls_vacent TO lt_vacent.

    CLEAR ls_vacent.
    ls_vacent-mandant          = sy-mandt.
    ls_vacent-entitlement_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    ls_vacent-employee_uuid    = uuid_eren.
    ls_vacent-jahr             = '2025'.
    ls_vacent-days_total       = 30.
    ls_vacent-days_carryover   = 1.
    ls_vacent-created_by       = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacent-created_at.
    ls_vacent-last_changed_by  = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacent-last_changed_at.
    APPEND ls_vacent TO lt_vacent.

    CLEAR ls_vacent.
    ls_vacent-mandant          = sy-mandt.
    ls_vacent-entitlement_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    ls_vacent-employee_uuid    = uuid_kjell.
    ls_vacent-jahr             = '2025'.
    ls_vacent-days_total       = 26.
    ls_vacent-days_carryover   = 3.
    ls_vacent-created_by       = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacent-created_at.
    ls_vacent-last_changed_by  = 'GENERATOR'.
    GET TIME STAMP FIELD ls_vacent-last_changed_at.
    APPEND ls_vacent TO lt_vacent.

    " Insert Entitlements
    INSERT zrsek_vacent_a FROM TABLE @lt_vacent.
    out->write( |Inserted Vacation Entitlements: { sy-dbcnt }| ).

  ENDMETHOD.
ENDCLASS.
