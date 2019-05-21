*** Settings ***
Resource          ../../Resources/SetupBuild2.robot
Resource          ../../Pages/Admin/AdminArticlePage.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Suite Setup       Setup
Suite teardown    Teardown       


*** Test Cases ***
TC01 - UI Of Article Page Display Correctly   
    Login Admin Site              ${USERNAME}    ${PASSWORD}
    Go To Articles Page     
    Percy Snapshot                Articles