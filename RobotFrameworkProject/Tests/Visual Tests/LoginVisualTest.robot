*** Settings ***
Resource          ../../Resources/Setup.robot
Suite Setup       Setup
Suite teardown    Teardown       


*** Test Cases ***
TC01 - UI Of Login Page Display Correctly
    Go To    http://localhost/joomla/administrator/
    Percy Snapshot      Login2