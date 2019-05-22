*** Settings ***
Resource          ../../Resources/SetupBuild2.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Resource          ../../Pages/Admin/AdminManageExtensionsPage.robot
Suite Setup       Setup
Suite teardown    Teardown   

    
*** Variables ***
${MANAGE_EXTENSION_MANAGE_PAGE}        Manage
${MANAGE_EXTENSION_DISCOVER_PAGE}      Discover
${MANAGE_EXTENSION_WARNING_PAGE}       Warnings
${MANAGE_EXTENSION_LANGUAGE_PAGE}      Install Languages  
${MANAGE_EXTENSION_UPDATESITE_PAGE}    Update Sites


*** Test Cases ***
TC01 - Check UI Of Manage Extensions Pages
    Login Admin Site 	                    ${USERNAME}    ${PASSWORD}
    Go To Manage Extensions Install page 
    Percy Snapshot                          Manage Extensions Install Page
    Go to Manage Etensions                  ${MANAGE_EXTENSION_MANAGE_PAGE}
    Percy Snapshot                          Manage Extensions Manage Page
    Go to Manage Etensions                  ${MANAGE_EXTENSION_DISCOVER_PAGE}
    Percy Snapshot                          Manage Extensions Discover Page
    Go to Manage Etensions                  ${MANAGE_EXTENSION_WARNING_PAGE}
    Percy Snapshot                          Manage Extensions Warnings Page
    Go to Manage Etensions                  ${MANAGE_EXTENSION_LANGUAGE_PAGE}
    Percy Snapshot                          Manage Extensions Language Page
    Go to Manage Etensions                  ${MANAGE_EXTENSION_UPDATESITE_PAGE}
    Percy Snapshot                          Manage Extensions Update Site Page
    
    