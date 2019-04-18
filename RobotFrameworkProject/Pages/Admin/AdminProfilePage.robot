*** Settings ***
Resource	../../Pages/AdminHomePage.robot


*** Variables ***
${txt_name}                   id=jform_name
${txt_password}               id=jform_password2
${txt_confirmpassword}        id=jform_password
${txt_email}                  id=jform_email
${btn_savebutton}             xpath=//div[@id="toolbar-save"]/button

*** Keywords ***
Go to admin profile page
	
	Click element                    ${icn_user}
	Wait Until Element Is Visible    ${lbl_editprofile}
    Click Element                    ${lbl_editprofile}

Fill out and submit update information
	[Arguments] 	${arg_name}	    ${arg_password}     ${arg_confirmpassword}   ${arg_email} 

	Input Text    ${txt_name}               ${arg_name}
	Input Text    ${txt_password}           ${arg_password}
	Input Text    ${txt_confirmpassword}	${arg_confirmpassword}
	Input Text    ${txt_email}              ${arg_email} 	                         
	Click Button  ${btn_updateprofile}      ${btn_savebutton}

