-- Table: u_test_change_request

-- DROP TABLE u_test_change_request;

CREATE TABLE u_test_change_request
(
  active boolean,
  activity_due timestamp without time zone,
  additional_assignee_list text,
  approval character varying(40),
  approval_set timestamp without time zone,
  assigned_to character varying(40),
  assignment_group character varying(40),
  backout_plan text,
  business_duration bigint,
  business_service character varying(40),
  cab_date date,
  cab_recommendation text,
  calendar_duration bigint,
  category character varying(40),
  change_plan text,
  close_notes text,
  closed_at timestamp without time zone,
  closed_by character varying(40),
  cmdb_ci character varying(40),
  comments_and_work_notes text,
  company character varying(40),
  conflict_last_run timestamp without time zone,
  conflict_status character varying(40),
  contact_type character varying(40),
  correlation_display character varying(100),
  correlation_id character varying(100),
  delivery_plan character varying(40),
  delivery_task character varying(40),
  description text,
  due_date timestamp without time zone,
  end_date timestamp without time zone,
  escalation bigint,
  expected_start timestamp without time zone,
  follow_up timestamp without time zone,
  group_list text,
  impact bigint,
  implementation_plan text,
  justification text,
  knowledge boolean,
  location character varying(40),
  made_sla boolean,
  "number" character varying(40),
  opened_at timestamp without time zone,
  opened_by character varying(40),
  "order" bigint,
  outside_maintenance_schedule boolean,
  parent character varying(40),
  phase character varying(40),
  phase_state character varying(40),
  priority bigint,
  production_system boolean,
  reason character varying(40),
  reassignment_count bigint,
  requested_by character varying(40),
  requested_by_date timestamp without time zone,
  review_comments text,
  review_date date,
  review_status bigint,
  risk bigint,
  scope bigint,
  short_description character varying(160),
  sla_due timestamp without time zone,
  start_date timestamp without time zone,
  state bigint,
  sys_class_name character varying(80),
  sys_created_by character varying(40),
  sys_created_on timestamp without time zone,
  sys_domain character varying(32),
  sys_domain_path character varying(255),
  sys_id character varying(32) NOT NULL,
  sys_mod_count bigint,
  sys_updated_by character varying(40),
  sys_updated_on timestamp without time zone,
  test_plan text,
  time_worked timestamp without time zone,
  type character varying(40),
  u_activity_type character varying(40),
  u_actual_hours timestamp without time zone,
  u_additional_cis text,
  u_br_approvalattached character varying(40),
  u_br_approvalreceived character varying(40),
  u_business_approval_assigned_t character varying(40),
  u_business_services character varying(40),
  u_caused_incident character varying(40),
  u_change_owner character varying(40),
  u_change_tasks_complete character varying(40),
  u_changes_completed boolean,
  u_ci_not_listed boolean,
  u_ci_selection boolean,
  u_classification character varying(40),
  u_cmdb_subsystem character varying(40),
  u_configuration_items text,
  u_cr character varying(40),
  u_cr_notifications text,
  u_customer_commit_date character varying(40),
  u_customer_notification character varying(40),
  u_customer_notification_choice character varying(40),
  u_customer_notification_info character varying(40),
  u_data_center character varying(40),
  u_data_warehouse character varying(40),
  u_database character varying(40),
  u_description_of_impact character varying(40),
  u_development_needed character varying(40),
  u_dont_send_mail character varying(40),
  u_duration_of_impact character varying(40),
  u_emergency_incident character varying(40),
  u_environment character varying(40),
  u_estimated_hours character varying(40),
  u_evaluation character varying(40),
  u_evaluation_deadline character varying(40),
  u_evaluation_reminder_interval character varying(40),
  u_generate_stat_email character varying(40),
  u_glidelocation character varying(40),
  u_has_attachments character varying(40),
  u_impact character varying(40),
  u_impact_of_delaying_or_postpo character varying(40),
  u_implementation_results character varying(40),
  u_implemented_not_approved character varying(40),
  u_incident_ticket_number text,
  u_infosec character varying(40),
  u_location text,
  u_network boolean,
  u_none boolean,
  u_nooperations boolean,
  u_package_version character varying(40),
  u_parent_change character varying(40),
  u_planned_release_date timestamp without time zone,
  u_planning_calendar character varying(40),
  u_post_production_validation character varying(40),
  u_pre_start_date timestamp without time zone,
  u_product_type character varying(40),
  u_reason character varying(40),
  u_reason_codes character varying(40),
  u_reason_details_explanation text,
  u_relevantoperations boolean,
  u_req_for character varying(40),
  u_request_assigned_to character varying(40),
  u_request_category character varying(40),
  u_request_closure_notes text,
  u_request_detail text,
  u_request_item_name character varying(40),
  u_request_number character varying(40),
  u_request_subcategory character varying(40),
  u_requested_for character varying(40),
  u_requestitem_stage character varying(40),
  u_requirements_completed boolean,
  u_requirements_needed character varying(40),
  u_reschedule_explanation text,
  u_reschedule_reason character varying(40),
  u_revision_number character varying(40),
  u_service character varying(40),
  u_service_customer_impact character varying(40),
  u_sprint_name character varying(40),
  u_stat_description character varying(40),
  u_storage boolean,
  u_sub_category character varying(40),
  u_sub_system text,
  u_subtype character varying(40),
  u_time_required_for_backout timestamp without time zone,
  u_time_required_for_implementa timestamp without time zone,
  u_total_change_time timestamp without time zone,
  u_upon_approval character varying(40),
  u_validation_of_change text,
  u_will_there_be_service_or_cus character varying(40),
  upon_approval character varying(40),
  upon_reject character varying(40),
  urgency bigint,
  user_input text,
  watch_list text,
  work_end timestamp without time zone,
  work_notes_list text,
  work_start timestamp without time zone,
  mirror_created_on timestamp without time zone,
  mirror_updated_on timestamp without time zone,
  CONSTRAINT u_test_change_request_sys_id_key UNIQUE (sys_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE u_test_change_request
  OWNER TO postgres;
