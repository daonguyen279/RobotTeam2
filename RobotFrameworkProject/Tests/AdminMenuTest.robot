*** Settings ***
Resource          ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Resource          ../Pages/Admin/AdminMenuPage.robot
Resource          ../Pages/Admin/AdminHomePage.robot
Suite setup       Setup
# Suite teardown    Teardown


*** Variables ***
${MENU_DESCRIPTION}           tesst menu in joomla
${MENUITEM_TYPE}              Articles
${SUB_MENUITEM_TYPE}          Archived Articles
${MESSAGE_NEW_MENU}           Menu saved  
${MESSAGE_NEW_MENUITEM}       Menu item saved.
${MESSAGE_DELETE_MENUITEM}    1 menu item trashed.
${MESSAGE_DELETE_MENU}        Menu type deleted.


*** Test Cases ***
TC14 - Add A New Menu Successfully
    ${MENU_TITLE}=    Generate Random String    4                      [LETTERS]      
    ${MENUTYPE}=      Generate Random String    4                      [LETTERS] 
    Login Admin Site 	                        ${USERNAME}            ${PASSWORD} 
    Go To Add New Menu Page       
    Fill Out And Submit Menu Information        ${MENU_TITLE}          ${MENUTYPE}    ${MENU_DESCRIPTION}
    Check Message                               ${MESSAGE_NEW_MENU}
    Check Add New Menu Successfully             ${MENU_TITLE}
    Delete Menu                                 ${MENU_TITLE} 
    Logout Admin Site 
    Percy Snapshot                              add
    
TC15 - Add A Menu Item Successfully
    ${MENU_TITLE}=        Generate Random String    4                          [LETTERS]      
    ${MENUTYPE}=          Generate Random String    4                          [LETTERS] 
    ${MENUITEM_TITLE}=    Generate Random String    4                          [LETTERS]
    Login Admin Site 	                            ${USERNAME}                ${PASSWORD}
    Go To Add New Menu Page       
    Fill Out And Submit Menu Information            ${MENU_TITLE}              ${MENUTYPE}         ${MENU_DESCRIPTION}
    Go To Add New Menu Item Page
    Fill Out And Submit Menu Item Information       ${MENUITEM_TITLE}          ${MENUITEM_TYPE}    ${SUB_MENUITEM_TYPE}    ${MENU_TITLE}
    Check Message                                   ${MESSAGE_NEW_MENUITEM}
    Check Add Menu Item Successfully                ${MENUITEM_TITLE}
    Delete Menu Item                                ${MENUITEM_TITLE} 
    Go To Menu Page
    Delete Menu                                     ${MENU_TITLE}      
    Logout Admin Site
     
TC17 - Delete A Menu Item Sucessfully 
    ${MENU_TITLE}=        Generate Random String    4                             [LETTERS]      
    ${MENUTYPE}=          Generate Random String    4                             [LETTERS] 
    ${MENUITEM_TITLE}=    Generate Random String    4                             [LETTERS]
    Login Admin Site                                ${USERNAME}                   ${PASSWORD}
    Go To Add New Menu Page       
    Fill Out And Submit Menu Information            ${MENU_TITLE}                 ${MENUTYPE}         ${MENU_DESCRIPTION}
    Go To Add New Menu Item Page
    Fill Out And Submit Menu Item Information       ${MENUITEM_TITLE}             ${MENUITEM_TYPE}    ${SUB_MENUITEM_TYPE}    ${MENU_TITLE}
    Delete Menu Item                                ${MENUITEM_TITLE} 
    Check Message                                   ${MESSAGE_DELETE_MENUITEM}           
    Check Delete Menu Item Successfully             ${MENUITEM_TITLE}
    Go To Menu Page
    Delete Menu                                     ${MENU_TITLE}      
    Logout Admin Site
    
TC16 - Delete A Menu Successfully
    ${MENU_TITLE}=    Generate Random String    4                         [LETTERS]      
    ${MENUTYPE}=      Generate Random String    4                         [LETTERS] 
    Login Admin Site 	                        ${USERNAME}               ${PASSWORD}
    Go To Add New Menu Page       
    Fill Out And Submit Menu Information        ${MENU_TITLE}             ${MENUTYPE}    ${MENU_DESCRIPTION}
    Delete Menu                                 ${MENU_TITLE} 
    Check Message                               ${MESSAGE_DELETE_MENU}            
    Check Delete Menu Successfully              ${MENU_TITLE}
    Logout Admin Site