*** Variables ***
${txt_client_login_username}    id=modlgn-username
${txt_client_login_password}    id=modlgn-passwd
${chb_client_login_checkout}    id=modlgn-remember
${btn_client_login_button}      xpath=//div[@id="form-login-submit"]//button[@class="btn btn-primary login-button"]
${lbl_client_grreeting}         xpath=//form[@id="login-form"]/div[@class="login-greeting"]
${lbl_client_logout_button}     xpath=//form[@id="login-form"]/div[@class="logout-button"]/input[@name="Submit"][@value="Log out"]


*** Keywords ***
Login Client Site
    [Arguments]        ${arg_client_username}          ${arg_client_password}
    Input Text         ${txt_client_login_username}    ${arg_client_username}
    Input Text         ${txt_client_login_password}    ${arg_client_password}
    Select Checkbox    ${chb_client_login_checkout}
    Click Button       ${btn_client_login_button}
    
Check Login To Client Successfully
    [Arguments]                  ${arg_client_greeting}
    Element Should Contain       ${lbl_client_grreeting}        ${arg_client_greeting}
    Element Should Be Visible    ${lbl_client_logout_button}
    
Logout Client Site
    Click Element    ${lbl_client_logout_button}