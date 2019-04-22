*** Settings ***
Resource    ../../Pages/Admin/AdminHomePage.robot

*** Variables ***
${btn_list_menu}                    xpath=//ul[@id="submenu"]/li[@class="active"]/a[contains(text(),"Menus")]
${btn_add_newmenu}                  xpath=//div[@id="toolbar-new"]/button
${btn_list_menuitem}                xpath=//ul[@id="submenu"]//a[contains(text(),"Menu Items")]
${btn_edit_menu}                    xpath=//div[@id="toolbar-edit"]/button
${btn_delete_menu}                  xpath=//div[@id="toolbar-delete"]/button
${txt_title_menu}                   xpath=//form[@id="item-form"]//input[@id="jform_title"]
${txt_type_menu}                    xpath=//div[@class="form-horizontal"]//input[@id="jform_menutype"]
${txt_description_menu}             xpath=//div[@class="form-horizontal"]//input[@id="jform_menudescription"]
${lbl_site}                         xpath=//fieldset[@id="jform_client_id"]/label[contains(text(),"Site")]
${lbl_administrator}                xpath=//fieldset[@id="jform_client_id"]/label[contains(text(),"Administrator")]
${btn_save_and_close_menu}          xpath=//div[@id="toolbar-save"]/button
${txt_menuitem_title}               xpath=//form[@id="item-form"]//input[@id="jform_title"]
${btn_select_menuitem_type}         xpath=//div[@class="controls"]//button[@class="btn btn-primary"]
${btn_delete_menu}                  xpath=//div[@id="toolbar-delete"]/button
${btn_trash_itemmenu}               xpath=//div[@id="toolbar-trash"]/button
# ${lbl_itemmenutype}               xpath=//div[@class="accordion-heading"]//a[contains(text(),"Articles")]
# ${lbl_submenuitemtype}            xpath=//div[@class="accordion-inner"]//a[contains(text(),"Archived Articles")]
${sel_select_menuparent}            xpath=//div[@id="jform_menutype_chzn"]
${lbl_list_menu}                    xpath=//table[@id="menuList"]//tr[@class="row0" and "row1"]
${delete_menu_element}              xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
${sel_list_type_of_arrange}         xpath=//select[@id="list_fullordering"]
${btn_select_list_type_of_arrange}  xpath=//div[@id="list_fullordering_chzn"]/a
${opt_id_acsending}                 xpath=//select[@id="list_fullordering"]/option[contains(text(),"ID ascending")]
*** Keywords ***
Go To Menu Page
    Click Element                    ${btn_list_menu} 
    
Go To Add New Menu Page
    Click Element                    ${btn_list_menu} 
	Click Element                    ${btn_add_newmenu} 

Fill Out And Submit Menu Information
	[Arguments]                      ${arg_menu_title}	         ${arg_menu_type}            ${arg_menu_description}  
	Input Text                       ${txt_title_menu}            ${arg_menu_title}	
	Input Text                       ${txt_typ_emenu}             ${arg_menu_type}
	Input Text                       ${txt_description_menu}      ${arg_menu_description}}                                         
	Click Element                    ${btn_save_and_close_menu}
	
Check Message 
    [Arguments]                      ${arg_expected_message}
    Element Text Should Be           ${hed_header_message}         Message 
    Element Text Should Be           ${lbl_message}               ${arg_expected_message}
     
Check Add New Menu Successfully
    [Arguments]                      ${arg_menu_title}
    Page Should Contain Element      xpath= //table[@id="menuList"]//a[contains(text(),"${arg_menu_title}")]

Select ID Ascending
    Click Element                    xpath=//div[@id="list_fullordering_chzn"]/a
    Click Element                    xpath=//div[@id="list_fullordering_chzn"]/div/ul/li[contains(text(),"ID ascending")] 
    # Select From List By Label            ${sel_listtypeofarrange}  ID ascending  
    # Wait Until Element Is Visible   ${opt_idacsending} 
    # Click Element                   ${opt_idacsending} 
Delete Menu
    [Arguments]                      ${arg_menu_to_delete}
    Click Element                    xpath=//table[@id="menuList"]//tr[td/a[contains(text(),"${arg_menu_to_delete}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input
    Click Element                    ${btn_delete_menu}	
    Handle Alert                     ACCEPT
    
Check Delete Menu Successfully
    [Arguments]                      ${arg_menu_title}
    Page Should Not Contain Element  xpath= //table[@id="menuList"]//a[contains(text(),"${arg_menu_title}")]

Go To Menu Item Page 
    Click Element                    ${btn_list_menuitem}
       
Go To Add New Menu Item Page
    Click Element                    ${btn_list_menuitem}
    Click Element                    ${btn_add_newmenu}  
 
Fill Out And Submit Menu Item Information
    [Arguments]                      ${arg_menuitem_title}	      ${arg_menuitem_type}	  ${arg_submenuitem_type}    ${arg_menu_parent}    
    Input Text                       ${txt_menuitem_title}        ${arg_menuitem_title}
    Click Element 	                 ${btn_select_menuitem_type}
    Select Frame                     xpath=//div[@id="menuTypeModal"]//iframe              
	Click Element                    xpath=//div[@id="collapseTypes"]//div[@class="accordion-heading"]//a[contains(text(),"${arg_menuitem_type}")]
    Wait Until Element Is Visible    xpath=//div[@id="collapseTypes"]//div[@class="accordion-body in collapse"]//a[contains(text(),"${arg_submenuitem_type}")]
	# Select From List By Label      xpath=//*[@id="collapse0"]/div/ul       Archived Articles
	Click Element                    xpath=//div[@id="collapseTypes"]//div[@class="accordion-body in collapse"]//a[contains(text(),"${arg_submenuitem_type}")]  
    Unselect Frame  
    Click Element                    xpath=//div[@id="jform_menutype_chzn"]/a/div/b
    Wait Until Element Is Visible    xpath=//div[@id="jform_menutype_chzn"]/div/ul/li[contains(text(),"${arg_menu_parent}")]
    Click Element                    xpath=//div[@id="jform_menutype_chzn"]/div/ul/li[contains(text(),"${arg_menu_parent}")]
	# Select From List By Label      ${sel_selectmenuparent}      ${arg_menuparent}                                   
	Click Element                    ${btn_save_and_close_menu}      
	
Delete Menu Item
    [Arguments]                      ${arg_menuitem_title}
    Click Element                    xpath=//table[@id="itemList"]//tr[td/a[contains(text(),"${arg_menuitem_title}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input
    Click Element                    ${btn_trashitemmenu}

Check Add Menu Item Successfully
    [Arguments]                      ${arg_menuitem_title}
    Page Should Contain Element      xpath=//table[@id="itemList"]//a[contains(text(),"${arg_menuitem_title}")]
        
Check Delete Menu Item Successfully
    [Arguments]                      ${arg_menuitem_title}
    Page Should Not Contain Element  xpath= //table[@id="menuList"]//a[contains(text(),"${arg_menuitem_title}")]
    

Delete All Menu 
    [Arguments]                      ${arg_cellCount}
    FOR    ${index}  IN RANGE   0    ${arg_cellCount}
           ${IsElementVisible}=      Run Keyword And Return Status    Element Should Be Visible   xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        # ${delete_menuelement}=     Get Matching Xpath Count     xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        Run Keyword If               ${IsElementVisible}    Click Element    xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        # Click Element              xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        Click Element                ${btn_delete_menu} 
        Handle Alert                 ACCEPT  
    END    
    