*** Settings ***
Resource	../../Resources/Setup.robot
Resource	../../Pages/LoginPage.robot

*** Variables ***
${txt_username}      id=mod-login-username
${txt_password}      id=mod-login-password
${btn_login}         id=//div[@class="btn-group"]/button


*** Keywords ***
Login To Joomla
    [Arguments]                         ${arg_username}       ${arg_password}
    Log To Console                      Login to Joomla
    Wait Until Page Contains Element	${btn_login}
    Input Text    	                    ${txt_username}       ${arg_username}
    Input Text                          ${txt_password}       ${arg_password}
    Click Button                        ${btn_login}