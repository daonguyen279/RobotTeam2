*** Settings ***
Resource          ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminHomePage.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Resource          ../Pages/Admin/AdminUserPage.robot
Suite setup       Setup
Suite teardown    Teardown


*** Test Cases ***
TC20 - Test Visual For Login Page
    Percy Snapshot    Login