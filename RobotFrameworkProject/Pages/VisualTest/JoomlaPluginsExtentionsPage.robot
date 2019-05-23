*** Variables ***
${lnk_menu_extentions}               xpath=//div/ul[@id="menu"]/li/a[contains(text(),'Extensions ')]
${lnk_joomla_plugins_extentions}     xpath=//div/ul[@id="menu"]/li/ul/li/a[contains(text(),'Plugins')]


*** Keywords ***
Go To Joomla Plugins Extentions Page
    Click Element    ${lnk_menu_extentions}
    Click Element    ${lnk_joomla_plugins_extentions}

    