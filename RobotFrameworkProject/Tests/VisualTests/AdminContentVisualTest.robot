*** Settings ***
Resource          ../../Resources/Setup.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Resource          ../../Pages/Admin/AdminContentPage.robot
Suite Setup       Setup
Suite teardown    Teardown   

    
*** Variables ***
${CONTENT_FIELDS_PAGE}         Fields
${CONTENT_FIELDGROUPS_PAGE}    Field Groups


*** Test Cases ***
TC01 - Check UI Of Content Pages
    Login Admin Site 	                  ${USERNAME}    ${PASSWORD}
    Go To Content Feature Artical Page     
    Percy Snapshot                        Content Feature Artical Page
    Go to Content Pages                   ${CONTENT_FIELDS_PAGE}
    Percy Snapshot                        Content Fields Page
    Go to Content Pages                   ${CONTENT_FIELDGROUPS_PAGE}
    Percy Snapshot                        Content Field Groups Page
    