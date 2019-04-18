*** Variables ***
# ---------- categories ----------
${lbl_categories}                     xpath=//div[@class="span3"]//a[span[contains(text(), "Categories")]]
${lbl_new_categories}                 xpath=//div[@class="btn-wrapper"]//button//span[@class="icon-new icon-white"]
${title_categories}                   xpath=(//div[@class="control-group"]//div[@class="controls"]//input)[1]
${cont_categories}                    xpath=//body[@class="mce-content-body "]
${btn_save_categories}                xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-apply btn-success"]
${btn_save_close_categories}          xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-save"]


*** Settings ***
Resource	../../Resources/Setup.robot
Resource    ../../AdminHomePage.robot


*** Keywords ***
Add New Category
    [Arguments]                         ${arg_title_categories}       ${arg_cont_categories}
    Click Button                        ${lbl_categories}
    Click Button                        ${lbl_new_categories}
    Input Text    	                    ${title_categories}       ${arg_title_categories}
    Input Text                          ${cont_categories}       ${arg_cont_categories}
    Click Button                        ${btn_save_close_categories}  