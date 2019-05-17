*** Variables ***
${BROWSER}        Chrome
${ROOT}           http://192.168.189.72/joomla/administrator/
${ROOT_2}         http://localhost/joomla/administrator/
${CLIENT_ROOT}    http://192.168.189.72/joomla/
${USERNAME}       admin
${PASSWORD}       123456789
${PERCY_TOKEN}    917995d3f030d3fb098175c47c2a8cb70b6407cf8785357bca2e72477f7c82b8

*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    pabot.PabotLib
Library    Percy.py

*** Keywords ***
Setup    
    Append To Environment Variable    PATH                ${CURDIR}/Drivers
    Open browser                      ${ROOT}             ${BROWSER}
    Maximize Browser Window
    Percy Initialize Build            ${PERCY_TOKEN}
    
Teardown    
    Close all browsers
    Percy Finalize Build