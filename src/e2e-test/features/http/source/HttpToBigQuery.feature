@HTTP_Source
Feature: HTTP Source - Verify successful data transfer from HTTP to BigQuery

  @BQ_SINK_TEST
  Scenario:Verify successful data transfer from HTTP GET request to BigQuery
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "HTTP" from the plugins list as: "Source"
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Connect plugins: "HTTP" and "BigQuery" to establish connection
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Enter input plugin property: "httpUrl" with value: "httpSrcUrl"
    Then Select dropdown plugin property: "httpMethod" with option value: "httpSrcGETMethod"
    Then Select dropdown plugin property: "format" with option value: "json"
    Then Enter input plugin property: "jsonXmlResultPath" with value: "httpSrcResultPath"
    Then Enter HTTP plugin jsonFieldsMapping "httpSrcValidJsonFieldsMapping"
    Then Enter outputSchema "httpSrcValidOutputSchema"
    Then Validate "HTTP" plugin properties
    Then Capture the generated Output Schema
    Then Close the Plugin Properties page
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Replace input plugin property: "projectId" with value: "projectId"
    Then Enter input plugin property: "datasetProjectId" with value: "projectId"
    Then Enter input plugin property: "referenceName" with value: "BQReferenceName"
    Then Enter input plugin property: "dataset" with value: "dataset"
    Then Enter input plugin property: "table" with value: "bqTargetTable"
    Then Click plugin property: "truncateTable"
    Then Click plugin property: "updateTableSchema"
    Then Validate "BigQuery" plugin properties
    Then Close the Plugin Properties page
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Click on the Preview Data link on the Sink plugin node: "BigQuery"
    Then Verify sink plugin's Preview Data for Input Records table and the Input Schema matches the Output Schema of Source plugin
    Then Close the preview data
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Validate target BigQuery records count is equal to HTTP records count with Url "httpSrcUrl" method "httpSrcGETMethod" resultPath "httpSrcResultPath"

  @BQ_SINK_TEST @PLUGIN-1021
  Scenario:Verify successful data transfer from HTTP GET request to BigQuery with basic auth
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "HTTP" from the plugins list as: "Source"
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Connect plugins: "HTTP" and "BigQuery" to establish connection
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Enter input plugin property: "httpUrl" with value: "httpSrcUrlBasicAuth"
    Then Select dropdown plugin property: "httpMethod" with option value: "httpSrcGETMethod"
    Then Select dropdown plugin property: "format" with option value: "json"
    Then Enter input plugin property: "jsonXmlResultPath" with value: "httpSrcResultPath"
    Then Enter HTTP plugin jsonFieldsMapping "httpSrcJsonFieldsMappingBasicAuth"
    Then Enter input plugin property: "basicAuthUsername" with value: "admin"
    Then Enter input plugin property: "basicAuthPassword" with value: "admin"
    Then Enter outputSchema "httpSrcOutputSchemaBasicAuth"
    Then Validate "HTTP" plugin properties
    Then Capture the generated Output Schema
    Then Close the Plugin Properties page
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Replace input plugin property: "projectId" with value: "projectId"
    Then Enter input plugin property: "datasetProjectId" with value: "projectId"
    Then Enter input plugin property: "referenceName" with value: "BQReferenceName"
    Then Enter input plugin property: "dataset" with value: "dataset"
    Then Enter input plugin property: "table" with value: "bqTargetTable"
    Then Click plugin property: "truncateTable"
    Then Click plugin property: "updateTableSchema"
    Then Validate "BigQuery" plugin properties
    Then Close the Plugin Properties page
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Click on the Preview Data link on the Sink plugin node: "BigQuery"
    Then Verify sink plugin's Preview Data for Input Records table and the Input Schema matches the Output Schema of Source plugin
    Then Close the preview data
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Validate target BigQuery records count is equal to HTTP records count with Url "httpSrcUrl" method "httpSrcGETMethod" resultPath "httpSrcResultPath"
