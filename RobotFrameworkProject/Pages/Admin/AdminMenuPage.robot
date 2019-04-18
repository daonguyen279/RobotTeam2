*** Variables ***
${btn_listmenu}           xpath=//ul[@id="submenu"]/li[@class="active"]/a[contains(text(),"Menus")]
${btn_addnewmenu}         xpath=//div[@id="toolbar-new"]/button
${btn_listmenuitem}       xpath=//ul[@id="submenu"]/li[@class="active"]/a[contains(text(),"Menu Items")]
${btn_editmenu}           xpath=//div[@id="toolbar-edit"]/button
${btn_deletemenu}         xpath=//div[@id="toolbar-delete"]/button
${txt_titlemenu}          xpath=//form[@id="item-form"]//input[@id="jform_title"]
${txt_typemenu}           xpath=//div[@class="form-horizontal"]//input[@id="jform_menutype"]
${txt_descriptionmenu}    xpath=//div[@class="form-horizontal"]//input[@id="jform_menudescription"]
${lbl_site}               xpath=//fieldset[@id="jform_client_id"]/label[contains(text(),"Site")]
${lbl_administrator}      xpath=//fieldset[@id="jform_client_id"]/label[contains(text(),"Administrator")]
${btn_saveandclosemenu}   xpath=//div[@id="toolbar-save"]/button
*** Keywords ***
Go To Add New Menu Page
    Click Element                    ${btn_listmenu} 
	Click Element                    ${btn_addnewmenu} 

Fill Out And Submit Update Information
	[Arguments]      ${arg_menutitle}	               ${arg_menutype}            ${arg_menudescription}  
	Input Text       ${txt_titlemenu}                 ${arg_menutitle}	
	Input Text       ${txt_typemenu}                  ${arg_menutype}
	Input Text       ${txt_descriptionmenu}           ${arg_menudescription}}                                         
	Click Element    ${btn_saveandclosemenu}

    
   
