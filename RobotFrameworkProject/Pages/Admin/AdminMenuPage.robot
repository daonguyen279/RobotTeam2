*** Settings ***
Resource    ../../Pages/Admin/AdminHomePage.robot

*** Variables ***
${btn_listmenu}                 xpath=//ul[@id="submenu"]/li[@class="active"]/a[contains(text(),"Menus")]
${btn_addnewmenu}               xpath=//div[@id="toolbar-new"]/button
${btn_listmenuitem}             xpath=//ul[@id="submenu"]//a[contains(text(),"Menu Items")]
${btn_editmenu}                 xpath=//div[@id="toolbar-edit"]/button
${btn_deletemenu}               xpath=//div[@id="toolbar-delete"]/button
${txt_titlemenu}                xpath=//form[@id="item-form"]//input[@id="jform_title"]
${txt_typemenu}                 xpath=//div[@class="form-horizontal"]//input[@id="jform_menutype"]
${txt_descriptionmenu}          xpath=//div[@class="form-horizontal"]//input[@id="jform_menudescription"]
${lbl_site}                     xpath=//fieldset[@id="jform_client_id"]/label[contains(text(),"Site")]
${lbl_administrator}            xpath=//fieldset[@id="jform_client_id"]/label[contains(text(),"Administrator")]
${btn_saveandclosemenu}         xpath=//div[@id="toolbar-save"]/button
${txt_menuitemtitle}            xpath=//form[@id="item-form"]//input[@id="jform_title"]
${btn_selectmenuitemtype}       xpath=//div[@class="controls"]//button[@class="btn btn-primary"]
${btn_deletemenu}               xpath=//div[@id="toolbar-delete"]/button
&{btn_trashitemmenu}            xpath=//div[@id="toolbar-trash"]/button
# ${lbl_itemmenutype}           xpath=//div[@class="accordion-heading"]//a[contains(text(),"Articles")]
# ${lbl_submenuitemtype}        xpath=//div[@class="accordion-inner"]//a[contains(text(),"Archived Articles")]
${sel_selectmenuparent}         xpath=//div[@id="jform_menutype_chzn"]
${lbl_listmenuitem}             xpath=//table[@id="menuList"]//tr[@class="row0" and "row1"]
${delete_menuelement}           xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
${sel_listtypeofarrange}        xpath=//select[@id="list_fullordering"]
${btn_selectlisttypeofarrange}  xpath=//div[@id="list_fullordering_chzn"]/a
${opt_idacsending}              xpath=//select[@id="list_fullordering"]/option[contains(text(),"ID ascending")]
*** Keywords ***
Go To Menu Page
    Click Element    ${btn_listmenu} 
    
Go To Add New Menu Page
    Click Element    ${btn_listmenu} 
	Click Element    ${btn_addnewmenu} 

Fill Out And Submit Menu Information
	[Arguments]      ${arg_menutitle}	               ${arg_menutype}            ${arg_menudescription}  
	Input Text       ${txt_titlemenu}                 ${arg_menutitle}	
	Input Text       ${txt_typemenu}                  ${arg_menutype}
	Input Text       ${txt_descriptionmenu}           ${arg_menudescription}}                                         
	Click Element    ${btn_saveandclosemenu}
	
Check Add New Menu Successfully
    [Arguments]                    ${arg_menuitemtitle}
    Element Text Should Be         ${hed_headermessage}     Message 
    Element Text Should Be         ${lbl_message}           Menu saved
    Page Should Contain Element    xpath= //table[@id="menuList"]//a[contains(text(),"${arg_menuitemtitle}")]

Select ID Ascending
    Click Element       xpath=//div[@id="list_fullordering_chzn"]/a
    Click Element       xpath=//div[@id="list_fullordering_chzn"]/div/ul/li[contains(text(),"ID ascending")] 
    # Select From List By Label            ${sel_listtypeofarrange}  ID ascending  
    # Wait Until Element Is Visible   ${opt_idacsending} 
    # Click Element                   ${opt_idacsending} 
Delete Menu
    [Arguments]      ${arg_menutodelete}
    Click Element    xpath=//table[@id="menuList"]//tr[td/a[contains(text(),"${arg_menutodelete}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input
    Click Element    ${btn_deletemenu}	
    Handle Alert     ACCEPT
    
Check Delete Menu Successfully
    [Arguments]                      ${arg_menuitemtitle}
    Element Text Should Be           ${hed_headermessage}     Message 
    Element Text Should Be           ${lbl_message}           Menu type deleted.
    Page Should Not Contain Element  xpath= //table[@id="menuList"]//a[contains(text(),"${arg_menuitemtitle}")]

Delete All Menu 
    [Arguments]                      ${arg_cellCount}
    FOR    ${index}    IN RANGE    0    ${arg_cellCount}
        # ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   ${delete_menuelement}
        # # ${delete_menuelement}=    Get Matching Xpath Count     xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        # Run Keyword If     ${IsElementVisible}    Click Element    &{delete_menuelement}
        Click Element    xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        Click Element    ${btn_deletemenu} 
        Handle Alert     ACCEPT  
    END    
    
Go To Menu Item Page 
    Click Element   ${btn_listmenuitem}
       
Go To Add New Menu Item Page
    Click Element   ${btn_listmenuitem}
    Click Element   ${btn_addnewmenu}  
 
Fill Out And Submit Menu Item Information
    [Arguments]                  ${arg_menuitemtitle}	      ${arg_menuitemtype}	  ${arg_submenuitemtype}    ${arg_menuparent}    
    Input Text                   ${txt_menuitemtitle}         ${arg_menuitemtitle}
    Click Element 	             ${btn_selectmenuitemtype}
    Select Frame                 xpath=//div[@id="menuTypeModal"]//iframe              
	Click Element                xpath=//div[@id="collapseTypes"]//div[@class="accordion-heading"]//a[contains(text(),"${arg_menuitemtype}")]
	Click Element                xpath=//div[@id="collapseTypes"]//div[@class="accordion-body in collapse"]//a[contains(text(),"${arg_submenuitemtype}")]  
    Unselect Frame   
	Select From List By Label    ${sel_selectmenuparent}      ${arg_menuparent}                                   
	Click Element                ${btn_saveandclosemenu}      
	Click Element                ${btn_saveandclosemenu}
	
Delete Menu Item
    [Arguments]                  ${arg_menuitemtitle}
    Click Element                ${arg_menuitemtitle}
    Click Element                &{btn_trashitemmenu}
    
