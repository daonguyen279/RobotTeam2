*** Settings ***
Resource          ../../Resources/Setup.robot
Resource          ../../Pages/Admin/AdminHomePage.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Suite Setup       Setup
Suite teardown    Teardown       


*** Test Cases ***
TC01 - UI Of Login Page Display Correctly   
    Percy Snapshot         LoginBuild1