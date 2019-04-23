*** Settings ***
Resource    AdminHomePage.robot


*** Variables ***
${lbl_categories_new}              xpath=//div[@class="btn-wrapper"]//button//span[@class="icon-new icon-white"]
${txt_categories_title}            xpath=//div[@class="control-group"]//div[@class="controls"]//input[@id="jform_title"]
${txt_categories_title_alias}      id=jform_alias
${txt_categories_cont}             xpath=//iframe[contains(@id,'jform_description_ifr')]
${btn_categories_save}             xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-apply btn-success"]
${btn_categories_save_close}       xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-save"]
${id_categories_txtbox_content}    id=tinymce  
${lbl_categories_tittle_count}     xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr/td//a[@class="hasTooltip"]
${lbl_categories_title}            xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr[last()]/td//a[@class="hasTooltip"]      
${select_categories_box}           xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr[last()]/td//input[@name="cid[]"]
${btn_categories_trash}            xpath=//button[@class="btn btn-small button-trash"]
${lbl_message}                     class=alert-message
${btn_categories_unpublish}        xpath=//button[@class="btn btn-small button-unpublish"]
   
btn_categories_add_new
*** Keywords ***
Go To Add New Category Page
    Select Sidebar Menu    ${lbl_categories}  
    
Add New Category
    [Arguments]	      ${arg_categories_title}            ${arg_categories_cont}    ${arg_alias}
    Click Element	  ${lbl_categories_new}
    Input Text	      ${txt_categories_title}            ${arg_categories_title}   
    Input Text        ${txt_categories_title_alias}      ${arg_alias} 
    Select Frame  	  ${txt_categories_cont} 
    Input Text        ${id_categories_txtbox_content}    ${arg_categories_cont}  
    Unselect Frame
    Click Button	  ${btn_categories_save_close}
    
Go To Edit Category Page
    Select Sidebar Menu    ${lbl_categories} 
    Click Element          ${lbl_categories_title}

Edit Category Information
    [Arguments]	      ${arg_categories_title_edit}       ${arg_categories_cont_edit}   
    Input Text	      ${txt_categories_title}            ${arg_categories_title_edit}
    Select Frame  	  ${txt_categories_cont} 
    Input Text        ${id_categories_txtbox_content}    ${arg_categories_cont_edit}  
    Unselect Frame          
    Click Button      ${btn_categories_save_close} 
    
Delete A Category 
    ${count_categories_post}            Get Element Count                   ${lbl_categories_tittle_count}
    Select Checkbox                                                         ${select_categories_box}
    Click Element                                                           ${btn_categories_trash}
    ${count_choosen_categories_post}    Get Element Count                   ${lbl_categories_tittle_count}
    ${count_left_categories_post}       Evaluate                            ${count_categories_post} - 1
    Should Be Equal                     ${count_choosen_categories_post}    ${count_left_categories_post}

Unpublish A Category
    Click Element     ${select_categories_box}
    Click Element     ${btn_categories_unpublish}

Check Message Successfully
    [Arguments]               ${arg_locator}    ${arg_expected}
    Element Text Should Be    ${arg_locator}    ${arg_expected}
