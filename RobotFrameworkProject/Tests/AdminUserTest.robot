*** Settings ***
Resource         ../Resources/Setup.robot
Resource         ../Pages/Admin/AdminLoginPage.robot
Resource         ../Pages/Admin/AdminUserPage.robot
Resource         ../Pages/Client/ClientHomePage.robot
Suite setup       Setup
# Suite teardown    Teardown


*** Variables ***
${NEWPASSWORD}    123456789
${EDITPASSWORD}    123123123


*** Test Cases ***
Add New Valid Account
    Login To Joomla                       ${USERNAME}               ${PASSWORD}
    Select Sidebar Menu                   ${lbl_users}
    ${NEWUSERNAME}=                       Generate Random String    10    [LETTERS]
    Set Suite Variable                    ${NEWUSERNAME}
    Add New User Account                  ${NEWUSERNAME}            ${NEWUSERNAME}    ${NEWPASSWORD}    ${NEWUSERNAME}@gmail.com
    Check Add New User Successfully
    Go To                                 ${CLIENT_ROOT}
    Login To Client Site                  ${NEWUSERNAME}            ${NEWPASSWORD}
    Check Login To Client Successfully    ${NEWUSERNAME}
    Logout Client Site
    Go To                                 ${ROOT}
    Logout Admin Site
    
Edit Account Information
    Login To Joomla                       ${USERNAME}               ${PASSWORD}
    Select Sidebar Menu                   ${lbl_users}
    Mouse Over                            xpath=//table[@id="userList"]//tr[td[contains(text(), "${NEWUSERNAME}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a
    Click Element                         xpath=//table[@id="userList"]//tr[td[contains(text(), "${NEWUSERNAME}")]]/td[count(//table[@id="userList"]//tr/th[a[contains(text(), "Name")]]/preceding-sibling::th)+1]/div[@class="name break-word"]/a
    ${EDITUSERNAME}=                      Generate Random String    10    [LETTERS]
    Edit User Account Information         ${EDITUSERNAME}           ${EDITUSERNAME}    ${EDITPASSWORD}    ${EDITUSERNAME}@gmail.com
    Check Edit Account Successfully
    Go To                                 ${CLIENT_ROOT}
    Login To Client Site                  ${EDITUSERNAME}           ${EDITPASSWORD}
    Check Login To Client Successfully    ${EDITUSERNAME}
    Logout Client Site
    Go To                                 ${ROOT}
    Logout Admin Site
    
    
    
    
    
    
    