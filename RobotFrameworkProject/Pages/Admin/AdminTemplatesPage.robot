*** Settings ***
Resource    AdminHomePage.robot


*** Variables ***
#xpath templates
${xph_templates_page}    xpath=//ul[@id="submenu"]/li/a[contains(text(),"{}")]

*** Keywords ***
Go To Templates page 
    Click Element     ${menu_extension}  
    Click Element     ${submenu_templates} 

Go To Templates Extensions Page 
    [Arguments]           ${arg_template_page}
    ${templates_page}     Format String           ${xph_templates_page}    ${arg_template_page} 
    Click Element         ${templates_page}