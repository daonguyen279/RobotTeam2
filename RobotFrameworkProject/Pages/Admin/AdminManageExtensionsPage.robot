*** Settings ***
Resource    AdminHomePage.robot


*** Variables ***
#xpath templates
${xph_extensions_page}    xpath=//ul[@id="submenu"]/li/a[contains(text(),"{}")]

*** Keywords ***
Go To Manage Extensions Install page 
    Click Element     ${menu_extension}  
    Click Element     ${submenu_manage_extensions} 

Go to Manage Etensions 
    [Arguments]           ${arg_extension_page}
    ${extensions_page}    Format String           ${xph_extensions_page}    ${arg_extension_page} 
    Click Element         ${extensions_page}