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
package io.cdap.plugin.http.actions;

import io.cdap.e2e.utils.ElementHelper;
import io.cdap.e2e.utils.JsonUtils;
import io.cdap.e2e.utils.PluginPropertyUtils;
import io.cdap.e2e.utils.SeleniumDriver;
import io.cdap.e2e.utils.SeleniumHelper;
import io.cdap.plugin.http.locators.HttpPluginLocators;

import java.util.Map;

/**
 * Represents Http plugin related actions.
 */
public class HttpPluginActions {
  static {
    SeleniumHelper.getPropertiesLocators(HttpPluginLocators.class);
  }

  public static void enterJSONXmlFieldsMapping(String jsonFieldsMapping) {
    Map<String, String> fieldsMapping =
      JsonUtils.convertKeyValueJsonArrayToMap(PluginPropertyUtils.pluginProp(jsonFieldsMapping));
    int index = 1;
    for (Map.Entry<String, String> entry : fieldsMapping.entrySet()) {
      ElementHelper.sendKeys(HttpPluginLocators.fieldsMappingKey(index), entry.getKey());
      ElementHelper.sendKeys(HttpPluginLocators.fieldsMappingValue(index), entry.getValue());
      ElementHelper.clickOnElement(HttpPluginLocators.fieldsMappingAddRowButton(index));
      index++;
    }
  }

  public static void enterOutputSchema(String jsonOutputSchema) {
    Map<String, String> outputSchema =
      JsonUtils.convertKeyValueJsonArrayToMap(PluginPropertyUtils.pluginProp(jsonOutputSchema));
    int index = 0;
    for (Map.Entry<String, String> entry : outputSchema.entrySet()) {
      ElementHelper.sendKeys(HttpPluginLocators.outputSchemaFieldName(index), entry.getKey());
      ElementHelper.clickOnElement(HttpPluginLocators.outputSchemaDataTypeDropdown(index));
      SeleniumDriver.getDriver()
        .findElement(HttpPluginLocators.outputSchemaDataTypeOption(index, entry.getValue())).click();
      ElementHelper.selectCheckbox(HttpPluginLocators.outputSchemaCheckbox(index));
      ElementHelper.clickOnElement(HttpPluginLocators.outputSchemaAddRowButton(index));
      index++;
    }
  }
}
