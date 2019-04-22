*** Settings ***
Resource    ../../Resources/Setup.robot
Resource	../../Pages/Admin/AdminHomePage.robot
Resource    ../../Pages/Client/ClientHomePage.robot


*** Variables ***
${btn_newuser}                 xpath=//button[@onclick="Joomla.submitbutton('user.add');"]
${btn_edituser}                xpath=//div[@id="toolbar-edit"]/button
${btn_activeuser}              xpath=//div[@id="toolbar-publish"]/button
${btn_blobkuser}               xpath=//div[@id="toolbar-unpublish"]/button
${btn_unblockuser}             xpath=//div[@id="toolbar-unblock"]/button
${btn_deleteuser}              xpath=//div[@id="toolbar-delete"]/button
${txt_newname}                 xpath=//form[@id="user-form"]//input[@id="jform_name"]
${txt_newusername}             xpath=//form[@id="user-form"]//input[@id="jform_username"]
${txt_newpassword}             xpath=//form[@id="user-form"]//input[@id="jform_password"]
${txt_newconfirmpassword}	   xpath=//form[@id="user-form"]//input[@id="jform_password2"]
${txt_newemail}                xpath=//form[@id="user-form"]//input[@id="jform_email"]
${txt_editid}                  xpath=//form[@id="user-form"]//input[@id="jform_id"]
${btn_newsave}                 xpath=//button[@onclick="Joomla.submitbutton('user.apply');"]
${btn_newsaveandclose}         xpath=//button[@onclick="Joomla.submitbutton('user.save');"]
${btn_newsaveandnew}           xpath=//button[@onclick="Joomla.submitbutton('user.save2new');"]
${btn_newcancel}               xpath=//button[@onclick="Joomla.submitbutton('user.cancel');"]
${btn_newclose}                xpath=//button[@onclick="Joomla.submitbutton('user.cancel');"]
${lbl_newmessagesuccessful}    xpath=//div[@id="system-message-container"]/div[@class="alert alert-success"]
${cbb_orderuser}               xpath=//div[@id="list_fullordering_chzn"]/a[@class="chzn-single"]
${opt_optionorderinguser}      xpath=//div[@id="list_fullordering_chzn"]//ul[@class="chzn-results"]/li[text()="ID descending"]


*** Keywords ***
Go To Add New User Page
    Select Sidebar Menu    ${lbl_users}
    Click Button           ${btn_newuser}

Go To Edit User Account Page
    [Arguments]            ${arg_account}
    Select Sidebar Menu    ${lbl_users}
    Click Element          ${cbb_orderuser}
    Click Element          ${opt_optionorderinguser}
    Click Element          xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_account}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a

Fill Out And Submit Information
	[Arguments]     ${arg_newname}               ${arg_newpassword}    ${arg_newemail}
	Input Text      ${txt_newname}               ${arg_newname}
	Input Text      ${txt_newusername}           ${arg_newname}
	Input Text      ${txt_newpassword}           ${arg_newpassword}
	Input Text      ${txt_newconfirmpassword}    ${arg_newpassword}
	Input Text      ${txt_newemail}              ${arg_newemail}
	Click Button    ${btn_newsaveandclose}

Check Add And Edit User Successfully
    [Arguments]                  ${arg_checkemail}    ${arg_checkname}
    Element Should Be Visible    ${lbl_newmessagesuccessful}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_checkemail}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a    ${arg_checkname}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_checkemail}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Username")]]/preceding-sibling::th)+1]    ${arg_checkname}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_checkemail}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Email")]]/preceding-sibling::th)+1]    ${arg_checkemail}
    ${SELECTEDUSERID}            Get Text    xpath=//table[@id="userList"]//tr[td[contains(text(), "${arg_checkemail}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "ID")]]/preceding-sibling::th)+1]
    Set Suite Variable           ${SELECTEDUSERID}

Check Relogin Successfully After Modified
    [Arguments]                           ${arg_checkusername}    ${arg_checkpassword}
    Go To                                 ${CLIENT_ROOT}
    Login Client Site                     ${arg_checkusername}    ${arg_checkpassword}
    Check Login To Client Successfully    ${arg_checkusername}

Clean Up For User Test
    Logout Client Site
    Go To                 ${ROOT}
    Logout Admin Site

Delete Selected User
    [Arguments]      ${arg_selecteduser}
    Click Element    ${cbb_orderuser}
    Click Element    ${opt_optionorderinguser}
    Click Element    xpath=//table[@id="userList"]//tr[td[@class="hidden-phone break-word hidden-tablet" and contains(text(), "${arg_selecteduser}")]]/td[count(//table[@id="userList"]//tr/th[input]/preceding-sibling::th)+1]/input
    Click Button     ${btn_deleteuser}
    Handle Alert
    
Check Delete User Successfully
    Element Should Be Visible    ${lbl_newmessagesuccessful}
    Page Should Not Contain Element    xpath=//table[@id="userList"]//tr[td[@class="hidden-phone" and contains(text(), "${SELECTEDUSERID}")]]
    Logout Admin Site



