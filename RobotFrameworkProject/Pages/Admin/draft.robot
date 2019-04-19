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

*** Test Cases ***
# For-Loop-In-Range
    # ${Count}=    Get matching xpath count    //a[@class="hasTooltip"] 

test1
    # Find Index    ${lbl_title_categories}    
    Log    Num value is ${number}
*** Keywords ***
Find Index
   [Arguments]    ${element}    @{items}
   ${index} =    Set Variable    ${0}
   :FOR    ${item}    IN    @{items}
   \    Return From Keyword If    '${item}' == '${element}'    ${index}
   \    ${index} =    Set Variable    ${index + 1}
   Return From Keyword    ${-1}    # Also [Return] would work here.