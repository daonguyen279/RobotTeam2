*** Settings ***
Resource	      ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Resource          ../Pages/Admin/AdminMenuPage.robot
Resource          ../Pages/Admin/AdminHomePage.robot
Suite setup	      Setup
Suite teardown    Teardown

*** Variables ***
${MENU_DESCRIPTION}     tesst menu in joomla
${MENUITEM_TYPE}        Articles
${SUB_MENUITEM_TYPE}    Archived Articles 

*** Test Cases ***
TC-014: Add A New Menu Successfully
    Login Admin Site 	                       ${USERNAME}      ${PASSWORD}
    Select Sidebar Menu                        ${lbl_menus}  
    Go To Add New Menu Page       
    ${MENU_TITLE}=   Generate Random String    4                [LETTERS]      
    ${MENUTYPE}=    Generate Random String     4                [LETTERS] 
    Fill Out And Submit Menu Information       ${MENU_TITLE}    ${MENUTYPE}    ${MENU_DESCRIPTION}
    Check Message                              Menu saved
    Check Add New Menu Successfully            ${MENU_TITLE}
    Set Suite Variable                         ${MENU_TITLE} 
    Logout Admin Site 
    
TC-015: Add A Menu Item Successfully
    Login Admin Site 	                           ${USERNAME}          ${PASSWORD}
    Select Sidebar Menu                            ${lbl_menus}     
    Go To Add New Menu Item Page
    ${MENUITEM_TITLE}=   Generate Random String    4                    [LETTERS]
    Fill Out And Submit Menu Item Information      ${MENUITEM_TITLE}    ${MENUITEM_TYPE}    ${SUB_MENUITEM_TYPE}    ${MENU_TITLE}
    Check Message                                  Menu item saved. 
    Set Suite Variable                             ${MENUITEM_TITLE} 
    Check Add Menu Item Successfully               ${MENUITEM_TITLE}
    Logout Admin Site
     
TC-017: Delete A Menu Item Sucessfully 
    Login Admin Site                       ${USERNAME}             ${PASSWORD}
    Select Sidebar Menu                    ${lbl_menus}
    Go To Menu Item Page
    Delete Menu Item                       ${MENUITEM_TITLE} 
    Check Message                          1 menu item trashed.    
    Check Delete Menu Item Successfully    ${MENUITEM_TITLE}  
    Logout Admin Site
    
TC-016: Delete A Menu Successfully
    Login Admin Site 	              ${USERNAME}           ${PASSWORD}
    Select Sidebar Menu               ${lbl_menus}
    Delete Menu                       ${MENU_TITLE} 
    Check Message                     Menu type deleted.    
    Check Delete Menu Successfully    ${MENU_TITLE}
    Logout Admin Site

Delete All Menu
    Login Admin Site 	              ${USERNAME}         ${PASSWORD}
    Select Sidebar Menu               ${lbl_menus}     
    Go To Menu Page
    Select ID Ascending  
    ${count}     Get Element Count    ${lbl_menus_list}  
    Delete All Menu                   ${count}
    	

 
    