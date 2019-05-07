*** Settings ***
Resource    ../../Pages/Admin/AdminHomePage.robot
Resource    ../../Pages/Client/ClientHomePage.robot


*** Variables ***
${btn_users_new}                 xpath=//button[@onclick="Joomla.submitbutton('user.add');"]
${btn_users_edit}                xpath=//div[@id="toolbar-edit"]/button
${btn_users_active}              xpath=//div[@id="toolbar-publish"]/button
${btn_users_blobk}               xpath=//div[@id="toolbar-unpublish"]/button
${btn_users_unblock}             xpath=//div[@id="toolbar-unblock"]/button
${btn_users_delete}              xpath=//div[@id="toolbar-delete"]/button
${txt_users_name}                xpath=//form[@id="user-form"]//input[@id="jform_name"]
${txt_users_username}            xpath=//form[@id="user-form"]//input[@id="jform_username"]
${txt_users_password}            xpath=//form[@id="user-form"]//input[@id="jform_password"]
${txt_users_confirm_password}	 xpath=//form[@id="user-form"]//input[@id="jform_password2"]
${txt_users_email}               xpath=//form[@id="user-form"]//input[@id="jform_email"]
${btn_users_save}                xpath=//button[@onclick="Joomla.submitbutton('user.apply');"]
${btn_users_save_and_close}      xpath=//button[@onclick="Joomla.submitbutton('user.save');"]
${btn_users_save_and_new}        xpath=//button[@onclick="Joomla.submitbutton('user.save2new');"]
${btn_users_cancel_and_close}    xpath=//button[@onclick="Joomla.submitbutton('user.cancel');"]
${cbb_users_order}               xpath=//div[@id="list_fullordering_chzn"]/a[@class="chzn-single"]
${opt_users_order}               xpath=//div[@id="list_fullordering_chzn"]//ul[@class="chzn-results"]/li[text()="ID descending"]

# xpath template
${xph_users_lnk_user_name}        xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "{}")]]//div[@class="name break-word"]/a
${xph_users_name}                 xpath=//table[@id="userList"]//a[contains(text(),"{}")]
${xph_users_username}             xpath=//table[@id="userList"]//td[@class="break-word" and contains(text(),"{}")]
${xph_users_email}                xpath=//table[@id="userList"]//td[@class="hidden-phone break-word hidden-tablet" and contains(text(),"{}")]
${xph_users_chb_selected_user}    xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "{}")]]//input
${xph_users_selected_user}        xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "{}")]]


*** Keywords ***
Go To Add User Page
    Select Sidebar Menu    ${lbl_users}
    Click Button           ${btn_users_new}

Go To Edit User Page
    [Arguments]                         ${arg_account}
    ${seleted_user}    Format String    ${xph_users_lnk_user_name}    ${arg_account}
    Click Element                       ${cbb_users_order}
    Click Element                       ${opt_users_order}
    Click Element                       ${seleted_user}

Fill Out And Submit Information
    [Arguments]     ${arg_users_name}                ${arg_users_password}    ${arg_users_email}
    Input Text      ${txt_users_name}                ${arg_users_name}
    Input Text      ${txt_users_username}            ${arg_users_name}
    Input Text      ${txt_users_password}            ${arg_users_password}
    Input Text      ${txt_users_confirm_password}    ${arg_users_password}
    Input Text      ${txt_users_email}               ${arg_users_email}
    Click Button    ${btn_users_save_and_close}

Check Information Displayed Correctly
    [Arguments]                           ${arg_check_email}       ${arg_check_name}
    ${check_name}        Format String    ${xph_users_name}        ${arg_check_name}
    ${check_username}    Format String    ${xph_users_username}    ${arg_check_name}
    ${check_email}       Format String    ${xph_users_email}       ${arg_check_email}
    Element Should Be Visible             ${check_name}
    Element Should Be Visible             ${check_username}
    Element Should Be Visible             ${check_email}

Check Relogin Successfully After Modified
    [Arguments]                           ${arg_check_username}    ${arg_check_password}
    Go To                                 ${CLIENT_ROOT}
    Login Client Site                     ${arg_check_username}    ${arg_check_password}
    Check Login To Client Successfully    ${arg_check_username}

Clean Up After Test
    [Arguments]             ${arg_email}
    Logout Client Site
    Go To                   ${ROOT}
    Select Sidebar Menu     ${lbl_users}
    Delete Selected User    ${arg_email}
    Logout Admin Site

Delete Selected User
    [Arguments]                          ${arg_selected_user}
    ${checkbox_user}    Format String    ${xph_users_chb_selected_user}    ${arg_selected_user}
    Click Element                        ${cbb_users_order}
    Click Element                        ${opt_users_order}
    Click Element                        ${checkbox_user}
    Click Button                         ${btn_users_delete}
    Handle Alert
    
Check Delete User Successfully
    [Arguments]                          ${arg_selected_user}
    ${selected_user}    Format String    ${xph_users_selected_user}    ${arg_selected_user}
    Page Should Not Contain Element      ${selected_user}