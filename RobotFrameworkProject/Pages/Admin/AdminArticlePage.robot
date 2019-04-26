** Settings **
Resource    ../../Pages/Admin/AdminHomePage.robot


** Variables **
${txt_articles_title}             xpath=//div[@class="controls"]/input[@id="jform_title"]
${txt_articles_alias}             xpath=//div[@class="controls"]/input[@id="jform_alias"]
${ifr_articles_frame}             xpath=//iframe[contains(@id,'jform_articletext_ifr')]
${txt_articles_add_content}       xpath=//body[@id="tinymce"]
${btn_articles_save_and_close}    xpath=//button[@class="btn btn-small button-save"]
${txt_articles_message}           xpath=//div[@class="alert-message"]
${btn_articles_trash}             xpath=//div[@id="toolbar-trash"]/button
${tab_articles_count_total}       xpath=//table[@id="articleList"]//tr[td/input[@onclick="Joomla.isChecked(this.checked);"]]
${btn_articles_unpublish}         xpath=//div[@id="toolbar-unpublish"]/button


** Keywords **
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
    [Arguments]               ${arg_article_check_title}                                                            ${arg_article_check_message}
    Element Text Should Be    xpath=//table[@id="articleList"]//a[contains(text(),'${arg_article_check_title}')]    ${arg_article_check_title}
    Element Text Should Be    ${txt_articles_message}                                                               ${arg_article_check_message}

Go To Edit Article Page
    [Arguments]      ${arg_article_select_title}
    Click Element    xpath=//table[@id="articleList"]//a[contains(text(),'${arg_article_select_title}')]
        
Edit Article
    [Arguments]     ${arg_article_edit_title} 
    Input Text      ${txt_articles_title}             ${arg_article_edit_title} 
    Click Button    ${btn_articles_save_and_close}    
    
Check Edit Article Sucessfully
    [Arguments]                      ${arg_article_check_edit_title}
    Wait Until Element Is Visible    xpath=//table[@id="articleList"]//a[contains(text(),'${arg_article_check_edit_title}')] 
    Element Text Should Be           xpath=//table[@id="articleList"]//a[contains(text(),'${arg_article_check_edit_title}')]    ${arg_article_check_edit_title}

Unpublish Article
    [Arguments]      ${arg_select_title}
    Click Element    xpath=//table[@id="articleList"]//tr[td//a[contains(text(),"${arg_select_title}")]]/td[count(//table[@id="articleList"]//tr/th[input]/preceding-sibling::th)+1]/input
    Click Button     ${btn_articles_unpublish} 
   
Check Unpublish Article Successfully
    [Arguments]                  ${arg_select_title}
    Element Should Be Visible    xpath=//table[@id="articleList"]//tr[td//a[contains(text(),"${arg_select_title}")]]/td[count(//table[@id="articleList"]//tr/th[a[@data-name="Status"]]/preceding-sibling::th)+1]/div[@class="btn-group"]/a/span[@class="icon-unpublish"]
             
Delete Article 
    [Arguments]                ${arg_select_title}
    ${count_total_articles}    Get Element Count        ${tab_articles_count_total}
    Click Element              xpath=//table[@id="articleList"]//tr[td//a[contains(text(),"${arg_select_title}")]]/td[count(//table[@id="articleList"]//tr/th[input]/preceding-sibling::th)+1]/input
    Click Button               ${btn_articles_trash} 
    ${count_after_delete}      Get Element Count        ${tab_articles_count_total}        
    ${count_result}            Evaluate                 ${count_total_articles} - 1 
    Should Be Equal            ${count_after_delete}    ${count_result}
    
Check Delete Article Successfully 
    [Arguments]                ${arg_check_alias}   
    Page Should Not Contain    ${arg_check_alias} 