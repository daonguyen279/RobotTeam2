*** Settings ***
Resource          ../../Resources/SetupBuild2.robot
Resource          ../../Pages/VisualTest/AdminExtensionsModulesPage.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Resource          ../../Pages/Admin/AdminHomePage.robot
Suite Setup       Setup
Suite teardown    Teardown


*** Variables ***
${USERNAME}    admin
${PASSWORD}    123456789


*** Test Cases ***
TC30 - UI Of Modules Page Display Correctly
    Login Admin Site                 ${USERNAME}    ${PASSWORD}
    Go To Extensions Modules Page
    Percy Snapshot                   Modules Page
    Logout Admin Site