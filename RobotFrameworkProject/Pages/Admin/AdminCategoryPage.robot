*** Settings ***
Resource    AdminHomePage.robot


*** Variables ***
${lbl_categories_new}            xpath=//div[@class="btn-wrapper"]//button//span[@class="icon-new icon-white"]
${txt_categories_title}          id=jform_title
${txt_categories_title_alias}    id=jform_alias
${ifr_categories_content}        xpath=//iframe[contains(@id,'jform_description_ifr')]
${btn_categories_save_close}     xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-save"]
${txt_categories_content}        id=tinymce  
${lbl_categories_title}          xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr[last()]/td//a[@class="hasTooltip"]      
${cbb_categories_box}            xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr[last()]/td//input[@name="cid[]"]
${btn_categories_trash}          xpath=//button[@class="btn btn-small button-trash"]
${btn_categories_unpublish}      xpath=//button[@class="btn btn-small button-unpublish"]

# xpath template
${xph_categories_title}          xpath=//table[@id="categoryList"]//a[contains(text(),"{}")]


*** Keywords ***
Go To Add New Category Page
    Select Sidebar Menu    ${lbl_categories}  

Add New Category
    [Arguments]       ${arg_categories_title}          ${arg_categories_content}     ${arg_categories_alias}
    Click Element     ${lbl_categories_new}
    Input Text        ${txt_categories_title}          ${arg_categories_title}       
    Input Text        ${txt_categories_title_alias}    ${arg_categories_alias} 
    Select Frame      ${ifr_categories_content} 
    Input Text        ${txt_categories_content}        ${arg_categories_content}  
    Unselect Frame
    Click Button      ${btn_categories_save_close}

Check Add New Category Sucessfully
    [Arguments]                        ${arg_categories_check_title}                                                           
    ${check_title}    Format String    ${xph_categories_title}          ${arg_categories_check_title}    
    Element should be visible          ${check_title}

Go To Edit Category Page
    Click Element    ${lbl_categories_title}

Edit Category Information
    [Arguments]	      ${arg_categories_title_edit}    ${arg_categories_content_edit}   
    Input Text	      ${txt_categories_title}         ${arg_categories_title_edit}
    Select Frame      ${ifr_categories_content} 
    Input Text        ${txt_categories_content}       ${arg_categories_content_edit}  
    Unselect Frame
    Click Button      ${btn_categories_save_close}

Check Edit Category Sucessfully
    [Arguments]                       ${arg_categories_check_edit_title}
    ${check_edit}    Format String    ${xph_categories_title}               ${arg_categories_check_edit_title}    
    Element should be visible         ${check_edit}
    
Delete A Category
    Select Checkbox    ${cbb_categories_box}
    Click Element      ${btn_categories_trash}

Unpublish A Category
    Click Element    ${cbb_categories_box}
    Click Element    ${btn_categories_unpublish}

Check Delete Category Successfully
    [Arguments]                ${arg_categories_check_alias}   
    Page Should Not Contain    ${arg_categories_check_alias} 

Check Unpublish Article Successfully
    [Arguments]                            ${arg_categories_check_title}        
    ${check_unpublish}    Format String    ${xph_categories_title}          ${arg_categories_check_title}    
    Element should be visible              ${check_unpublish}