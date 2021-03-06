*** Variables ***
# ---------- sidebar ----------
${title_homepage}                     Control Panel - RobotFramework - Administration
${lbl_new_article}                    xpath=//div[@class="span3"]//a[span[contains(text(), "New Article")]]
${lbl_articles}                       xpath=//div[@class="span3"]//a[span[contains(text(), "Articles")]]
${lbl_categories}                     xpath=//div[@class="span3"]//a[span[contains(text(), "Categories")]]
${lbl_menus}                          xpath=//div[@class="span3"]//a[span[contains(text(), "Menu(s)")]]
${lbl_users}                          xpath=//div[@class="span3"]//a[span[contains(text(), "Users")]]

# ---------- main menu ----------
${menu_system}                        xpath=//ul[@id="menu"]//a[text()="System "]
${submenu_control_panel}              xpath=//ul[@id="menu"]//a[@href="index.php"]
${menu_users}                         xpath=//ul[@id="menu"]//a[contains(text(), "Users ")]
${submenu_manage_users}               xpath=//ul[@id="menu"]//a[@class="dropdown-toggle menu-user"]
${menu_menus}                         xpath=//ul[@id="menu"]//a[contains(text(), "Menus ")]
${menu_extension}                     xpath=//ul[@id="menu"]//a[contains(text(), "Extensions ")]
${submenu_manage_extensions}          xpath=//ul[@id="menu"]//a[@class="dropdown-toggle menu-install"]
${submenu_templates}                  xpath=//ul[@id="menu"]//a[@class="dropdown-toggle menu-themes"]
${menu_components}                    xpath=//ul[@id="menu"]//a[contains(text(), "Components ")]
${submenu_banners}                    xpath=//ul[@id="menu"]//a[@class="dropdown-toggle menu-banners"]
${menu_content}                       xpath=//ul[@id="menu"]/li/a[contains(text(),"Content")]
${submenu_feature_artical_content}    xpath=//ul[@id="menu"]//a[@class="no-dropdown menu-featured"]
${submenu_manage_menus}               xpath=//ul[@id="menu"]//a[@class="dropdown-toggle menu-menumgr"]
${submenu_menu_item}                  xpath=//ul[@id="menu"]//a[@class="no-dropdown menu-allmenu"]

# ---------- top right menu ----------
${icn_user}                           xpath=//a/span[@class="icon-user"]
${lbl_user_information}               xpath=//ul[@class="nav nav-user pull-right nav-hover"]//strong
${lbl_edit_profile}                   xpath=//ul[@class="nav nav-user pull-right nav-hover"]//a[text()="Edit Account"]
${lbl_logout}                         xpath=//ul[@class="nav nav-user pull-right nav-hover"]//a[text()="Logout"]
${lbl_visit_site}                     xpath=//a[@class="brand visible-desktop visible-tablet"]
${hed_header_message}                 xpath=//div[@class="alert alert-success"]/h4[@class="alert-heading"]
${lbl_message}                        xpath=//div[@class="alert alert-success"]/div[@class="alert-message"]


*** Keywords ***
Select Main Menu
    [Arguments]      ${arg_menu_item}        ${arg_sub_menu_item}
    Click Element    ${arg_menu_item}
    Click Element    ${arg_sub_menu_item}    
    
Select Sidebar Menu
    [Arguments]      ${arg_page}
    Click Element    ${arg_page}

Logout Admin Site
    Click Element                    ${icn_user}
    Wait Until Element Is Visible    ${lbl_logout}
    Click Element                    ${lbl_logout}

Check Message 
    [Arguments]                      ${arg_expected_message}
    Wait Until Element Is Visible    ${hed_header_message}
    Element Text Should Be           ${hed_header_message}      Message
    Element Text Should Be           ${lbl_message}             ${arg_expected_message}