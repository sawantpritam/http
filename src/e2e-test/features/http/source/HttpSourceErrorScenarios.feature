@HTTP_Source
Feature: HTTP Source - Verify HTTP Source Plugin Error scenarios

  Scenario:Verify HTTP plugin source validation errors for reference name mandatory field
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "HTTP" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "httpUrl" with value: "httpSrcUrl"
    Then Validate mandatory property error for "referenceName"

  Scenario:Verify HTTP plugin source validation errors for url mandatory field
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "HTTP" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Validate mandatory property error for "url"

  Scenario Outline:Verify HTTP plugin source validation errors for OAuth2 mandatory properties
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "HTTP" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Enter input plugin property: "httpUrl" with value: "httpSrcUrl"
    Then Select dropdown plugin property: "httpMethod" with option value: "httpSrcGETMethod"
    Then Select dropdown plugin property: "format" with option value: "json"
    Then Enter input plugin property: "jsonXmlResultPath" with value: "httpSrcResultPath"
    Then Enter HTTP plugin jsonFieldsMapping "httpSrcValidJsonFieldsMapping"
    Then Enter outputSchema "httpSrcValidOutputSchema"
    Then Click plugin property: "oAuth2Enabled"
    Then Enter HTTP plugin OAuth2 properties with blank "<property>"
    Then Validate mandatory property error for HTTP plugin OAuth2 "<property>"
    Examples:
      | property     |
      | authUrl      |
      | tokenUrl     |
      | clientId     |
      | clientSecret |
      | refreshToken |

  Scenario:Verify HTTP plugin validation error for invalid jsonPath and outputSchema mapping
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "HTTP" from the plugins list as: "Source"
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Enter input plugin property: "httpUrl" with value: "httpSrcUrl"
    Then Select dropdown plugin property: "httpMethod" with option value: "httpSrcGETMethod"
    Then Select dropdown plugin property: "format" with option value: "json"
    Then Enter input plugin property: "jsonXmlResultPath" with value: "httpSrcResultPath"
    Then Enter HTTP plugin jsonFieldsMapping "httpSrcInvalidJsonFieldsMapping"
    Then Verify plugin properties validation fails with 1 error

  Scenario:Negative- Verify Pipeline preview is getting failed for invalid HTTP output schema
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
    Then Enter outputSchema "httpSrcInvalidOutputSchema"
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
    Then Verify the preview run status of pipeline in the logs is "failed"

  Scenario:Negative- Verify Pipeline preview is getting failed for incorrect jsonResultPath
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
    Then Enter input plugin property: "jsonXmlResultPath" with value: "httpSrcIncorrectResultPath"
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
    Then Verify the preview run status of pipeline in the logs is "failed"

  Scenario:Negative- Verify Pipeline preview is getting failed for incorrect HTTP URL
    Given Open Datafusion Project to configure pipeline
    When Select plugin: "HTTP" from the plugins list as: "Source"
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "BigQuery" from the plugins list as: "Sink"
    Then Connect plugins: "HTTP" and "BigQuery" to establish connection
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Enter input plugin property: "httpUrl" with value: "httpSrcIncorrectUrl"
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
    Then Verify the preview run status of pipeline in the logs is "failed"
