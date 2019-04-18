*** Settings ***
Resource	../../Pages/AdminHomePage.robot


*** Variables ***
${txt_name}                   id=jform_name
${txt_password}               id=jform_password2
${txt_confirmpassword}        id=jform_password
${txt_email}                  id=jform_email

*** Keywords ***
Go to admin profile page
	
	Click element                    ${icn_user}
	Wait Until Element Is Visible    ${lbl_editprofile}
    Click Element                    ${lbl_editprofile}

Fill out and submit update information
	[Arguments] 	${arg_name}	   ${txt_password}     ${txt_confirmpassword}   ${txt_email} 

	Input Text                   ${txt_name}              ${arg_name}
	Input Text                   ${txt_lastname}               ${arg_lastname}
	Input Text                   ${txt_nickname}               ${arg_nickname}
	Select From List By Label	 ${sel_displayname}            ${arg_displayname}
	Input Text                   ${txt_email}                  ${arg_email}
	Input Text                   ${txt_biographicalinfo}       ${arg_biographicalinfo}
	Click Element                ${btn_generatepassword}
	Input Text                   ${txt_generatepassword}       ${arg_generatepassword}
	Click Element                ${cbx_confirmweakpasswork}                             
	Click Button                 ${btn_updateprofile}
