*** Settings ***
Resource	../../Resources/Setup.robot
Resource    ../../Pages/Admin/AdminHomePage.robot
Resource    ../../Resources/CommomKeyword/Login.robot

*** Variables ***
${txt_title}      xpath=//div[@class="controls"]/input[@id="jform_title"]
${txt_content}    xpath=//*[@id="mceu_93"]
${btn_save}       xpath=//div[@id="toolbar-save"]/button

*** Keywords ***
Add New Article
    [Arguments]       ${arg_title}    ${arg_content}
    Log To Console    Add new article
    Login to Joomla   ${USERNAME}            ${PASSWORD}
    Click Element     ${lbl_new_article} 
    Input text        ${txt_title}    ${arg_title}
    Input text        ${txt_content}    ${arg_content}
    Click Button      ${btn_save}
    