*** Settings ***
Resource	../../Resources/Setup.robot
Resource	../../Pages/AdminHomePage.robot


*** Keywords ***
Logout
    Click Element                    ${icn_user}
    Wait Until Element Is Visible    ${lbl_logout}
    Click Element                    ${lbl_logout}