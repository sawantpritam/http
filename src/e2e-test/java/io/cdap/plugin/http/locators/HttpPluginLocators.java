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
package io.cdap.plugin.http.locators;

import io.cdap.e2e.utils.SeleniumDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

/**
 * Represents Http Plugin locators.
 */
public class HttpPluginLocators {

  public static WebElement fieldsMappingKey(int row) {
    String xpath = "(//*[@data-cy='fieldsMapping']//*[@data-cy='key']/input)[" + row + "]";
    return SeleniumDriver.getDriver().findElement(By.xpath(xpath));
  }

  public static WebElement fieldsMappingValue(int row) {
    String xpath = "(//*[@data-cy='fieldsMapping']//*[@data-cy='value']/input)[" + row + "]";
    return SeleniumDriver.getDriver().findElement(By.xpath(xpath));
  }

  public static WebElement fieldsMappingAddRowButton(int row) {
    String xpath = "(//*[@data-cy='fieldsMapping']//*[@data-cy='add-row'])[" + row + "]";
    return SeleniumDriver.getDriver().findElement(By.xpath(xpath));
  }

  public static WebElement outputSchemaFieldName(int row) {
    String xpath = "//*[@data-cy='schema-fields-list']//*[@data-cy='schema-row-" + row + "']//input";
    return SeleniumDriver.getDriver().findElement(By.xpath(xpath));
  }

  public static WebElement outputSchemaDataTypeDropdown(int row) {
    String xpath = "//*[@data-cy='schema-fields-list']//*[@data-cy='schema-row-" + row + "']" +
      "//*[@data-cy='select-undefined']";
    return SeleniumDriver.getDriver().findElement(By.xpath(xpath));
  }

  public static By outputSchemaDataTypeOption(int row, String option) {
    return By.xpath("//*[@data-cy='schema-fields-list']//*[@data-cy='schema-row-" + row + "']" +
                      "//*[@data-cy='select-undefined']//*[text()='" + option + "']");
  }

  public static WebElement outputSchemaCheckbox(int row) {
    String xpath = "//*[@data-cy='schema-fields-list']//*[@data-cy='schema-row-" + row + "']//input[@type='checkbox']";
    return SeleniumDriver.getDriver().findElement(By.xpath(xpath));
  }

  public static WebElement outputSchemaAddRowButton(int row) {
    String xpath = "//*[@data-cy='schema-fields-list']//*[@data-cy='schema-row-" + row + "']" +
      "//button[@data-cy='schema-field-add-button']";
    return SeleniumDriver.getDriver().findElement(By.xpath(xpath));
  }
}
