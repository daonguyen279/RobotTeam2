*** Settings ***
Resource    ../../Resources/Setup.robot
Resource	../../Pages/Admin/AdminHomePage.robot


*** Variables ***
${btn_newuser}                 xpath=//button[@onclick="Joomla.submitbutton('user.add');"]
${txt_newname}                 xpath=//form[@id="user-form"]//input[@id="jform_name"]
${txt_newusername}             xpath=//form[@id="user-form"]//input[@id="jform_username"]
${txt_newpassword}             xpath=//form[@id="user-form"]//input[@id="jform_password"]
${txt_newconfirmpassword}	   xpath=//form[@id="user-form"]//input[@id="jform_password2"]
${txt_newemail}                xpath=//form[@id="user-form"]//input[@id="jform_email"]
${btn_newsave}                 xpath=//button[@onclick="Joomla.submitbutton('user.apply');"]
${btn_newsaveandclose}         xpath=//button[@onclick="Joomla.submitbutton('user.save');"]
${btn_newsaveandnew}           xpath=//button[@onclick="Joomla.submitbutton('user.save2new');"]
${btn_newcancel}               xpath=//button[@onclick="Joomla.submitbutton('user.cancel');"]
${btn_newclose}                xpath=//button[@onclick="Joomla.submitbutton('user.cancel');"]
${lbl_newmessagesuccessful}    xpath=//div[@id="system-message-container"]/div[@class="alert alert-success"]


*** Keywords ***
Add New User Account
	[Arguments]     ${arg_newname}    ${arg_newusername}    ${arg_newpassword}    ${arg_newemail}
    Click Button    ${btn_newuser}
	Input Text      ${txt_newname}               ${arg_newname}
	Input Text      ${txt_newusername}           ${arg_newusername}
	Input Text      ${txt_newpassword}           ${arg_newpassword}
	Input Text      ${txt_newconfirmpassword}    ${arg_newpassword}
	Input Text      ${txt_newemail}              ${arg_newemail}
	Click Button    ${btn_newsaveandclose}
	
Check Add New User Successfully
    Element Should Be Visible    ${lbl_newmessagesuccessful}
    



