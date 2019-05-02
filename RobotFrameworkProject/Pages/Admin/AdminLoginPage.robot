*** Variables ***
${txt_username}           id=mod-login-username
${txt_password}           id=mod-login-password
${btn_login}              xpath=//div[@class="btn-group"]/button[@class="btn btn-primary btn-block btn-large login-button"]
${lbl_warning_header}     xpath=//div[@class="login well"]/div[@id="system-message-container"]/div[@class="alert "]/h4[@class="alert-heading"]
${lbl_warning_message}    xpath=//div[@class="login well"]/div[@id="system-message-container"]/div[@class="alert "]/div[@class="alert-message"]


*** Keywords ***
Login Admin Site
    [Arguments]       ${arg_username}    ${arg_password}
    Log To Console    Login to Joomla    
    Input Text        ${txt_username}    ${arg_username}
    Input Text        ${txt_password}    ${arg_password}
    Click Button      ${btn_login}
    
Login With Invalid Credentials Should Fail
    [Arguments]                 ${arg_invalid_username}    ${arg_invalid_password}    ${arg_error_message}
    Login Admin Site            ${arg_invalid_username}    ${arg_invalid_password}
    Login Should Have Failed    ${arg_error_message}

Login Should Have Failed
    [Arguments]               ${arg_message}
    Element Text Should Be    ${lbl_warning_header}     ${HEADER_TEXT}
    Element Text Should Be    ${lbl_warning_message}    ${arg_message}