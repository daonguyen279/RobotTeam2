*** Settings ***
Resource    ../../Pages/Admin/AdminHomePage.robot
Resource    ../../Pages/Admin/AdminLoginPage.robot


*** Variables ***
${txt_articles_title}             xpath=//div[@class="controls"]/input[@id="jform_title"]
${txt_articles_alias}             xpath=//div[@class="controls"]/input[@id="jform_alias"]
${ifr_articles_frame}             xpath=//iframe[contains(@id,'jform_articletext_ifr')]
${txt_articles_add_content}       xpath=//body[@id="tinymce"]
${btn_articles_save_and_close}    xpath=//button[@class="btn btn-small button-save"]
${lnk_articles_check_title}       xpath=//table[@id="articleList"]/tbody/tr[1]/td[4]/div/a
${txt_articles_message}           xpath=//div[@class="alert-message"]
${cbb_articles_checkbox}          xpath=//table[@id="articleList"]//tr[td/input[@onclick="Joomla.isChecked(this.checked);"]]/td[count(//table[@id="articleList"]//tr/th[input[@name="checkall-toggle"]]/preceding-sibling::th)+1]/input[@id="cb0"]
${btn_articles_trash}             xpath=//div[@id="toolbar-trash"]/button
${tab_articles_count_total}       xpath=//table[@id="articleList"]//tr[td/input[@onclick="Joomla.isChecked(this.checked);"]]
${btn_articles_unpublish}         xpath=//div[@id="toolbar-unpublish"]/button
${lnk_aricles_icon_unpublish}     xpath=//table[@id="articleList"]/tbody/tr[1]/td[3]/div/a[1]


*** Keywords ***
Go To Add New Article Page
    Select Sidebar Menu    ${lbl_new_article} 
     
Add New Article
    [Arguments]       ${arg_article_title}              ${arg_article_alias}      ${arg_article_content}
    Input Text        ${txt_articles_title}             ${arg_article_title}
    Input Text        ${txt_articles_alias}             ${arg_article_alias}
    Select Frame      ${ifr_articles_frame} 
    Input Text        ${txt_articles_addcontent}        ${arg_article_content}            
    Unselect Frame        
    Click Button      ${btn_articles_save_and_close}        
       
Check Add New Article Sucessfully
    Wait Until Element Is Visible    ${lnk_articles_check_title}
    Element Text Should Be           ${lnk_articles_check_title}    ${ARTICLE_TITLE}
    Element Text Should Be           ${txt_articles_message}        ${ARTICLE_CHECK_MESSAGE}

Go To Edit Article Page
    Click Element    ${lnk_articles_check_title}
        
Edit Article
    [Arguments]     ${arg_edit_article_title} 
    Input Text      ${txt_articles_title}             ${arg_edit_article_title} 
    Click Button    ${btn_articles_save_and_close}    
    
Check Edit Article Sucessfully
    Element Text Should Be    ${lnk_articles_check_title}    ${ARTICLE_EDIT_TITLE}

Unpublish Article
    Click Element    ${cbb_articles_checkbox}
    Click Element    ${btn_articles_unpublish} 
   
Check Unpublish Article Successfully
    Element Should Be Visible    ${lnk_aricles_icon_unpublish}
             
Delete Article 
    ${count_total_articles}          Get Element Count           ${tab_articles_count_total}
    Wait Until Element Is Visible    ${cbb_articles_checkbox}      
    Click Element                    ${cbb_articles_checkbox}    
    Click Button                     ${btn_articles_trash} 
    ${count_after_delete}            Get Element Count           ${tab_articles_count_total}        
    ${count_result}                  Evaluate                    ${count_total_articles} - 1 
    Should Be Equal                  ${count_after_delete}       ${count_result}
    
Check Delete Article Successfully 
    [Arguments]                ${arg_check_alias}   
    Page Should Not Contain    ${arg_check_alias} 