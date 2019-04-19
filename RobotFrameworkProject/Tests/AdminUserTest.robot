*** Settings ***
Resource         ../Resources/Setup.robot
Resource         ../Pages/Admin/AdminLoginPage.robot
Resource         ../Pages/Admin/AdminUserPage.robot
Suite setup       Setup
# Suite teardown    Teardown


*** Variables ***
${NEWPASSWORD}    123456789
${EDITPASSWORD}    123123123


*** Test Cases ***
Add New Valid User Account
    Login Admin Site                             ${USERNAME}               ${PASSWORD}
    Go To Add New User Page
    ${NEWUSERNAME}=                              Generate Random String    10    [LETTERS]
    Set Suite Variable                           ${NEWUSERNAME}
    Add New User Account                         ${NEWUSERNAME}            ${NEWPASSWORD}
    Check Add And Edit User Successfully         ${NEWUSERNAME}
    Check Relogin Successfully After Modified    ${NEWUSERNAME}            ${NEWPASSWORD}
    Clean Up For User Test
    
Edit User Account Valid Information
    Login Admin Site                             ${USERNAME}               ${PASSWORD}
    Select Sidebar Menu                          ${lbl_users}
    Go To Edit User Account Page                 ${NEWUSERNAME}
    ${EDITUSERNAME}=                             Generate Random String    10    [LETTERS]
    Edit User Account Information                ${EDITUSERNAME}           ${EDITPASSWORD}
    Check Add And Edit User Successfully         ${EDITUSERNAME}
    Check Relogin Successfully After Modified    ${EDITUSERNAME}           ${EDITPASSWORD}
    Clean Up For User Test

Delete User
    