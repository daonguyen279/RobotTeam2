*** Settings ***
Resource    ../../Resources/Setup.robot
Resource	../../Pages/Admin/AdminHomePage.robot
Resource    ../../Pages/Client/ClientHomePage.robot


*** Variables ***
${btn_newuser}                 xpath=//button[@onclick="Joomla.submitbutton('user.add');"]
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


*** Keywords ***
Go To Add New User Page
    Select Sidebar Menu    ${lbl_users}
    Click Button           ${btn_newuser}

Add New User Account
	[Arguments]     ${arg_newname}               ${arg_newpassword}
	Input Text      ${txt_newname}               ${arg_newname}
	Input Text      ${txt_newusername}           ${arg_newname}
	Input Text      ${txt_newpassword}           ${arg_newpassword}
	Input Text      ${txt_newconfirmpassword}    ${arg_newpassword}
	Input Text      ${txt_newemail}              ${arg_newname}@gmail.com
	Click Button    ${btn_newsaveandclose}

Go To Edit User Account Page
    [Arguments]            ${arg_account}
    ${SELECTEDACCOUNT}=    Set Variable          xpath=//table[@id="userList"]//tr[td[contains(text(), "${arg_account}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a
    Click Element          ${SELECTEDACCOUNT}

Edit User Account Information
    [Arguments]               ${arg_editname}              ${arg_editpassword}
    Input Text                ${txt_newname}               ${arg_editname}
	Input Text                ${txt_newusername}           ${arg_editname}
	Input Text                ${txt_newpassword}           ${arg_editpassword}
	Input Text                ${txt_newconfirmpassword}    ${arg_editpassword}
	Input Text                ${txt_newemail}              ${arg_editname}@gmail.com
	${SELECTEDACCOUNTID}=     Get Text                     ${txt_editid}
	Set Suite Variable        ${SELECTEDACCOUNTID}
	Click Button              ${btn_newsaveandclose}
	
Check Add And Edit User Successfully
    [Arguments]                  ${arg_checkname}
    Element Should Be Visible    ${lbl_newmessagesuccessful}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[contains(text(), "${arg_checkname}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a    ${arg_checkname}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[contains(text(), "${arg_checkname}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Username")]]/preceding-sibling::th)+1]    ${arg_checkname}
    Element Text Should Be       xpath=//table[@id="userList"]//tr[td[contains(text(), "${arg_checkname}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Email")]]/preceding-sibling::th)+1]    ${arg_checkname}@gmail.com

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