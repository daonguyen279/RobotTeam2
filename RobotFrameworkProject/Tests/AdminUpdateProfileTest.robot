*** Settings ***
Resource	      ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Resource          ../Pages/Admin/AdminProfilePage.robot
Resource          ../Pages/Admin/AdminHomePage.robot
Suite setup	      Setup
Suite teardown    Teardown


*** Variables ***
${USERNAME1}	      hihi
${PASSWORD1}          123456789
${UPDATE_NAME}        dao nguyen
${UPDATE_PASSWORD}    1234567890


*** Test Cases ***
TC13 - Update Admin Profile Successfully
    Login Admin Site                          ${USERNAME1}      ${PASSWORD1}
    Go To Admin Profile Page  
    ${RANEMIAL}=    Generate Random String    4                 [LETTERS]   
    Fill Out And Submit Update Information    ${UPDATE_NAME}    ${UPDATE_PASSWORD}    ${UPDATE_PASSWORD}    ${RANEMIAL}@sharklasers.com              
    Check Message                             Item saved.
    Logout Admin Site   
    Login Admin Site                          ${USERNAME1}      ${UPDATE_PASSWORD}      
    Go To Admin Profile Page 
    Fill Out And Submit Update Information    ${UPDATE_NAME}    ${PASSWORD1}          ${PASSWORD1}          ${RANEMIAL}@gmail.com            
    