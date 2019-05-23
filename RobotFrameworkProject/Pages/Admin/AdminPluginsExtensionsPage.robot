*** Settings ***
Resource    AdminHomePage.robot


*** Variables ***
${lnk_joomla_plugins_extensions}     xpath=//div/ul[@id="menu"]/li/ul/li/a[contains(text(),'Plugins')]


*** Keywords ***
Go To Joomla Plugins Extentions Page
    Click Element    ${menu_extension}
    Click Element    ${lnk_joomla_plugins_extensions}

    