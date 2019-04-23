*** Settings ***
Resource    ../../Resources/Setup.robot
Resource	../../Pages/Admin/AdminHomePage.robot
Resource    ../../Pages/Client/ClientHomePage.robot


*** Variables ***
${btn_users_new}                   xpath=//button[@onclick="Joomla.submitbutton('user.add');"]
${btn_users_edit}                  xpath=//div[@id="toolbar-edit"]/button
${btn_users_active}                xpath=//div[@id="toolbar-publish"]/button
${btn_users_blobk}                 xpath=//div[@id="toolbar-unpublish"]/button
${btn_users_unblock}               xpath=//div[@id="toolbar-unblock"]/button
${btn_users_delete}                xpath=//div[@id="toolbar-delete"]/button
${txt_users_name}                  xpath=//form[@id="user-form"]//input[@id="jform_name"]
${txt_users_username}              xpath=//form[@id="user-form"]//input[@id="jform_username"]
${txt_users_password}              xpath=//form[@id="user-form"]//input[@id="jform_password"]
${txt_users_confirmpassword}	   xpath=//form[@id="user-form"]//input[@id="jform_password2"]
${txt_users_email}                 xpath=//form[@id="user-form"]//input[@id="jform_email"]
${txt_users_id}                    xpath=//form[@id="user-form"]//input[@id="jform_id"]
${btn_users_save}                  xpath=//button[@onclick="Joomla.submitbutton('user.apply');"]
${btn_users_save_and_close}        xpath=//button[@onclick="Joomla.submitbutton('user.save');"]
${btn_users_save_and_new}          xpath=//button[@onclick="Joomla.submitbutton('user.save2new');"]
${btn_users_cancel_and_close}      xpath=//button[@onclick="Joomla.submitbutton('user.cancel');"]
${lbl_users_successful_message}    xpath=//div[@id="system-message-container"]/div[@class="alert alert-success"]
${cbb_users_order}                 xpath=//div[@id="list_fullordering_chzn"]/a[@class="chzn-single"]
${opt_users_order}                 xpath=//div[@id="list_fullordering_chzn"]//ul[@class="chzn-results"]/li[text()="ID descending"]


*** Keywords ***
Go To Add New User Page
    Select Sidebar Menu    ${lbl_users}
    Click Button           ${btn_users_new}

Go To Edit User Account Page
    [Arguments]            ${arg_account}
    Select Sidebar Menu    ${lbl_users}
    Click Element          ${cbb_users_order}
    Click Element          ${opt_users_order}
    Click Element          xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_account}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a

Fill Out And Submit Information
	[Arguments]     ${arg_users_name}                ${arg_users_password}    ${arg_users_email}
	Input Text      ${txt_users_name}                ${arg_users_name}
	Input Text      ${txt_users_username}            ${arg_users_name}
	Input Text      ${txt_users_password}            ${arg_users_password}
	Input Text      ${txt_users_confirm_password}    ${arg_users_password}
	Input Text      ${txt_users_email}               ${arg_users_email}
	Click Button    ${btn_users_save_and_close}

Check Information Displayed Correctly
    [Arguments]                         ${arg_check_email}                 ${arg_check_name}
    Element Should Be Visible           ${lbl_users_successful_message}
    Element Text Should Be              xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_check_email}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a    ${arg_check_name}
    Element Text Should Be              xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_check_email}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Username")]]/preceding-sibling::th)+1]                                ${arg_check_name}
    Element Text Should Be              xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_check_email}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Email")]]/preceding-sibling::th)+1]                                   ${arg_check_email}
    ${SELECTED_USER_ID}=    Get Text    xpath=//table[@id="userList"]//tr[td[contains(text(), "${arg_check_email}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "ID")]]/preceding-sibling::th)+1]
    Set Suite Variable                  ${SELECTED_USER_ID}

Check Relogin Successfully After Modified
    [Arguments]                           ${arg_check_username}    ${arg_check_password}
    Go To                                 ${CLIENT_ROOT}
    Login Client Site                     ${arg_check_username}    ${arg_check_password}
    Check Login To Client Successfully    ${arg_check_username}

Clean Up For Add And Edit User
    Logout Client Site
    Go To                 ${ROOT}
    Logout Admin Site

Delete Selected User
    [Arguments]      ${arg_selected_user}
    Click Element    ${cbb_users_order}
    Click Element    ${opt_users_order}
    Click Element    xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_selected_user}")]]/td[count(//table[@id="userList"]//tr/th[input]/preceding-sibling::th)+1]/input
    Click Button     ${btn_users_delete}
    Handle Alert
    
Check Delete User Successfully
    Element Should Be Visible          ${lbl_users_successful_message}
    Page Should Not Contain Element    xpath=//table[@id="userList"]//tr[td[@class="hidden-phone" and contains(text(), "${SELECTED_USER_ID}")]]
    Logout Admin Site
    
