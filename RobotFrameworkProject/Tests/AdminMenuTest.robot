*** Settings ***
Resource          ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Resource          ../Pages/Admin/AdminMenuPage.robot
Resource          ../Pages/Admin/AdminHomePage.robot
Suite setup       Setup
# Suite teardown    Teardown

*** Variables ***
${MENU_DESCRIPTION}     tesst menu in joomla
${MENUITEM_TYPE}        Articles
${SUB_MENUITEM_TYPE}    Archived Articles 

*** Test Cases ***
TC14 - Add A New Menu Successfully
    Login Admin Site 	                       ${USERNAME}      ${PASSWORD} 
    Go To Add New Menu Page       
    ${MENU_TITLE}=   Generate Random String    4                [LETTERS]      
    ${MENUTYPE}=    Generate Random String     4                [LETTERS] 
    Fill Out And Submit Menu Information       ${MENU_TITLE}    ${MENUTYPE}    ${MENU_DESCRIPTION}
    Check Message                              Menu saved
    Check Add New Menu Successfully            ${MENU_TITLE}
    Delete Menu                                ${MENU_TITLE} 
    Logout Admin Site 
    
TC15 - Add A Menu Item Successfully
    Login Admin Site 	                           ${USERNAME}          ${PASSWORD}
    Go To Add New Menu Page       
    ${MENU_TITLE}=   Generate Random String        4                    [LETTERS]      
    ${MENUTYPE}=    Generate Random String         4                    [LETTERS] 
    Fill Out And Submit Menu Information           ${MENU_TITLE}        ${MENUTYPE}         ${MENU_DESCRIPTION}
    Go To Add New Menu Item Page
    ${MENUITEM_TITLE}=   Generate Random String    4                    [LETTERS]
    Fill Out And Submit Menu Item Information      ${MENUITEM_TITLE}    ${MENUITEM_TYPE}    ${SUB_MENUITEM_TYPE}    ${MENU_TITLE}
    Check Message                                  Menu item saved. 
    Check Add Menu Item Successfully               ${MENUITEM_TITLE}
    Delete Menu Item                               ${MENUITEM_TITLE} 
    Go To Menu Page
    Delete Menu                                    ${MENU_TITLE}      
    Logout Admin Site
     
TC17 - Delete A Menu Item Sucessfully 
    Login Admin Site                               ${USERNAME}             ${PASSWORD}
    Go To Add New Menu Page       
    ${MENU_TITLE}=   Generate Random String        4                       [LETTERS]      
    ${MENUTYPE}=    Generate Random String         4                       [LETTERS] 
    Fill Out And Submit Menu Information           ${MENU_TITLE}           ${MENUTYPE}         ${MENU_DESCRIPTION}
    Go To Add New Menu Item Page
    ${MENUITEM_TITLE}=   Generate Random String    4                       [LETTERS]
    Fill Out And Submit Menu Item Information      ${MENUITEM_TITLE}       ${MENUITEM_TYPE}    ${SUB_MENUITEM_TYPE}    ${MENU_TITLE}
    Delete Menu Item                               ${MENUITEM_TITLE} 
    Check Message                                  1 menu item trashed.            
    Check Delete Menu Item Successfully            ${MENUITEM_TITLE}
    Go To Menu Page
    Delete Menu                                    ${MENU_TITLE}      
    Logout Admin Site
    
TC16 - Delete A Menu Successfully
    Login Admin Site 	                      ${USERNAME}            ${PASSWORD}
    Go To Add New Menu Page       
    ${MENU_TITLE}=   Generate Random String    4                     [LETTERS]      
    ${MENUTYPE}=    Generate Random String     4                     [LETTERS] 
    Fill Out And Submit Menu Information       ${MENU_TITLE}         ${MENUTYPE}    ${MENU_DESCRIPTION}
    Delete Menu                                ${MENU_TITLE} 
    Check Message                              Menu type deleted.            
    Check Delete Menu Successfully             ${MENU_TITLE}
    Logout Admin Site
