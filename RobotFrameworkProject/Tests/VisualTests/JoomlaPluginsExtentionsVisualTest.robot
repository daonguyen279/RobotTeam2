*** Settings ***
Resource          ../../Resources/SetupBUild2.robot
Resource          ../../Pages/VisualTest/JoomlaPluginsExtentionsPage.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Suite Setup       Setup
Suite teardown    Teardown       


*** Test Cases ***
TC01 - UI Of Joomla Plugins Extentions Page Display Correctly   
    Login Admin Site                        ${USERNAME}    ${PASSWORD}
    Go To Joomla Plugins Extentions Page
    Percy Snapshot                          Categories