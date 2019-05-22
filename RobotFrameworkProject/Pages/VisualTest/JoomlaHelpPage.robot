*** Variables ***
${lnk_menu_help}       xpath=//div/ul[@id="menu"]/li/a[contains(text(),'Help')]
${lnk_joomla_help}     xpath=//div/ul[@id="menu"]/li/ul/li/a[contains(text(),'Joomla! Help')]


*** Keywords ***
Go To Joomla Help Page
    Click Element    ${lnk_menu_help}
    Click Element    ${lnk_joomla_help}

    