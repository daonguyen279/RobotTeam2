*** Settings ***
Resource    ../../Pages/Admin/AdminHomePage.robot


*** Variables ***
${txt_update_name}                xpath=//form[@id="profile-form"]/div/div/div[@class="control-group"]/div[@class="controls"]/input[@id="jform_name"]
${txt_update_password}            xpath=//form[@id="profile-form"]/div/div/div[@class="control-group"]/div[@class="controls"]/input[@id="jform_password2"]
${txt_update_confirm_password}    xpath=//form[@id="profile-form"]/div/div/div[@class="control-group"]/div[@class="controls"]/input[@id="jform_password"]
${txt_update_email}               xpath=//form[@id="profile-form"]/div/div/div[@class="control-group"]/div[@class="controls"]/input[@id="jform_email"]
${btn_update_save}                xpath=//div[@id="toolbar-save"]/button


*** Keywords ***
Go To Admin Profile Page
    Click element                    ${icn_user}
    Wait Until Element Is Visible    ${lbl_edit_profile}
    Click Element                    ${lbl_edit_profile}

Fill Out And Submit Update Information
    [Arguments]     ${arg_update_name}                ${arg_update_password}            ${arg_update_confirm_password}    ${arg_update_email}
    Input Text      ${txt_update_name}                ${arg_update_name}
    Input Text      ${txt_update_password}            ${arg_update_password}
    Input Text      ${txt_update_confirm_password}    ${arg_update_confirm_password}    
    Input Text      ${txt_update_email}               ${arg_update_email}
    Click Button    ${btn_update_save}