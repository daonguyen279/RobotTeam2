* Settings *
Resource    ../../Pages/Admin/AdminHomePage.robot


* Variables *
${txt_articles_title}             id=jform_title
${txt_articles_alias}             id=jform_alias
${ifr_articles_frame}             xpath=//iframe[contains(@id,'jform_articletext_ifr')]
${txt_articles_add_content}       id=tinymce
${btn_articles_save_and_close}    xpath=//button[@class="btn btn-small button-save"]
${btn_articles_trash}             xpath=//div[@id="toolbar-trash"]/button
${tab_articles_count_total}       xpath=//table[@id="articleList"]//tr[td/input[@onclick="Joomla.isChecked(this.checked);"]]
${btn_articles_unpublish}         xpath=//div[@id="toolbar-unpublish"]/button

# xpath template
${xph_articles_check_title}       xpath=//table[@id="articleList"]//a[contains(text(),'{}')] 
${xph_articles_checkbox}          xpath=//table[@id="articleList"]//tr[td//a[contains(text(),'{}')]]/td/input
${xph_articles_unpublish}         xpath=//table[@id="articleList"]//tr[td//a[contains(text(),'{}')]]/td/div[@class="btn-group"]/a/span[@class="icon-unpublish"]  


* Keywords *
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
    [Arguments]                                   ${arg_article_check_title}      
    ${xph_check_title}           Format String    ${xph_articles_check_title}    ${arg_article_check_title}   
    Element Should Be Visible                     ${xph_check_title}
    
Go To Edit Article Page
    [Arguments]                       ${arg_article_select_title}
    ${xph_title}     Format String    ${xph_articles_check_title}    ${arg_article_select_title}   
    Click Element                     ${xph_title}
        
Edit Article
    [Arguments]     ${arg_article_edit_title} 
    Input Text      ${txt_articles_title}             ${arg_article_edit_title} 
    Click Button    ${btn_articles_save_and_close}    
    
Check Edit Article Sucessfully
    [Arguments]                                       ${arg_article_check_edit_title}    
    ${xph_check_edit_title}          Format String    ${xph_articles_check_title}        ${arg_article_check_edit_title}   
    Wait Until Element Is Visible                     ${xph_check_edit_title} 
    Element Should Be Visible                         ${xph_check_edit_title}

Unpublish Article
    [Arguments]                                   ${arg_select_title}
    ${xph_articles_unpublish}    Format String    ${xph_articles_checkbox}     ${arg_select_title}
    Click Element                                 ${xph_articles_unpublish}         
    Click Button                                  ${btn_articles_unpublish}      
   
Check Unpublish Article Successfully
    [Arguments]                                   ${arg_select_title}    
    ${check_unpublish}           Format String    ${xph_articles_checkbox}    ${arg_select_title}
    Element Should Be Visible                     ${check_unpublish}  
Delete Article
    [Arguments]                              ${arg_select_title}
    ${xph_delete_article}    Format String   ${xph_articles_checkbox}    ${arg_select_title}
    Click Element                            ${xph_delete_article} 
    Click Button                             ${btn_articles_trash}
    
Check Delete Article Successfully
    [Arguments]                ${arg_check_alias}   
    Page Should Not Contain    ${arg_check_alias} 