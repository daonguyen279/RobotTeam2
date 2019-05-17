*** Settings ***
Resource          ../../Resources/Setup.robot

*** Variables ***
${INPUT_STRING}        my name is*dinh*thi*anh*thao
${DELIMETER}           *
${DESTINATION_CHAR}    _
${NAME}                Dong
${MSG}                 Good Afternoon
${STR1}                a b c a b h d d h s d a j a i a
${STR2}                a


*** Test Cases ***
Keyword Slipt Text And Replace Text
    ${abc}=    Split Text      ${INPUT_STRING}    ${DELIMETER}
    ${xyz}=    Replace Text    ${INPUT_STRING}    ${DELIMETER}    ${DESTINATION_CHAR}

Keyword Greet Method
    ${xyz}=    GREET    ${NAME}    ${MSG}


Keyword Count Method
    ${result}=    Count Number    ${STR1}    ${STR2}