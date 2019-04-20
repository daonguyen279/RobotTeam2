*** Settings ***
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminLoginPage.robot
Resource    ../Pages/Admin/AdminMenuPage.robot
Resource    ../Pages/Admin/AdminHomePage.robot
Suite setup	    Setup
Suite teardown	Teardown

*** Variables ***
${MENUDESCRIPTION}    tesst menu in joomla
${MENUITEMTYPE}       Articles
${SUBMENUITEMTYPE}    Archived Articles 

*** Test Cases ***
Add Menu Successfully
    Login Admin Site 	        ${USERNAME}      ${PASSWORD}
    Select Sidebar Menu         ${lbl_menus}  
    Go To Add New Menu Page       
    ${MENUTITLE}=   Generate Random String    4                [LETTERS]      
    ${MENUTYPE}=   Generate Random String    4                [LETTERS] 
    Fill Out And Submit Menu Information   ${MENUTITLE}   ${MENUTYPE}   ${MENUDESCRIPTION}
    Check Add New Menu Successfully            ${MENUTITLE}
    Set Suite Variable                     ${MENUTITLE} 
    Logout Admin Site 
 
Delete A Menu Successfully
    Login Admin Site 	              ${USERNAME}      ${PASSWORD}
    Select Sidebar Menu               ${lbl_menus}
    Delete Menu                       ${MENUTITLE} 
    Check Delete Menu Successfully    ${MENUTITLE}
    Logout Admin Site 

Delete All Menu Accept Main Menu
    Login Admin Site 	              ${USERNAME}      ${PASSWORD}
    Select Sidebar Menu               ${lbl_menus}   
    ${count}     Get Element Count    ${lbl_listmenuitem}
    Delete all menu  ${count}
    	
# Add Menu Item Successfully
    # Login Admin Site 	        ${USERNAME}      ${PASSWORD}
    # Select Sidebar Menu         ${lbl_menus} 
    # Go To Add New Menu Item Page
    # ${MENUITEMTITLE}=   Generate Random String    4                [LETTERS]
    # Fill Out And Submit Menu Item Information    ${MENUITEMTITLE}    ${MENUITEMTYPE}    ${SUBMENUITEMTYPE}    ${MENUTITLE} 
    # Set Suite Variable          ${MENUITEMTITLE} 
    # Logout Admin Site
    
 # Delete Menu Item Sucessfully
    # Login To Joomla
    # Select Siderbar Menu        ${lbl_menus}
    # Go To Menu Item Page
    # Delete Menu Item            ${MENUITEMTITLE}
    