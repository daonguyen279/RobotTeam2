*** Settings ***
Resource          ../../Resources/Setup.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Suite Setup       Setup
Suite teardown    Teardown       


*** Test Cases ***
TC01 - UI Of Login
    Percy Snapshot      Login