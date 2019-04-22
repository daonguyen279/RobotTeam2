*** Settings ***
Resource    ../../Pages/Admin/AdminHomePage.robot

*** Variables ***
${txt_updatename}                   xpath=//form[@id="profile-form"]/div/div/div[@class="control-group"]/div[@class="controls"]/input[@id="jform_name"]
${txt_updatepassword}               xpath=//form[@id="profile-form"]/div/div/div[@class="control-group"]/div[@class="controls"]/input[@id="jform_password2"]
${txt_updateconfirmpassword}        xpath=//form[@id="profile-form"]/div/div/div[@class="control-group"]/div[@class="controls"]/input[@id="jform_password"]
${txt_updateemail}                  xpath=//form[@id="profile-form"]/div/div/div[@class="control-group"]/div[@class="controls"]/input[@id="jform_email"]
${btn_updatesavebutton}             xpath=//div[@id="toolbar-save"]/button

*** Keywords ***
Go To Admin Profile Page
	Click element                    ${icn_user}
	Wait Until Element Is Visible    ${lbl_editprofile}
    Click Element                    ${lbl_editprofile}

Fill Out And Submit Update Information
	[Arguments]   ${arg_updatename}	               ${arg_updatepassword}            ${arg_updateconfirmpassword}      ${arg_updateemail} 
	Input Text    ${txt_updatename}                ${arg_updatename}	
	Input Text    ${txt_updatepassword}            ${arg_updatepassword}
	Input Text    ${txt_updateconfirmpassword}     ${arg_updateconfirmpassword}
	Input Text    ${txt_updateemail}               ${arg_updateemail} 	                         
	Click Button  ${btn_updatesavebutton}
	
Check Message Successfully Display
    Element Text Should Be    ${hed_headermessage}     Message 
    Element Text Should Be    ${lbl_message}            Item saved. 


    