*** Settings ***
Resource          ../../Resources/Setup.robot
Resource          ../../Pages/Admin/AdminHomePage.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Suite Setup       Setup
Suite teardown    Teardown       


*** Test Cases ***
TC01 - UI Of Login Page Display Correctly
    Go To           http://192.168.189.72/joomla_build2/administrator
    Login Admin Site       ${USERNAME}        ${PASSWORD}
    Select Sidebar Menu    ${lbl_articles}    
    Percy Snapshot         Article Build 2