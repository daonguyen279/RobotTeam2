*** Settings ***
Resource    AdminHomePage.robot


*** Variables ***
${lnk_submenu_modules}    xpath=//ul[@id="menu"]//a[text()="Modules"]


*** Keywords ***
Go To Extensions Modules Page
    Click Element     ${menu_extension}
    Click Element     ${lnk_submenu_modules}