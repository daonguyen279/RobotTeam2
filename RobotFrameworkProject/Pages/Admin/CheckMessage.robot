*** Variables ***
{txt_message}                xpath=//div[@class="alert-message"]


*** Keywords ***
Check message successfully
    [Arguments]          ${arg_expected}
    Should be equal      ${txt_message}     ${arg_expected}