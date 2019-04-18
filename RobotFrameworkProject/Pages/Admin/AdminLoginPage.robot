*** Settings ***
Resource	../../Resources/Setup.robot


*** Variables ***
${txt_username}      id=mod-login-username
${txt_password}      id=mod-login-password
${btn_login}         xpath=//div[@class="btn-group"]/button[@class="btn btn-primary btn-block btn-large login-button"]


*** Keywords ***
Login To Joomla
    [Arguments]                         ${arg_username}       ${arg_password}
    Log To Console                      Login to Joomla    
    Input Text    	                    ${txt_username}       ${arg_username}
    Input Text                          ${txt_password}       ${arg_password}
    Wait Until Page Contains Element	${btn_login}
    Click Button                        ${btn_login}