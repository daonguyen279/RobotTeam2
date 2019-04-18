*** Settings ***
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminProfilePage.robot
Test setup	    Setup
Test teardown	Teardown


*** Variables ***
${USERNAME}            hongdao279
${PASSWORD}            hihi123
${NAME}           hihi
${PASSWORD}      description
${CONFIRMPASSWORD}    huhu123


*** Test Cases ***
Valid update admin profile
    Login to Wordpress    ${USERNAME}    ${PASSWORD}    
    Select menu           ${menu_users}       
    Go to admin profile page    
    ${RANEMIAL}=    Generate Random String    4   [LETTERS]       
    Fill out and submit update information     ${FIRSTNAME}    ${LASTNAME}    ${NICKNAME}    ${DISPLAYNAME}    ${RANEMIAL}@sharklasers.com    ${WEBSITE}    ${BIOGRAPHYINFOR}    ${GENERATEPASSWORD}    
    Logout    
    Login to Wordpress    ${USERNAME}   ${GENERATEPASSWORD}    
    Element Text Should Be    ${lbl_account}     Howdy, ${DISPLAYNAME}         
    Select menu           ${menu_users}       
    Go to admin profile page    
    ${RANEMIAL}=    Generate Random String    4   [LETTERS]       
    Fill out and submit update information     ${FIRSTNAME}    ${LASTNAME}    ${NICKNAME}    ${DISPLAYNAME}    ${RANEMIAL}@sharklasers.com    ${WEBSITE}    ${BIOGRAPHYINFOR}    ${PASSWORD}  