CREATE TABLE `u_test_change_request` (
  `active` tinyint(1) DEFAULT NULL,
  `activity_due` datetime DEFAULT NULL,
  `additional_assignee_list` mediumtext,
  `approval` varchar(40) DEFAULT NULL,
  `approval_set` datetime DEFAULT NULL,
  `assigned_to` varchar(40) DEFAULT NULL,
  `assignment_group` varchar(40) DEFAULT NULL,
  `backout_plan` mediumtext,
  `business_duration` bigint(20) DEFAULT NULL,
  `business_service` varchar(40) DEFAULT NULL,
  `cab_date` date DEFAULT NULL,
  `cab_recommendation` mediumtext,
  `calendar_duration` bigint(20) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `change_plan` mediumtext,
  `close_notes` mediumtext,
  `closed_at` datetime DEFAULT NULL,
  `closed_by` varchar(40) DEFAULT NULL,
  `cmdb_ci` varchar(40) DEFAULT NULL,
  `comments_and_work_notes` mediumtext,
  `company` varchar(40) DEFAULT NULL,
  `conflict_last_run` datetime DEFAULT NULL,
  `conflict_status` varchar(40) DEFAULT NULL,
  `contact_type` varchar(40) DEFAULT NULL,
  `correlation_display` varchar(100) DEFAULT NULL,
  `correlation_id` varchar(100) DEFAULT NULL,
  `delivery_plan` varchar(40) DEFAULT NULL,
  `delivery_task` varchar(40) DEFAULT NULL,
  `description` mediumtext,
  `due_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `escalation` bigint(20) DEFAULT NULL,
  `expected_start` datetime DEFAULT NULL,
  `follow_up` datetime DEFAULT NULL,
  `group_list` mediumtext,
  `impact` bigint(20) DEFAULT NULL,
  `implementation_plan` mediumtext,
  `justification` mediumtext,
  `knowledge` tinyint(1) DEFAULT NULL,
  `location` varchar(40) DEFAULT NULL,
  `made_sla` tinyint(1) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `opened_at` datetime DEFAULT NULL,
  `opened_by` varchar(40) DEFAULT NULL,
  `order1` bigint(20) DEFAULT NULL,
  `outside_maintenance_schedule` tinyint(1) DEFAULT NULL,
  `parent` varchar(40) DEFAULT NULL,
  `phase` varchar(40) DEFAULT NULL,
  `phase_state` varchar(40) DEFAULT NULL,
  `priority` bigint(20) DEFAULT NULL,
  `production_system` tinyint(1) DEFAULT NULL,
  `reason` varchar(40) DEFAULT NULL,
  `reassignment_count` bigint(20) DEFAULT NULL,
  `requested_by` varchar(40) DEFAULT NULL,
  `requested_by_date` datetime DEFAULT NULL,
  `review_comments` mediumtext,
  `review_date` date DEFAULT NULL,
  `review_status` bigint(20) DEFAULT NULL,
  `risk` bigint(20) DEFAULT NULL,
  `scope` bigint(20) DEFAULT NULL,
  `short_description` varchar(160) DEFAULT NULL,
  `sla_due` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `state` bigint(20) DEFAULT NULL,
  `sys_class_name` varchar(80) DEFAULT NULL,
  `sys_created_by` varchar(40) DEFAULT NULL,
  `sys_created_on` datetime DEFAULT NULL,
  `sys_domain` varchar(32) DEFAULT NULL,
  `sys_domain_path` varchar(255) DEFAULT NULL,
  `sys_id` varchar(32) NOT NULL,
  `sys_mod_count` bigint(20) DEFAULT NULL,
  `sys_updated_by` varchar(40) DEFAULT NULL,
  `sys_updated_on` datetime DEFAULT NULL,
  `test_plan` mediumtext,
  `time_worked` bigint(20) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `u_activity_type` varchar(40) DEFAULT NULL,
  `u_actual_hours` datetime DEFAULT NULL,
  `u_additional_cis` mediumtext,
  `u_br_approvalattached` varchar(40) DEFAULT NULL,
  `u_br_approvalreceived` varchar(40) DEFAULT NULL,
  `u_business_approval_assigned_t` varchar(40) DEFAULT NULL,
  `u_business_services` varchar(40) DEFAULT NULL,
  `u_caused_incident` varchar(40) DEFAULT NULL,
  `u_change_owner` varchar(40) DEFAULT NULL,
  `u_change_tasks_complete` varchar(40) DEFAULT NULL,
  `u_changes_completed` tinyint(1) DEFAULT NULL,
  `u_ci_not_listed` tinyint(1) DEFAULT NULL,
  `u_ci_selection` tinyint(1) DEFAULT NULL,
  `u_classification` varchar(40) DEFAULT NULL,
  `u_cmdb_subsystem` varchar(40) DEFAULT NULL,
  `u_configuration_items` mediumtext,
  `u_cr` varchar(40) DEFAULT NULL,
  `u_cr_notifications` mediumtext,
  `u_customer_commit_date` varchar(40) DEFAULT NULL,
  `u_customer_notification` varchar(40) DEFAULT NULL,
  `u_customer_notification_choice` varchar(40) DEFAULT NULL,
  `u_customer_notification_info` varchar(40) DEFAULT NULL,
  `u_data_center` varchar(40) DEFAULT NULL,
  `u_data_warehouse` varchar(40) DEFAULT NULL,
  `u_database` varchar(40) DEFAULT NULL,
  `u_description_of_impact` varchar(40) DEFAULT NULL,
  `u_development_needed` varchar(40) DEFAULT NULL,
  `u_dont_send_mail` varchar(40) DEFAULT NULL,
  `u_duration_of_impact` varchar(40) DEFAULT NULL,
  `u_emergency_incident` varchar(40) DEFAULT NULL,
  `u_environment` varchar(40) DEFAULT NULL,
  `u_estimated_hours` varchar(40) DEFAULT NULL,
  `u_evaluation` varchar(40) DEFAULT NULL,
  `u_evaluation_deadline` varchar(40) DEFAULT NULL,
  `u_evaluation_reminder_interval` varchar(40) DEFAULT NULL,
  `u_generate_stat_email` varchar(40) DEFAULT NULL,
  `u_glidelocation` varchar(40) DEFAULT NULL,
  `u_has_attachments` varchar(40) DEFAULT NULL,
  `u_impact` varchar(40) DEFAULT NULL,
  `u_impact_of_delaying_or_postpo` varchar(40) DEFAULT NULL,
  `u_implementation_results` varchar(40) DEFAULT NULL,
  `u_implemented_not_approved` varchar(40) DEFAULT NULL,
  `u_incident_ticket_number` mediumtext,
  `u_infosec` varchar(40) DEFAULT NULL,
  `u_location` mediumtext,
  `u_network` tinyint(1) DEFAULT NULL,
  `u_none` tinyint(1) DEFAULT NULL,
  `u_nooperations` tinyint(1) DEFAULT NULL,
  `u_package_version` varchar(40) DEFAULT NULL,
  `u_parent_change` varchar(40) DEFAULT NULL,
  `u_planned_release_date` datetime DEFAULT NULL,
  `u_planning_calendar` varchar(40) DEFAULT NULL,
  `u_post_production_validation` varchar(40) DEFAULT NULL,
  `u_pre_start_date` datetime DEFAULT NULL,
  `u_product_type` varchar(40) DEFAULT NULL,
  `u_reason` varchar(40) DEFAULT NULL,
  `u_reason_codes` varchar(40) DEFAULT NULL,
  `u_reason_details_explanation` mediumtext,
  `u_relevantoperations` tinyint(1) DEFAULT NULL,
  `u_req_for` varchar(40) DEFAULT NULL,
  `u_request_assigned_to` varchar(40) DEFAULT NULL,
  `u_request_category` varchar(40) DEFAULT NULL,
  `u_request_closure_notes` mediumtext,
  `u_request_detail` mediumtext,
  `u_request_item_name` varchar(40) DEFAULT NULL,
  `u_request_number` varchar(40) DEFAULT NULL,
  `u_request_subcategory` varchar(40) DEFAULT NULL,
  `u_requested_for` varchar(40) DEFAULT NULL,
  `u_requestitem_stage` varchar(40) DEFAULT NULL,
  `u_requirements_completed` tinyint(1) DEFAULT NULL,
  `u_requirements_needed` varchar(40) DEFAULT NULL,
  `u_reschedule_explanation` mediumtext,
  `u_reschedule_reason` varchar(40) DEFAULT NULL,
  `u_revision_number` varchar(40) DEFAULT NULL,
  `u_service` varchar(40) DEFAULT NULL,
  `u_service_customer_impact` varchar(40) DEFAULT NULL,
  `u_sprint_name` varchar(40) DEFAULT NULL,
  `u_stat_description` varchar(40) DEFAULT NULL,
  `u_storage` tinyint(1) DEFAULT NULL,
  `u_sub_category` varchar(40) DEFAULT NULL,
  `u_sub_system` mediumtext,
  `u_subtype` varchar(40) DEFAULT NULL,
  `u_time_required_for_backout` datetime DEFAULT NULL,
  `u_time_required_for_implementa` datetime DEFAULT NULL,
  `u_total_change_time` datetime DEFAULT NULL,
  `u_upon_approval` varchar(40) DEFAULT NULL,
  `u_validation_of_change` mediumtext,
  `u_will_there_be_service_or_cus` varchar(40) DEFAULT NULL,
  `upon_approval` varchar(40) DEFAULT NULL,
  `upon_reject` varchar(40) DEFAULT NULL,
  `urgency` bigint(20) DEFAULT NULL,
  `user_input` mediumtext,
  `watch_list` mediumtext,
  `work_end` datetime DEFAULT NULL,
  `work_notes_list` mediumtext,
  `work_start` datetime DEFAULT NULL,
  `mirror_created_on` datetime DEFAULT NULL,
  `mirror_updated_on` datetime DEFAULT NULL,
  UNIQUE KEY `sys_id` (`sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
