*** Settings ***
Resource         ../Resources/Setup.robot
Resource         ../Pages/Admin/AdminLoginPage.robot
Resource         ../Pages/Admin/AdminUserPage.robot
Suite setup       Setup
# Suite teardown    Teardown


*** Variables ***
${NEWPASSWORD}     123456789
${EDITPASSWORD}    123123123
${TAILEMAIL}       @gmail.com


*** Test Cases ***
Add New Valid User Account
    Login Admin Site                             ${USERNAME}                   ${PASSWORD}
    Go To Add New User Page
    ${NEWUSERNAME}=                              Generate Random String        10    [LETTERS]
    ${NEWEMAIL}    Set Variable                  ${NEWUSERNAME}${TAILEMAIL}
    Set Suite Variable                           ${NEWEMAIL}
    Fill Out And Submit Information              ${NEWUSERNAME}                ${NEWPASSWORD}     ${NEWEMAIL}
    Check Add And Edit User Successfully         ${NEWEMAIL}                   ${NEWUSERNAME}
    Check Relogin Successfully After Modified    ${NEWUSERNAME}                ${NEWPASSWORD}
    Clean Up For User Test
    
Edit User Account Valid Information
    Login Admin Site                             ${USERNAME}                    ${PASSWORD}
    Go To Edit User Account Page                 ${NEWEMAIL}
    ${EDITUSERNAME}=                             Generate Random String         10    [LETTERS]
    ${EDITEMAIL}    Set Variable                 ${EDITUSERNAME}${TAILEMAIL}
    Set Suite Variable                           ${EDITEMAIL}
    Fill Out And Submit Information              ${EDITUSERNAME}                ${EDITPASSWORD}    ${EDITEMAIL}
    Check Add And Edit User Successfully         ${EDITEMAIL}                   ${EDITUSERNAME}
    Check Relogin Successfully After Modified    ${EDITUSERNAME}                ${EDITPASSWORD}
    Clean Up For User Test

Delete User
    Login Admin Site                  ${USERNAME}     ${PASSWORD}
    Select Sidebar Menu               ${lbl_users}
    Delete Selected User              ${EDITEMAIL}
    Check Delete User Successfully
    

    