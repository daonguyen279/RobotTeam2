*** Settings ***
Resource          ../../Resources/SetupBuild2.robot
Resource          ../../Pages/VisualTests/AdminExtensionsModulesPage.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Resource          ../../Pages/Admin/AdminHomePage.robot
Suite Setup       Setup
Suite teardown    Teardown


*** Variables ***
${USERNAME}    admin
${PASSWORD}    123456789


*** Test Cases ***
TC01 - UI Of Banners Page Display Correctly
    Login Admin Site               ${USERNAME}    ${PASSWORD}
    Go To Banners Page
    Percy Snapshot                 Banners Page
    Go To Banners Content Pages    Categories
    Percy Snapshot                 Categories Banners Page
    Go To Banners Content Pages    Clients
    Percy Snapshot                 Clients Banners Page
    Go To Banners Content Pages    Tracks
    Percy Snapshot                 Tracks Banners Page
    Logout Admin Site