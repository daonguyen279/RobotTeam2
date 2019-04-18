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


*** Test Cases ***
# For-Loop-In-Range
    # ${Count}=    Get matching xpath count    //a[@class="hasTooltip"] 

test1
    ${List1}    Create List    1    2    3    4
    Select Topic    ${List1}

*** Keywords ***
Select Topic
    [Arguments]    @{input}
    ${cnt}=    Get length    @{input}
    Log     ${cnt}*
    