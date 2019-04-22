*** Settings ***
Resource	../../Resources/Setup.robot
Resource    ../../Pages/Admin/AdminHomePage.robot
Resource    ../../Pages/Admin/AdminLoginPage.robot


*** Variables ***
${txt_article_title}            xpath=//div[@class="controls"]/input[@id="jform_title"]
${txt_article_alias}            xpath=//div[@class="controls"]/input[@id="jform_alias"]
${txt_article_frame}            xpath=//iframe[contains(@id,'jform_articletext_ifr')]
${txt_article_addcontent}       xpath=//body[@id="tinymce"]
${btn_article_save}             xpath=//button[@class="btn btn-small button-save"]
${lnk_article_check_title}      xpath=//table[@id="articleList"]/tbody/tr[1]/td[4]/div/a
${txt_article_message}          xpath=//div[@class="alert-message"]
${cbb_article_checkbox}         xpath=//table[@id="articleList"]//tr[td/input[@onclick="Joomla.isChecked(this.checked);"]]/td[count(//table[@id="articleList"]//tr/th[input[@name="checkall-toggle"]]/preceding-sibling::th)+1]/input[@onclick="Joomla.isChecked(this.checked);"]
${btn_article_trash}            xpath=//div[@id="toolbar-trash"]/button
${tab_count_ID}                 xpath=//table[@id="articleList"]//tr[td/input[@onclick="Joomla.isChecked(this.checked);"]]
${btn_article_unpublish}        xpath=//div[@id="toolbar-unpublish"]/button
${lnk_aricle_icon_unpublish}    xpath=//table[@id="articleList"]/tbody/tr[1]/td[3]/div/a[1]


*** Keywords ***
Add New Article
    [Arguments]                      ${arg_article_title}         ${arg_article_alias}        ${arg_article_content}
    Select Sidebar Menu              ${lbl_new_article} 
    Input Text                       ${txt_article_title}         ${arg_article_title}
    Input Text                       ${txt_article_alias}         ${arg_article_alias}
    Select Frame                     ${txt_article_frame} 
    Input Text                       ${txt_article_addcontent}    ${arg_article_content}
    Unselect Frame    
    Click Button                     ${btn_article_save}
    Wait Until Element Is Visible    ${lnk_article_check_title}
    Element Text Should Be           ${lnk_article_check_title}    ${ARTICLE_TITLE}
    Element Text Should Be           ${txt_article_message}        ${ARTICLE_CHECK_MESSAGE}          
    
    
Edit Article
    [Arguments]               ${arg_edit_article_title} 
    Click Element             ${lnk_article_check_title}
    Input Text                ${txt_article_title}          ${arg_edit_article_title} 
    Click Button              ${btn_article_save}
    Element Text Should Be    ${lnk_article_check_title}    ${ARTICLE_EDIT_TITLE} 
    Element Text Should Be    ${txt_article_message}        ${ARTICLE_CHECK_MESSAGE}    


Unpulish Article
    Click Element                ${cbb_article_checkbox}
    Click Element                ${btn_article_unpublish} 
    Element Should Be Visible    ${lnk_aricle_icon_unpublish}
    
    
Delete Article 
    [Arguments]    ${arg_checkalias}
    ${count}     Get Element Count    ${tab_count_ID}
    Click Element                     ${cbb_article_checkbox}
    Click Button                      ${btn_article_trash} 
    ${count2}    Get Element Count    ${tab_count_ID}
    ${count3}    Evaluate             ${count} - 1 
    Should Be Equal                   ${count2}    ${count3}
    Page Should Not Contain           ${arg_checkalias} 