*** Settings ***
Resource          ../Resources/Setup.robot

*** Variables ***
${INPUT_STRING}        my name is*dinh*thi*anh*thao
${DELIMETER}           *
${DESTINATION_CHAR}    _


*** Test Cases ***
Example Keyword
    ${abc}=    Split Text      ${INPUT_STRING}    ${DELIMETER}
    ${xyz}=    Replace Text    ${INPUT_STRING}    ${DELIMETER}    ${DESTINATION_CHAR}

Example Keyword With Java
    ${abc}=    Split Text Example    ${INPUT_STRING}