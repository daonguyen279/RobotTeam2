*** Settings ***
Resource    ../../Pages/Admin/AdminHomePage.robot


*** Variables ***
${btn_menus_list}               xpath=//ul[@id="submenu"]/li/a[contains(text(),"Menus")]
${btn_menus_add}                xpath=//div[@id="toolbar-new"]/button
${btn_menuitems_list}           xpath=//ul[@id="submenu"]//a[contains(text(),"Menu Items")]
${btn_menus_edit}               xpath=//div[@id="toolbar-edit"]/button
${btn_menus_delete}             xpath=//div[@id="toolbar-delete"]/button
${txt_menus_title}              xpath=//form[@id="item-form"]//input[@id="jform_title"]
${txt_menus_type}               xpath=//div[@class="form-horizontal"]//input[@id="jform_menutype"]
${txt_menus_description}        xpath=//div[@class="form-horizontal"]//input[@id="jform_menudescription"]
${btn_menus_save_close}         xpath=//div[@id="toolbar-save"]/button
${txt_menuitems_title}          xpath=//form[@id="item-form"]//input[@id="jform_title"]
${btn_menuitems_type}           xpath=//div[@class="controls"]//button[@class="btn btn-primary"]
${btn_menuitems_trash}          xpath=//div[@id="toolbar-trash"]/button
${lbl_menus_list}               xpath=//table[@id="menuList"]//tr[@class="row0" and "row1"]
${cbb_menuitems_arrange}        xpath=//div[@id="list_fullordering_chzn"]/a
${opt_menuitems_idacsending}    xpath=//div[@id="list_fullordering_chzn"]/div/ul/li[contains(text(),"ID ascending")]
${ifr_menus}                    xpath=//div[@id="menuTypeModal"]//iframe
${cbx_menus_parent}             xpath=//div[@id="jform_menutype_chzn"]/a/div/b

#xpath template
${xph_menus_title}              xpath= //table[@id="menuList"]//a[contains(text(),"{}")]
${xph_menus_checkbox}           xpath=//table[@id="menuList"]//tr[td/a[contains(text(),"{}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+1]/input
${xph_menuitems_type}           xpath=//div[@id="collapseTypes"]//div[@class="accordion-heading"]//a[contains(text(),"{}")]
${xph_submenuitems_type}        xpath=//div[@id="collapseTypes"]//div[@class="accordion-body in collapse"]//a[contains(text(),"{}")]
${xph_menus_parent}             xpath=//div[@id="jform_menutype_chzn"]/div/ul/li[contains(text(),"{}")]
${xph_menuitems_checkbox}       xpath=//table[@id="itemList"]//tr[td/a[contains(text(),"{}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Title")]]/preceding-sibling::th)+2]/input
${xph_menuitems_title}          xpath=//table[@id="itemList"]//a[contains(text(),"{}")] 


*** Keywords ***
Go To Menu Page
    Click Element    ${btn_menus_list}

Go To Add New Menu Page
    Select Sidebar Menu    ${lbl_menus}  
    Click Element          ${btn_menus_list} 
    Click Element          ${btn_menus_add} 

Fill Out And Submit Menu Information
    [Arguments]      ${arg_menu_title}           ${arg_menu_type}           ${arg_menu_description}  
    Input Text       ${txt_menus_title}          ${arg_menu_title}	
    Input Text       ${txt_menus_type}           ${arg_menu_type}
    Input Text       ${txt_menus_description}    ${arg_menu_description}                                                        
    Click Element    ${btn_menus_save_close}    

Check Add New Menu Successfully
    [Arguments]                        ${arg_menu_title}
    ${menus_title}    Format String    ${xph_menus_title}    ${arg_menu_title}
    Element Should Be Visible          ${menus_title}    

Select ID Ascending
    Click Element    ${cbb_menuitems_arrange}
    Click Element    ${opt_menuitems_idacsending} 

Delete Menu
   [Arguments]                           ${arg_menu_to_delete}
   ${menus_checkbox}    Format String    ${xph_menus_checkbox}    ${arg_menu_to_delete}  
   Wait Until Element Is Visible         ${menus_checkbox}  
   Click Element                         ${menus_checkbox}    
   Click Element                         ${btn_menus_delete}	
   Handle Alert                          ACCEPT

Check Delete Menu Successfully
    [Arguments]                        ${arg_menu_title}
    ${menus_title}    Format String    ${xph_menus_title}    ${arg_menu_title}
    Page Should Not Contain Element    ${menus_title}    

Go To Menu Item Page  
    Click Element	 ${btn_menuitems_list}
       
Go To Add New Menu Item Page   
    Click Element    ${btn_menuitems_list}
    Click Element	 ${btn_menus_add}  
 
Fill Out And Submit Menu Item Information
    [Arguments]                              ${arg_menuitem_title}	     ${arg_menuitem_type}	    ${arg_submenuitem_type}    ${arg_menu_parent}   
    ${menuitems_type}       Format String    ${xph_menuitems_type}       ${arg_menuitem_type} 
    ${submenuitems_type}    Format String    ${xph_submenuitems_type}    ${arg_submenuitem_type}                
    ${menus_parent}         Format String    ${xph_menus_parent}         ${arg_menu_parent}    
    Input Text                               ${txt_menuitems_title}      ${arg_menuitem_title}    
    Click Element 	                         ${btn_menuitems_type}
    Select Frame                             ${ifr_menus}  
    Wait Until Element Is Visible            ${menuitems_type}
    Select Frame                             ${ifr_menus}               
    Click Element                            ${menuitems_type}
    Wait Until Element Is Visible            ${submenuitems_type}       
    Click Element                            ${submenuitems_type}  
    Unselect Frame  
    Click Element                            ${cbx_menus_parent}
    Wait Until Element Is Visible            ${menus_parent}
    Click Element                            ${menus_parent}                                  
    Click Element                            ${btn_menus_save_close}        
	
Delete Menu Item
    [Arguments]                               ${arg_menuitem_title}
    ${menuitems_checkbox}    Format String    ${xph_menuitems_checkbox}    ${arg_menuitem_title}
    Click Element                             ${menuitems_checkbox}        
    Click Element                             ${btn_menuitems_trash}

Check Add Menu Item Successfully
    [Arguments]                                   ${arg_menuitem_title}
    ${xpath_menuitems_title}     Format String    ${xph_menuitems_title}      ${arg_menuitem_title}
    Element Should Be Visible                     ${xpath_menuitems_title}        

Check Delete Menu Item Successfully
    [Arguments]                                  ${arg_menuitem_title}
    ${xpath_menuitems_title}    Format String    ${xph_menuitems_title}      ${arg_menuitem_title}
    Page Should Not Contain Element              ${xpath_menuitems_title}        
    
Delete All Menu 
    [Arguments]                      ${arg_cellcount}
    FOR    ${index}  IN RANGE   0    ${arg_cellcount}
           ${IsElementVisible}=      Run Keyword And Return Status    Element Should Be Visible   ${slt_menus_list} 
        Run Keyword If               ${IsElementVisible}              Click Element               ${slt_menus_list} 
        Click Element                ${btn_menus_delete} 
        Handle Alert                 ACCEPT  
    END  