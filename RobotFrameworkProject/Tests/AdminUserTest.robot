*** Settings ***
Resource          ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminHomePage.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Resource          ../Pages/Admin/AdminUserPage.robot
Suite setup       Setup
Suite teardown    Teardown


*** Variables ***
${NEW_PASSWORD}      123456789
${EDIT_PASSWORD}     123123123
${TAIL_EMAIL}        @gmail.com
${MESSAGE_NEW}       User saved.
${MESSAGE_DELETE}    1 user deleted.


*** Test Cases ***
TC09 - Add New Valid User Account
    ${NEW_USERNAME}=    Generate Random String    10                              [LETTERS]
    ${NEW_EMAIL}        Set Variable              ${NEW_USERNAME}${TAIL_EMAIL}
    Login Admin Site                              ${USERNAME}                     ${PASSWORD}
    Go To Add User Page
    Fill Out And Submit Information               ${NEW_USERNAME}                 ${NEW_PASSWORD}    ${NEW_EMAIL}
    Check Message                                 ${MESSAGE_NEW}
    Check Information Displayed Correctly         ${NEW_EMAIL}                    ${NEW_USERNAME}
    Check Relogin Successfully After Modified     ${NEW_USERNAME}                 ${NEW_PASSWORD}
    Clean Up After Test                           ${NEW_EMAIL}
    
TC10 - Edit User Account Valid Information
    ${NEW_USERNAME}=     Generate Random String    10                               [LETTERS]
    ${NEW_EMAIL}         Set Variable              ${NEW_USERNAME}${TAIL_EMAIL}
    ${EDIT_USERNAME}=    Generate Random String    10                               [LETTERS]
    ${EDIT_EMAIL}        Set Variable              ${EDIT_USERNAME}${TAIL_EMAIL}
    Login Admin Site                               ${USERNAME}                      ${PASSWORD}
    Go To Add User Page
    Fill Out And Submit Information                ${NEW_USERNAME}                  ${NEW_PASSWORD}     ${NEW_EMAIL}
    Go To Edit User Page                           ${NEW_EMAIL}
    Fill Out And Submit Information                ${EDIT_USERNAME}                 ${EDIT_PASSWORD}    ${EDIT_EMAIL}
    Check Message                                  ${MESSAGE_NEW}
    Check Information Displayed Correctly          ${EDIT_EMAIL}                    ${EDIT_USERNAME}
    Check Relogin Successfully After Modified      ${EDIT_USERNAME}                 ${EDIT_PASSWORD}
    Clean Up After Test                            ${EDIT_EMAIL}

TC11 - Delete User
    ${NEW_USERNAME}=    Generate Random String    10                              [LETTERS]
    ${NEW_EMAIL}        Set Variable              ${NEW_USERNAME}${TAIL_EMAIL}
    Login Admin Site                              ${USERNAME}                     ${PASSWORD}
    Go To Add User Page
    Fill Out And Submit Information               ${NEW_USERNAME}                 ${NEW_PASSWORD}    ${NEW_EMAIL}
    Delete Selected User                          ${NEW_EMAIL}
    Check Message                                 ${MESSAGE_DELETE}
    Check Delete User Successfully                ${NEW_EMAIL}
    Logout Admin Site