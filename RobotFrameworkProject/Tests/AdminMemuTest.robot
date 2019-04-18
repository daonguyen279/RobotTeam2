*** Settings ***
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminLoginPage.robot
Resource    ../Pages/Admin/AdminMenuPage.robot
Resource    ../Pages/Admin/AdminHomePage.robot
Test setup	    Setup
# Test teardown	Teardown

*** Variables ***
${MENUDESCRIPTION}    tesst menu in joomla       

*** Test Cases ***
Valid Update Admin Profile
    Login To Joomla 	        ${USERNAME}      ${PASSWORD}
    Select Sidebar Menu         ${lbl_menus}  
    Go To Add New Menu Page 
    ${MENUTITLE}=   Generate Random String    4                [LETTERS]      
    ${MENUTYPE}=   Generate Random String    4                [LETTERS] 
    Fill Out And Submit Update Information   ${MENUTITLE}   ${MENUTYPE}   ${MENUDESCRIPTION}
    Page Should Contain Element  xpath= //table[@id="menuList"]//a[contains(text(),"${MENUTITLE}")] 	
