@HTTP_Sink
Feature: HTTP Sink - Verify HTTP Source Plugin Error scenarios

  Scenario:Verify HTTP plugin sink validation errors for reference name mandatory field
    Given Open Datafusion Project to configure pipeline
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "HTTP" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "httpUrl" with value: "httpSrcUrl"
    Then Validate mandatory property error for "referenceName"

  Scenario:Verify HTTP plugin sink validation errors for url mandatory field
    Given Open Datafusion Project to configure pipeline
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "HTTP" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Validate mandatory property error for "url"

  Scenario:Verify HTTP plugin sink validation errors for batch size mandatory field
    Given Open Datafusion Project to configure pipeline
    When Expand Plugin group in the LHS plugins list: "Sink"
    When Select plugin: "HTTP" from the plugins list as: "Sink"
    Then Navigate to the properties page of plugin: "HTTP"
    Then Enter input plugin property: "referenceName" with value: "httpSrcReferenceName"
    Then Enter input plugin property: "httpUrl" with value: "httpSrcUrl"
    Then Replace input plugin property: "batchSize" with value: ""
    Then Validate mandatory property error for "batchSize"
