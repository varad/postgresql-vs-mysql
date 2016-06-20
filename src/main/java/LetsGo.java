import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.sql.DataSource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class LetsGo {

	private static final String COLUMN_NAMES = "active,activity_due,additional_assignee_list,approval,approval_set,assigned_to,assignment_group,backout_plan,business_duration,business_service,cab_date,cab_recommendation,calendar_duration,category,change_plan,close_notes,closed_at,closed_by,cmdb_ci,comments_and_work_notes,company,conflict_last_run,conflict_status,contact_type,correlation_display,correlation_id,delivery_plan,delivery_task,description,due_date,end_date,escalation,expected_start,follow_up,group_list,impact,implementation_plan,justification,knowledge,location,made_sla,number,opened_at,opened_by,order1,outside_maintenance_schedule,parent,phase,phase_state,priority,production_system,reason,reassignment_count,requested_by,requested_by_date,review_comments,review_date,review_status,risk,scope,short_description,sla_due,start_date,state,sys_class_name,sys_created_by,sys_created_on,sys_domain,sys_domain_path ,sys_id ,sys_mod_count,sys_updated_by,sys_updated_on,test_plan,time_worked,type,u_activity_type,u_actual_hours,u_additional_cis,u_br_approvalattached,u_br_approvalreceived,u_business_approval_assigned_t,u_business_services,u_caused_incident,u_change_owner,u_change_tasks_complete,u_changes_completed,u_ci_not_listed,u_ci_selection,u_classification,u_cmdb_subsystem,u_configuration_items,u_cr,u_cr_notifications,u_customer_commit_date,u_customer_notification,u_customer_notification_choice,u_customer_notification_info,u_data_center,u_data_warehouse,u_database,u_description_of_impact,u_development_needed,u_dont_send_mail,u_duration_of_impact,u_emergency_incident,u_environment,u_estimated_hours,u_evaluation,u_evaluation_deadline,u_evaluation_reminder_interval,u_generate_stat_email,u_glidelocation,u_has_attachments,u_impact,u_impact_of_delaying_or_postpo,u_implementation_results,u_implemented_not_approved,u_incident_ticket_number,u_infosec,u_location,u_network,u_none,u_nooperations,u_package_version,u_parent_change,u_planned_release_date,u_planning_calendar,u_post_production_validation,u_pre_start_date,u_product_type,u_reason,u_reason_codes,u_reason_details_explanation,u_relevantoperations,u_req_for,u_request_assigned_to,u_request_category,u_request_closure_notes,u_request_detail,u_request_item_name,u_request_number,u_request_subcategory,u_requested_for,u_requestitem_stage,u_requirements_completed,u_requirements_needed,u_reschedule_explanation,u_reschedule_reason,u_revision_number,u_service,u_service_customer_impact,u_sprint_name,u_stat_description,u_storage,u_sub_category,u_sub_system,u_subtype,u_time_required_for_backout,u_time_required_for_implementa,u_total_change_time,u_upon_approval,u_validation_of_change,u_will_there_be_service_or_cus,upon_approval,upon_reject,urgency,user_input,watch_list,work_end,work_notes_list,work_start,mirror_created_on,mirror_updated_on";
	private static final Set<String> COLUMNS = new HashSet<String>(Arrays.asList(StringUtils.split(COLUMN_NAMES, ",")));
	private static final String TABLE_NAME = "u_test_change_request";
	int NUMBER_OF_RECORDS = 250;

	public static void main(String[] args) throws Exception {
		LetsGo letsGo = new LetsGo();
		letsGo.run(Type.POSTGRES);
		letsGo.run(Type.MYSQL);
	}

	public static DataSource getDataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		String params = "?useUnicode=true&characterEncoding=utf8&stringtype=unspecified";
		ds.setJdbcUrl("jdbc:postgresql://localhost/postgres-vs-mysql" + params);
		ds.setUser("postgres");
		ds.setPassword("password");
		return ds;
	}


	public static DataSource getMysqlDataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		String params = "?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		ds.setJdbcUrl("jdbc:mysql://localhost/postgres-vs-mysql" + params);
		ds.setUser("root");
		ds.setPassword("password");
		return ds;
	}

	public void run(Type type) throws Exception {
		DataSource dataSource = getDataSource(type);

		System.out.println("/////////////////////////////////////////////////////////////////////////////////////");
		System.out.println("Type: " + type);
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(dataSource);
		NamedParameterJdbcTemplate jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);

		jdbcTemplate.update("DELETE FROM " + TABLE_NAME, new HashMap<String, Object>());

		// Parse ServiceNow XML file
		System.out.println("Parsing file...");
		Document doc = parseServiceNowXmlToDOM();

		// Prepare batch parameters
		System.out.println("Preparing batch parameters...");
		SqlParameterSource[] batchArgs = new SqlParameterSource[NUMBER_OF_RECORDS];
		prepareBatchParams(NUMBER_OF_RECORDS, doc, batchArgs, type);

		// Prepare SQL
		System.out.println("Preparing SQL query...");
		String sql = "INSERT INTO " + TABLE_NAME + " (" + StringUtils.join(COLUMNS, ", ") + ") VALUES (:" +
				StringUtils.join(COLUMNS, ", :") + ")";
		System.out.println("SQL: " + sql);

		// Insert data
		Date start = new Date();
		System.out.println("Start: " + start);
		TransactionDefinition txDef = new DefaultTransactionDefinition();
		TransactionStatus txStatus = transactionManager.getTransaction(txDef);
		try {
			jdbcTemplate.batchUpdate(sql.toString(), batchArgs);
			transactionManager.commit(txStatus);
		} catch (Exception e) {
			transactionManager.rollback(txStatus);
			throw new RuntimeException(e);
		}
		Date end = new Date();
		System.out.println("End: " + end);
		System.out.println("TIME: " + (end.getTime() - start.getTime()) + "ms");

		// verify
		Integer count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM " + TABLE_NAME, new HashMap<String, Object>
				(), Integer.class);
		System.out.println("Count: " + count);
	}

	private DataSource getDataSource(Type type) {
		DataSource dataSource;
		if (type == Type.MYSQL) {
			dataSource = getMysqlDataSource();
		} else {
			dataSource = getDataSource();
		}
		return dataSource;
	}

	private void prepareBatchParams(int numberOfRecords, Document doc, SqlParameterSource[] batchArgs, Type type)
			throws ParseException {
		int addedIdx = 0;
		NodeList nodeList = doc.getChildNodes().item(0).getChildNodes();
		for (int idx = 0; idx < nodeList.getLength(); idx++) {
			MapSqlParameterSource source = new MapSqlParameterSource();

			if (nodeList.item(idx).getNodeType() == 1) {
				NodeList colList = nodeList.item(idx).getChildNodes();

				for (String column : COLUMNS) {
					source.addValue(column, null);
				}

				for (int colIdx = 0; colIdx < colList.getLength(); colIdx++) {
					if (colList.item(colIdx).getNodeType() == 1) {
						String nodeName = colList.item(colIdx).getNodeName();
						Node valueNode = colList.item(colIdx).getFirstChild();
						String value = null;
						if (valueNode != null) {
							value = colList.item(colIdx).getFirstChild().getNodeValue();
						}

						if ("false".equalsIgnoreCase(value)) {
							source.addValue(nodeName, false);
						} else if ("true".equalsIgnoreCase(value)) {
							source.addValue(nodeName, true);
						} else if (value != null && value.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")) {
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							if (type == Type.MYSQL && nodeName.equals("time_worked")) {
								source.addValue(nodeName, sdf.parse(value).getTime());
							} else {
								source.addValue(nodeName, sdf.parse(value));
							}
						} else if (value != null && value.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}.*")) {
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							if (type == Type.MYSQL && nodeName.equals("time_worked")) {
								source.addValue(nodeName, sdf.parse(value).getTime());
							} else {
								source.addValue(nodeName, sdf.parse(value));
							}
						} else if (NumberUtils.isNumber(value)) {
							source.addValue(nodeName, new Double(value).intValue());
						} else {
							source.addValue(nodeName, value);
						}
					}
				}
				source.addValue("mirror_created_on", new Date());
				source.addValue("mirror_updated_on", new Date());

				batchArgs[addedIdx] = source;
				addedIdx++;
			}

			if (addedIdx >= numberOfRecords) {
				break;
			}
		}
	}

	private Document parseServiceNowXmlToDOM() throws ParserConfigurationException, SAXException, IOException {
		InputStream stream = getClass().getResourceAsStream("/u_test_change_request.xml");
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		return dBuilder.parse(stream);
	}

}
