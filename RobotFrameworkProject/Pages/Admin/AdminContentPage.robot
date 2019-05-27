*** Settings ***
Resource    AdminHomePage.robot


*** Variables ***
#xpath templates
${xph_content_page}    xpath=//ul[@id="submenu"]/li/a[contains(text(),"{}")]

*** Keywords ***
Go To Content Feature Artical Page 
    Click Element     ${menu_content} 
    Click Element     ${submenu_feature_artical_content} 

Go to Content Pages 
    [Arguments]        ${arg_content_page}
    ${content_page}    Format String           ${xph_content_page}    ${arg_content_page} 
    Click Element      ${content_page}