*** Settings ***
Resource    ../../Resources/Setup.robot
Resource	../../Pages/Admin/AdminHomePage.robot
Resource    ../../Pages/Client/ClientHomePage.robot


*** Variables ***
${btn_new_user}                  xpath=//button[@onclick="Joomla.submitbutton('user.add');"]
${btn_edit_user}                 xpath=//div[@id="toolbar-edit"]/button
${btn_active_user}               xpath=//div[@id="toolbar-publish"]/button
${btn_blobk_user}                xpath=//div[@id="toolbar-unpublish"]/button
${btn_unblock_user}              xpath=//div[@id="toolbar-unblock"]/button
${btn_delete_user}               xpath=//div[@id="toolbar-delete"]/button
${txt_new_name}                  xpath=//form[@id="user-form"]//input[@id="jform_name"]
${txt_new_username}              xpath=//form[@id="user-form"]//input[@id="jform_username"]
${txt_new_password}              xpath=//form[@id="user-form"]//input[@id="jform_password"]
${txt_new_confirmpassword}	     xpath=//form[@id="user-form"]//input[@id="jform_password2"]
${txt_new_email}                 xpath=//form[@id="user-form"]//input[@id="jform_email"]
${txt_edit_id}                   xpath=//form[@id="user-form"]//input[@id="jform_id"]
${btn_new_save}                  xpath=//button[@onclick="Joomla.submitbutton('user.apply');"]
${btn_new_save_and_close}        xpath=//button[@onclick="Joomla.submitbutton('user.save');"]
${btn_new_save_and_new}          xpath=//button[@onclick="Joomla.submitbutton('user.save2new');"]
${btn_new_cancel}                xpath=//button[@onclick="Joomla.submitbutton('user.cancel');"]
${btn_new_close}                 xpath=//button[@onclick="Joomla.submitbutton('user.cancel');"]
${lbl_new_message_successful}    xpath=//div[@id="system-message-container"]/div[@class="alert alert-success"]
${cbb_order_user}                xpath=//div[@id="list_fullordering_chzn"]/a[@class="chzn-single"]
${opt_option_ordering_user}      xpath=//div[@id="list_fullordering_chzn"]//ul[@class="chzn-results"]/li[text()="ID descending"]


*** Keywords ***
Go To Add New User Page
    Select Sidebar Menu    ${lbl_users}
    Click Button           ${btn_new_user}

Go To Edit User Account Page
    [Arguments]            ${arg_account}
    Select Sidebar Menu    ${lbl_users}
    Click Element          ${cbb_order_user}
    Click Element          ${opt_option_ordering_user}
    Click Element          xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_account}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a

Fill Out And Submit Information
	[Arguments]     ${arg_new_name}                ${arg_new_password}    ${arg_new_email}
	Input Text      ${txt_new_name}                ${arg_new_name}
	Input Text      ${txt_new_username}            ${arg_new_name}
	Input Text      ${txt_new_password}            ${arg_new_password}
	Input Text      ${txt_new_confirm_password}    ${arg_new_password}
	Input Text      ${txt_new_email}               ${arg_new_email}
	Click Button    ${btn_new_save_and_close}

Check Information Displayed Correctly
    [Arguments]                  ${arg_check_email}    ${arg_check_name}
    Element Should Be Visible    ${lbl_new_message_successful}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_check_email}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a    ${arg_check_name}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_check_email}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Username")]]/preceding-sibling::th)+1]                                ${arg_check_name}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_check_email}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Email")]]/preceding-sibling::th)+1]                                   ${arg_check_email}
    ${SELECTED_USER_ID}          Get Text    xpath=//table[@id="userList"]//tr[td[contains(text(), "${arg_check_email}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "ID")]]/preceding-sibling::th)+1]
    Set Suite Variable           ${SELECTED_USER_ID}

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
    Click Element    ${cbb_order_user}
    Click Element    ${opt_option_ordering_user}
    Click Element    xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_selected_user}")]]/td[count(//table[@id="userList"]//tr/th[input]/preceding-sibling::th)+1]/input
    Click Button     ${btn_delete_user}
    Handle Alert
    
Check Delete User Successfully
    Element Should Be Visible          ${lbl_new_message_successful}
    Page Should Not Contain Element    xpath=//table[@id="userList"]//tr[td[@class="hidden-phone" and contains(text(), "${SELECTED_USER_ID}")]]
    Logout Admin Site
