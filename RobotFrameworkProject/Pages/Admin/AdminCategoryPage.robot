*** Settings ***
Resource    AdminHomePage.robot


*** Variables ***
${lbl_new_categories}              xpath=//div[@class="btn-wrapper"]//button//span[@class="icon-new icon-white"]
${txt_title_categories}            xpath=//div[@class="control-group"]//div[@class="controls"]//input[@id="jform_title"]
${txt_title_alias_categories}      id=jform_alias
${txt_cont_categories}             xpath=//iframe[contains(@id,'jform_description_ifr')]
${btn_save_categories}             xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-apply btn-success"]
${btn_save_close_categories}       xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-save"]
${id_txtbox_content_categories}    id=tinymce  
${lbl_tittle_categories_count}     xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr/td//a[@class="hasTooltip"]
${lbl_title_categories}            xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr[last()]/td//a[@class="hasTooltip"]      
${select_box_categories}           xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr[last()]/td//input[@name="cid[]"]
${btn_trash_categories}            xpath=//button[@class="btn btn-small button-trash"]
${lbl_message}                     class=alert-message
${btn_unpublish_categories}        xpath=//button[@class="btn btn-small button-unpublish"]
   

*** Keywords ***
Go To Add New Category Page
    Select Sidebar Menu    ${lbl_categories}  
    
Add New Category
    [Arguments]	      ${arg_title_categories}            ${arg_cont_categories}    ${arg_alias}
    Click Element	  ${lbl_new_categories}
    Input Text	      ${txt_title_categories}            ${arg_title_categories}   
    Input Text        ${txt_title_alias_categories}      ${arg_alias} 
    Select Frame  	  ${txt_cont_categories} 
    Input Text        ${id_txtbox_content_categories}    ${arg_cont_categories}  
    Unselect Frame
    Click Button	  ${btn_save_close_categories}
    
Go To Edit Category Page
    Select Sidebar Menu    ${lbl_categories} 
    Click Element          ${lbl_title_categories}

Edit Category Information
    [Arguments]	      ${arg_title_categories_edit}       ${arg_cont_categories_edit}   
    Input Text	      ${txt_title_categories}            ${arg_title_categories_edit}
    Select Frame  	  ${txt_cont_categories} 
    Input Text        ${id_txtbox_content_categories}    ${arg_cont_categories_edit}  
    Unselect Frame          
    Click Button      ${btn_save_close_categories} 
    
Delete A Category 
    ${count_categories_post}            Get Element Count                   ${lbl_tittle_categories_count}
    Select Checkbox                                                         ${select_box_categories}
    Click Element                                                           ${btn_trash_categories}
    ${count_choosen_categories_post}    Get Element Count                   ${lbl_tittle_categories_count}
    ${count_left_categories_post}       Evaluate                            ${count_categories_post} - 1
    Should Be Equal                     ${count_choosen_categories_post}    ${count_left_categories_post}

Unpublish A Category
    Click Element     ${select_box_categories}
    Click Element     ${btn_unpublish_categories}

Check Message Successfully
    [Arguments]               ${arg_locator}    ${arg_expected}
    Element Text Should Be    ${arg_locator}    ${arg_expected}
