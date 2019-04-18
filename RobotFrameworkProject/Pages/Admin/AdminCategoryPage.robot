*** Variables ***
# ---------- categories ----------
${lbl_categories}                     xpath=//div[@class="span3"]//a[span[contains(text(), "Categories")]]
${lbl_new_categories}                 xpath=//div[@class="btn-wrapper"]//button//span[@class="icon-new icon-white"]
${txt_title_categories}               xpath=//div[@class="control-group"]//div[@class="controls"]//input[@id="jform_title"]
${txt_cont_categories}                xpath=//iframe[contains(@id,'jform_description_ifr')]
${btn_save_categories}                xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-apply btn-success"]
${btn_save_close_categories}          xpath=//div[@class="btn-toolbar"]//div[@class="btn-wrapper"]//button[@class="btn btn-small button-save"]
${id}                                 id=tinymce  
${lbl_title_categories}               xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr[last()]/td//a[@class="hasTooltip"]      
${select_box_categories}              xpath=//table[@id="categoryList"]/tbody[@class="ui-sortable"]/tr[last()]/td//input[@id="cb1"]
${btn_trash_categories}               xpath=//button[@class="btn btn-small button-trash"]
${hed_headermessage}                  xpath=//h4[@class="alert-heading"]
${lbl_message}                        xpath=//div[@class="alert-message"]
${btn_unpublish_categories}           xpath=//button[@class="btn btn-small button-unpublish"]

*** Settings ***
Resource	../../Resources/Setup.robot
Resource    AdminHomePage.robot


*** Keywords ***
Add New Category
    [Arguments]	            ${arg_title_categories}        ${arg_cont_categories}
    Log To Console          Login to Joomla
    Click Element    	    ${lbl_categories}
    Click Element	        ${lbl_new_categories}
    Input Text	            ${txt_title_categories}        ${arg_title_categories}
    select frame  	        ${txt_cont_categories} 
    input text              ${id}                          ${arg_cont_categories}  
    Unselect Frame          
    Click Button	        ${btn_save_close_categories}  
    
Edit Category Information
    [Arguments]	            ${arg_title_categories_edit}        ${arg_cont_categories_edit}
    Log To Console          Login to Joomla
    Click Element    	    ${lbl_categories}
    Click Element           ${lbl_title_categories}
    Input Text	            ${txt_title_categories}        ${arg_title_categories_edit}
    select frame  	        ${txt_cont_categories} 
    input text              ${id}                          ${arg_cont_categories_edit}  
    Unselect Frame          
    Click Button	        ${btn_save_close_categories} 
    
Delete a category 
    Log To Console          Login to Joomla
    Click Element    	    ${lbl_categories}
    Click Element           ${select_box_categories}
    Click Element           ${btn_trash_categories}
    
Unpublish a category
    Log To Console          Login to Joomla
    Click Element    	    ${lbl_categories}
    Click Element           ${select_box_categories}
    Click Element           ${btn_unpublish_categories}
   
Check message successfully
    Element Text Should Be    ${hed_headermessage}     Message 
    Element Text Should Be    ${lbl_message}           Category saved.
    
    