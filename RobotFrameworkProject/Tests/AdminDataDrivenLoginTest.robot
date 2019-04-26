*** Settings ***
Resource          ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Suite setup       Setup
Suite teardown    Teardown
Test Template     Login With Invalid Credentials Should Fail


*** Variables ***
${EMPTY}    
${INVALID_USERNAME}                abcd123
${INVALID_PASSWORD}                zxcvbnm
${HEADER_TEXT}                     Warning
${ERROR_MESSAGE}                   Username and password do not match or you do not have an account yet.
${ERROR_EMPTY_PASSWORD_MESSAGE}    Empty password not allowed.


*** Test Cases ***                      USERNAME               PASSWORD               MESSAGE
TC18 - Empty Username                   ${EMPTY}               ${PASSWORD}            ${ERROR_MESSAGE}
TC19 - Empty Password                   ${USERNAME}            ${EMPTY}               ${ERROR_EMPTY_PASSWORD_MESSAGE}
TC20 - Empty Username And Password      ${EMPTY}               ${EMPTY}               ${ERROR_EMPTY_PASSWORD_MESSAGE}
TC21 - Invalid Username                 ${INVALID_USERNAME}    ${PASSWORD}            ${ERROR_MESSAGE}
TC22 - Invalid Password                 ${USERNAME}            ${INVALID_PASSWORD}    ${ERROR_MESSAGE}
TC23 - Invalid Username And Password    ${INVALID_USERNAME}    ${INVALID_PASSWORD}    ${ERROR_MESSAGE}
    
    
*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]                 ${arg_invalid_username}    ${arg_invalid_password}    ${arg_error_message}
    Login Admin Site            ${arg_invalid_username}    ${arg_invalid_password}
    Login Should Have Failed    ${arg_error_message}

Login Should Have Failed
    [Arguments]               ${arg_message}
    Element Text Should Be    ${lbl_warning_header}     ${HEADER_TEXT}
    Element Text Should Be    ${lbl_warning_message}    ${arg_message}