*** Variables ***
${menu_extensions}    xpath=//ul[@id="menu"]//a[text()="Extensions "]
${submenu_modules}    xpath=//ul[@id="menu"]//a[text()="Modules"]


*** Keywords ***
Go To Extensions Modules Page
    Click Element     ${menu_extensions}
    Click Element     ${submenu_modules}