*** Settings ***
Resource    ../../Pages/Admin/AdminHomePage.robot

*** Variables ***
${btn_menus_list}               xpath=//ul[@id="submenu"]/li[@class="active"]/a[contains(text(),"Menus")]
${btn_menus_add}                xpath=//div[@id="toolbar-new"]/button
${btn_menuitems_list}           xpath=//ul[@id="submenu"]//a[contains(text(),"Menu Items")]
${btn_menus_edit}               xpath=//div[@id="toolbar-edit"]/button
${btn_menus_delete}             xpath=//div[@id="toolbar-delete"]/button
${txt_menus_title}              xpath=//form[@id="item-form"]//input[@id="jform_title"]
${txt_menus_type}               xpath=//div[@class="form-horizontal"]//input[@id="jform_menutype"]
${txt_menus_description}        xpath=//div[@class="form-horizontal"]//input[@id="jform_MENU_DESCRIPTION"]
${btn_menus_save_close}         xpath=//div[@id="toolbar-save"]/button
${txt_menuitems_title}          xpath=//form[@id="item-form"]//input[@id="jform_title"]
${btn_menuitems_type}           xpath=//div[@class="controls"]//button[@class="btn btn-primary"]
${btn_menuitems_trash}          xpath=//div[@id="toolbar-trash"]/button
${cbb_menuitems_menuparent}     xpath=//div[@id="jform_menutype_chzn"]
${lbl_menus_list}               xpath=//table[@id="menuList"]//tr[@class="row0" and "row1"]
${cbb_menuitems_arrange}        xpath=//div[@id="list_fullordering_chzn"]/a
${opt_menuitems_idacsending}    xpath=//div[@id="list_fullordering_chzn"]/div/ul/li[contains(text(),"ID ascending")]
*** Keywords ***
Go To Menu Page
    Click Element    ${btn_menus_list} 
    
Go To Add New Menu Page
    Click Element    ${btn_menus_list} 
	Click Element    ${btn_menus_add} 

Fill Out And Submit Menu Information
	[Arguments]      ${arg_menu_title}           ${arg_menu_type}           ${arg_menu_description}  
	Input Text       ${txt_menus_title}          ${arg_menu_title}	
	Input Text       ${txt_menus_type}           ${arg_menu_type}
	Input Text       ${txt_menus_description}    ${arg_menu_description}                                                    
	Click Element    ${btn_menus_save_close}    
     
Check Add New Menu Successfully
    [Arguments]                    ${arg_menu_title}
    Page Should Contain Element    xpath= //table[@id="menuList"]//a[contains(text(),"${arg_menu_title}")]

Select ID Ascending
    Click Element    ${cbb_menuitems_arrange}
    Click Element    ${opt_menuitems_idacsending} 
    
Delete Menu
    [Arguments]      ${arg_menu_to_delete}
    Click Element    xpath=//table[@id="menuList"]//tr[td/a[contains(text(),"${arg_menu_to_delete}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input
    Click Element    ${btn_menus_delete}	
    Handle Alert     ACCEPT
    
Check Delete Menu Successfully
    [Arguments]                        ${arg_menu_title}
    Page Should Not Contain Element    xpath= //table[@id="menuList"]//a[contains(text(),"${arg_menu_title}")]

Go To Menu Item Page 
    Click Element	${btn_menuitems_list}
       
Go To Add New Menu Item Page
    Click Element	${btn_menuitems_list}
    Click Element	${btn_menus_add}  
 
Fill Out And Submit Menu Item Information
    [Arguments]                      ${arg_menuitem_title}	   ${arg_menuitem_type}	   ${arg_submenuitem_type}    ${arg_menu_parent}    
    Input Text                       ${txt_menuitems_title}    ${arg_menuitem_title}    
    Click Element 	                 ${btn_menuitems_type}
    Select Frame                     xpath=//div[@id="menuTypeModal"]//iframe              
	Click Element                    xpath=//div[@id="collapseTypes"]//div[@class="accordion-heading"]//a[contains(text(),"${arg_menuitem_type}")]
    Wait Until Element Is Visible    xpath=//div[@id="collapseTypes"]//div[@class="accordion-body in collapse"]//a[contains(text(),"${arg_submenuitem_type}")]
	Click Element                    xpath=//div[@id="collapseTypes"]//div[@class="accordion-body in collapse"]//a[contains(text(),"${arg_submenuitem_type}")]  
    Unselect Frame  
    Click Element                    xpath=//div[@id="jform_menutype_chzn"]/a/div/b
    Wait Until Element Is Visible    xpath=//div[@id="jform_menutype_chzn"]/div/ul/li[contains(text(),"${arg_menu_parent}")]
    Click Element                    xpath=//div[@id="jform_menutype_chzn"]/div/ul/li[contains(text(),"${arg_menu_parent}")]                                  
	Click Element                    ${btn_menus_save_close}      
	
Delete Menu Item
    [Arguments]      ${arg_menuitem_title}
    Click Element    xpath=//table[@id="itemList"]//tr[td/a[contains(text(),"${arg_menuitem_title}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input
    Click Element    ${btn_menuitems_trash}

Check Add Menu Item Successfully
    [Arguments]                    ${arg_menuitem_title}
    Page Should Contain Element    xpath=//table[@id="itemList"]//a[contains(text(),"${arg_menuitem_title}")]
        
Check Delete Menu Item Successfully
    [Arguments]                        ${arg_menuitem_title}
    Page Should Not Contain Element    xpath= //table[@id="menuList"]//a[contains(text(),"${arg_menuitem_title}")]
    
Delete All Menu 
    [Arguments]                      ${arg_cellcount}
    FOR    ${index}  IN RANGE   0    ${arg_cellcount}
           ${IsElementVisible}=      Run Keyword And Return Status    Element Should Be Visible   xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        # ${delete_menuelement}=     Get Matching Xpath Count     xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        Run Keyword If               ${IsElementVisible}    Click Element    xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        # Click Element                xpath=//table[@id="menuList"]//tr[td/a]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input[@id="cb1"] 
        Click Element                ${btn_menus_delete} 
        Handle Alert                 ACCEPT  
    END    