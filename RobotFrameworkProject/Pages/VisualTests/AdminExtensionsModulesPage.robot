*** Settings ***
Resource    ../Admin/AdminHomePage.robot


*** Variables ***
${lnk_components_categories}    xpath=//ul[@id="submenu"]//a[contains(text(), "Categories")]
${lnk_components_clients}       xpath=//ul[@id="submenu"]//a[contains(text(), "Clients")]
${lnk_components_tracks}        xpath=//ul[@id="submenu"]//a[contains(text(), "Tracks")]

# xpath template
${xph_banners}       xpath=//ul[@id="submenu"]//a[contains(text(), "{}")]


*** Keywords ***
Go To Banners Page
    Click Element    ${menu_components}
    Click Element    ${submenu_banners}
    
Go To Banners Content Pages
    [Arguments]        ${arg_banners}
    ${banners_page}    Format String           ${xph_banners}    ${arg_banners} 
    Click Element      ${banners_page}