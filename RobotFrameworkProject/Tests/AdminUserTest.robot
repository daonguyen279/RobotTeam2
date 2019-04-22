*** Settings ***
Resource          ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Resource          ../Pages/Admin/AdminUserPage.robot
Suite setup       Setup
Suite teardown    Teardown


*** Variables ***
${NEW_PASSWORD}     123456789
${EDIT_PASSWORD}    123123123
${TAIL_EMAIL}       @gmail.com


*** Test Cases ***
Add New Valid User Account
    Login Admin Site                             ${USERNAME}                    ${PASSWORD}
    Go To Add New User Page
    ${NEW_USERNAME}=                             Generate Random String         10    [LETTERS]
    ${NEW_EMAIL}    Set Variable                 ${NEW_USERNAME}${TAIL_EMAIL}
    Set Suite Variable                           ${NEW_EMAIL}
    Fill Out And Submit Information              ${NEW_USERNAME}                ${NEW_PASSWORD}    ${NEW_EMAIL}
    Check Information Displayed Correctly        ${NEW_EMAIL}                   ${NEW_USERNAME}
    Check Relogin Successfully After Modified    ${NEW_USERNAME}                ${NEW_PASSWORD}
    Clean Up For Add And Edit User
    
Edit User Account Valid Information
    Login Admin Site                             ${USERNAME}                     ${PASSWORD}
    Go To Edit User Account Page                 ${NEWEMAIL}
    ${EDIT_USERNAME}=                            Generate Random String          10    [LETTERS]
    ${EDIT_EMAIL}    Set Variable                ${EDIT_USERNAME}${TAIL_EMAIL}
    Set Suite Variable                           ${EDIT_EMAIL}
    Fill Out And Submit Information              ${EDIT_USERNAME}                ${EDIT_PASSWORD}    ${EDIT_EMAIL}
    Check Information Displayed Correctly        ${EDIT_EMAIL}                   ${EDIT_USERNAME}
    Check Relogin Successfully After Modified    ${EDIT_USERNAME}                ${EDIT_PASSWORD}
    Clean Up For Add And Edit User

Delete User
    Login Admin Site                  ${USERNAME}     ${PASSWORD}
    Select Sidebar Menu               ${lbl_users}
    Delete Selected User              ${EDIT_EMAIL}
    Check Delete User Successfully