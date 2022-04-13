@HTTP_Source
Feature: HTTP Source - Verify successful data transfer from HTTP to BigQuery with macro arguments

  @BQ_SINK_TEST
  Scenario:Verify successful data transfer from HTTP GET request to BigQuery using macro arguments
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "HTTP" from the plugins list as: "Source"
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Connect plugins: "HTTP" and "BigQuery" to establish connection
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Click on the Macro button of Property: "httpUrl" and set the value to: "httpSourceUrl"
    Then Click on the Macro button of Property: "httpMethodMacroInput" and set the value to: "httpSourceMethod"
    Then Click on the Macro button of Property: "formatMacroInput" and set the value to: "httpSourceFormat"
    Then Click on the Macro button of Property: "jsonXmlResultPath" and set the value to: "httpJsonXMLResultPath"
    Then Click on the Macro button of Property: "fieldsMapping" and set the value to: "httpFieldsMapping"
    Then Enter HTTP source property output schema "outputSchema" as macro argument "httpSourceOutputSchema"
    Then Validate "HTTP" plugin properties
    Then Close the Plugin Properties page
    Then Navigate to the properties page of plugin: "BigQuery"
    Then Enter input plugin property: "referenceName" with value: "BQReferenceName"
    Then Click on the Macro button of Property: "projectId" and set the value to: "bqProjectId"
    Then Click on the Macro button of Property: "datasetProjectId" and set the value to: "bqDatasetProjectId"
    Then Click on the Macro button of Property: "dataset" and set the value to: "bqDataset"
    Then Click on the Macro button of Property: "table" and set the value to: "bqTable"
    Then Click on the Macro button of Property: "truncateTableMacroInput" and set the value to: "bqTruncateTable"
    Then Click on the Macro button of Property: "updateTableSchemaMacroInput" and set the value to: "bqUpdateTableSchema"
    Then Validate "BigQuery" plugin properties
    Then Close the Plugin Properties page
    Then Save the pipeline
    Then Preview and run the pipeline
    Then Enter runtime argument value "httpSrcUrl" for key "httpSourceUrl"
    Then Enter runtime argument value "httpSrcGETMethod" for key "httpSourceMethod"
    Then Enter runtime argument value "httpSrcFormat" for key "httpSourceFormat"
    Then Enter runtime argument value "httpSrcResultPath" for key "httpJsonXMLResultPath"
    Then Enter runtime argument value "httpSrcMacroJsonFieldsMapping" for key "httpFieldsMapping"
    Then Enter runtime argument value "httpSrcOutputSchema" for key "httpSourceOutputSchema"
    Then Enter runtime argument value "projectId" for key "bqProjectId"
    Then Enter runtime argument value "projectId" for key "bqDatasetProjectId"
    Then Enter runtime argument value "dataset" for key "bqDataset"
    Then Enter runtime argument value "bqTargetTable" for key "bqTable"
    Then Enter runtime argument value "bqTruncateTable" for key "bqTruncateTable"
    Then Enter runtime argument value "bqUpdateTableSchema" for key "bqUpdateTableSchema"
    Then Run the preview of pipeline with runtime arguments
    Then Wait till pipeline preview is in running state
    Then Open and capture pipeline preview logs
    Then Verify the preview run status of pipeline in the logs is "succeeded"
    Then Close the pipeline logs
    Then Close the preview
    Then Deploy the pipeline
    Then Run the Pipeline in Runtime
    Then Enter runtime argument value "httpSrcUrl" for key "httpSourceUrl"
    Then Enter runtime argument value "httpSrcGETMethod" for key "httpSourceMethod"
    Then Enter runtime argument value "httpSrcFormat" for key "httpSourceFormat"
    Then Enter runtime argument value "httpSrcResultPath" for key "httpJsonXMLResultPath"
    Then Enter runtime argument value "httpSrcMacroJsonFieldsMapping" for key "httpFieldsMapping"
    Then Enter runtime argument value "httpSrcOutputSchema" for key "httpSourceOutputSchema"
    Then Enter runtime argument value "projectId" for key "bqProjectId"
    Then Enter runtime argument value "projectId" for key "bqDatasetProjectId"
    Then Enter runtime argument value "dataset" for key "bqDataset"
    Then Enter runtime argument value "bqTargetTable" for key "bqTable"
    Then Enter runtime argument value "bqTruncateTable" for key "bqTruncateTable"
    Then Enter runtime argument value "bqUpdateTableSchema" for key "bqUpdateTableSchema"
    Then Run the Pipeline in Runtime with runtime arguments
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Validate target BigQuery records count is equal to HTTP records count with Url "httpSrcUrl" method "httpSrcGETMethod" resultPath "httpSrcResultPath"
