*** Settings ***
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminLoginPage.robot
Resource    ../Pages/Admin/AdminProfilePage.robot
Resource    ../Pages/Admin/AdminHomePage.robot
Suite setup	    Setup
Suite teardown	Teardown

*** Variables ***
${USERNAME1}	    hihi
${PASSWORD1}     123456789
${UPDATENAME}         dao nguyen
${UPDATEPASSWORD}     1234567890

*** Test Cases ***
Valid Update Admin Profile
    Login To Joomla                           ${USERNAME1}      ${PASSWORD1}
    Go To Admin Profile Page  
    ${RANEMIAL}=    Generate Random String    4                [LETTERS]   
    Fill Out And Submit Update Information    ${UPDATENAME}    ${UPDATEPASSWORD}    ${UPDATEPASSWORD}   ${RANEMIAL}@sharklasers.com              
    Check Message Successfully Display
# ---------- check login with update account successfully ----------           
    Logout    
    Login To Joomla                           ${USERNAME1}       ${UPDATEPASSWORD}  
# ----------reset account infformation ---------- 
    Go To Admin Profile Page 
    Fill Out And Submit Update Information    ${UPDATENAME}     ${PASSWORD1}         ${PASSWORD1}          ${RANEMIAL}@sharklasers.com            
    