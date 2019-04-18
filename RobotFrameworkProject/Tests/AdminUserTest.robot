*** Settings ***
Resource         ../Resources/Setup.robot
Resource         ../Pages/Admin/AdminLoginPage.robot
Resource         ../Pages/Admin/AdminUserPage.robot
Resource         ../Pages/Client/ClientHomePage.robot
Suite setup       Setup
Suite teardown    Teardown


*** Variables ***
${NEWPASSWORD}    123456789


*** Test Cases ***
Add New Valid User
    Login To Joomla         ${USERNAME}      ${PASSWORD}
    Select Sidebar Menu     ${lbl_users}
    ${NEWNAME}=    Generate Random String    10    [LETTERS]
    Add New User Account    ${NEWNAME}       ${NEWNAME}    ${NEWPASSWORD}    ${NEWNAME}@gmail.com
    Check Add New User Successfully
    Go To                   ${CLIENT_ROOT}
    Login To Client Site    ${NEWNAME}       ${NEWPASSWORD}
    Check Login To Client Successfully       ${NEWNAME}
    