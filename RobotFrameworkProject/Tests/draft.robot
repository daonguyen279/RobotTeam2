*** Variables ***
# ---------- categories ----------
${lbl_categories}                     xpath=//div[@class="span3"]//a[span[contains(text(), "Categories")]]
${lbl_new_categories}                 xpath=//div[@class="btn-wrapper"]//button//span[@class="icon-new icon-white"]
${txt_title_categories}               xpath=//div[@class="control-group"]//div[@class="controls"]//input[@id="jform_title"]
${txt_cont_categories}                xpath=//iframe[contains(@id,'jform_description_ifr')]
${btn_save_categories}                xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-apply btn-success"]
${btn_save_close_categories}          xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-save"]
${id}                                 id=tinymce  
${lbl_title_categories}               xpath=//a[@class="hasTooltip"]      
${number}                             count(//span[@class="icon-unpublish"])


*** Settings ***
Library       OperatingSystem    
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminCategoryPage.robot
Resource    ../Pages/Admin/AdminLoginPage.robot
Test setup	    Setup
Test teardown	Teardown


*** Test Cases ***
TC
    # ${count}    Get Element Count      ${lbl_title_categories}    
    Login Admin Site    ${USERNAME}    ${PASSWORD}
    Delete a category
    # Check message successfully      ${lbl_message}        ${count}
    # Should Be Equal As Integers    ${count}    ${4}  