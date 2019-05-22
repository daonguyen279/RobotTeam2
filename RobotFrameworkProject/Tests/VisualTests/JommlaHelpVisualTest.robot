*** Settings ***
Resource          ../../Resources/SetupBuild2.robot
Resource          ../../Pages/VisualTest/JoomlaHelpPage.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Suite Setup       Setup
Suite teardown    Teardown       


*** Test Cases ***
TC01 - UI Of Joomla Help Page Display Correctly   
    Percy Snapshot                Login
    Login Admin Site              ${USERNAME}    ${PASSWORD}
    Go To Joomla Help Page
    Percy Snapshot                Articles