*** Settings ***
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminLoginPage.robot
Resource    ../Pages/Admin/AdminMenuPage.robot
Resource    ../Pages/Admin/AdminHomePage.robot
Suite setup	    Setup
Suite teardown	Teardown

*** Variables ***
${MENUDESCRIPTION}    tesst menu in joomla       

*** Test Cases ***
Add menu successfully
    Login To Joomla 	        ${USERNAME}      ${PASSWORD}
    Select Sidebar Menu         ${lbl_menus}  
    Go To Add New Menu Page 
    ${MENUTITLE}=   Generate Random String    4                [LETTERS]      
    ${MENUTYPE}=   Generate Random String    4                [LETTERS] 
    Fill Out And Submit Menu Information   ${MENUTITLE}   ${MENUTYPE}   ${MENUDESCRIPTION}
    Page Should Contain Element  xpath= //table[@id="menuList"]//a[contains(text(),"${MENUTITLE}")] 	
 Add menu item successfully
    Select Sidebar Menu         ${lbl_menus} 
    