/*
 * Copyright © 2022 Cask Data, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package io.cdap.plugin.http.stepsdesign;

import io.cdap.e2e.pages.actions.CdfPluginPropertiesActions;
import io.cdap.e2e.utils.BigQueryClient;
import io.cdap.e2e.utils.CdfHelper;
import io.cdap.e2e.utils.JsonUtils;
import io.cdap.e2e.utils.PluginPropertyUtils;
import io.cdap.e2e.utils.WaitHelper;
import io.cdap.plugin.http.actions.HttpPluginActions;
import io.cdap.plugin.utils.E2ETestConstants;
import io.cdap.plugin.utils.HttpUtils;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import stepsdesign.BeforeActions;

import java.io.IOException;
import java.util.HashMap;
import java.util.Optional;

/**
 * HTTP Plugin steps design.
 */
public class HttpPlugin implements CdfHelper {

  @Then("Enter HTTP plugin jsonFieldsMapping {string}")
  public void enterHttpPluginJsonFieldsMapping(String jsonFieldsMapping) {
    HttpPluginActions.enterJSONXmlFieldsMapping(jsonFieldsMapping);
  }

  @Then("Enter outputSchema {string}")
  public void enterOutputSchema(String jsonOutputSchema) {
    HttpPluginActions.enterOutputSchema(jsonOutputSchema);
  }

  @Then("Validate target BigQuery records count is equal to HTTP records count " +
    "with Url {string} method {string} resultPath {string}")
  public void validateTargetBigQueryRecordsCountIsEqualToHTTPRecordsCountWithUrl
    (String url, String method, String resultPath) throws IOException, InterruptedException {
    int targetBQRecordsCount = BigQueryClient.countBqQuery(PluginPropertyUtils.pluginProp("bqTargetTable"));
    BeforeActions.scenario.write("No of Records Transferred to BigQuery:" + targetBQRecordsCount);
    Optional<String> response = HttpUtils
      .getHttpResponseBody(PluginPropertyUtils.pluginProp(url), PluginPropertyUtils.pluginProp(method),
                           new HashMap<>(), null);
    if (response.isPresent()) {
      Assert.assertEquals(JsonUtils.countJsonNodeSize(response.get(), PluginPropertyUtils.pluginProp(resultPath))
        , targetBQRecordsCount);
    } else {
      Assert.assertEquals(0, targetBQRecordsCount);
    }
  }

  @Then("Enter HTTP plugin OAuth2 properties with blank {string}")
  public void enterHTTPPluginOAuthPropertiesWithBlank(String pluginProperty) {
    if (!pluginProperty.equalsIgnoreCase("authUrl")) {
      CdfPluginPropertiesActions.enterValueInInputProperty("authUrl",
                                                           PluginPropertyUtils.pluginProp("httpAuthUrl"));
    }
    if (!pluginProperty.equalsIgnoreCase("tokenUrl")) {
      CdfPluginPropertiesActions.enterValueInInputProperty("tokenUrl",
                                                           PluginPropertyUtils.pluginProp("httpTokenUrl"));
    }
    if (!pluginProperty.equalsIgnoreCase("clientId")) {
      CdfPluginPropertiesActions.enterValueInInputProperty("clientId",
                                                           PluginPropertyUtils.pluginProp("httpClientId"));
    }
    if (!pluginProperty.equalsIgnoreCase("clientSecret")) {
      CdfPluginPropertiesActions.enterValueInInputProperty("clientSecret",
                                                           PluginPropertyUtils.pluginProp("httpClientSecret"));
    }
    if (!pluginProperty.equalsIgnoreCase("refreshToken")) {
      CdfPluginPropertiesActions.enterValueInInputProperty("refreshToken",
                                                           PluginPropertyUtils.pluginProp("httpAuthUrl"));
    }
    if (!PluginPropertyUtils.pluginProp("httpOAuth2Properties").contains(pluginProperty)) {
      Assert.fail("Invalid Http OAuth2 pluginProperty " + pluginProperty);
    }
  }

  @Then("Validate mandatory property error for HTTP plugin OAuth2 {string}")
  public void validateMandatoryPropertyErrorForHTTPPluginOAuth(String pluginProperty) {
    CdfPluginPropertiesActions.clickValidateButton();
    String expectedErrorMessage = PluginPropertyUtils.errorProp(E2ETestConstants.ERROR_MSG_HTTP_OAUTH_VALIDATION)
      .replaceAll("PROPERTY", pluginProperty);
    CdfPluginPropertiesActions.verifyPluginPropertyInlineErrorMessage(pluginProperty, expectedErrorMessage);
  }

  @Then("Enter HTTP source property output schema {string} as macro argument {string}")
  public void enterHTTPSourcePropertyOutputSchemaAsMacroArgument(String pluginProperty, String macroArgument) {
    SCHEMA_LOCATORS.schemaActions.click();
    SCHEMA_LOCATORS.schemaActionType("macro").click();
    WaitHelper.waitForElementToBeHidden(SCHEMA_LOCATORS.schemaActionType("macro"), 5);
    CdfPluginPropertiesActions.fillValueInMacroEnabledInputProperty(pluginProperty, macroArgument);
  }
}
