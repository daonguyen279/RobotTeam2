*** Variables ***
${BROWSER}    Chrome
${ROOT}       http://192.168.190.167/joomla/administrator 


*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
   

*** Keywords ***
Setup    
    ${PATH}=                          Normalize Path    path	     ../Resources/chromedriver.exe
    Log To Console                    ${PATH}   
    Append To Environment Variable    ${PATH}           ${PATH}
    Open browser                      ${ROOT}           ${BROWSER}
    Maximize Browser Window

Teardown    
    Close all browsers
