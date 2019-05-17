*** Settings ***
Resource          ../../Resources/Setup.robot
Suite setup       Setup
Suite teardown    Teardown


*** Test Cases ***
TC20 - Test Visual For Login Page
    Percy Snapshot    Login