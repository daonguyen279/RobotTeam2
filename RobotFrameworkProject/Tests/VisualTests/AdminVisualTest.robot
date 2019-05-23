*** Settings ***
Resource          ../../Resources/SetupBUild2.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Resource          ../../Pages/Admin/AdminHomePage.robot
Resource          ../../Pages/Admin/AdminHelpPage.robot
Resource          ../../Pages/Admin/AdminLoginPage.robot
Resource          ../../Pages/Admin/AdminManageExtensionsPage.robot
Resource          ../../Pages/Admin/AdminModulesExtensionsPage.robot
Resource          ../../Pages/Admin/AdminPluginsExtensionsPage.robot
Resource          ../../Pages/Admin/AdminBannersComponentsPage.robot
Resource          ../../Pages/Admin/AdminTemplatesPage.robot
Resource          ../../Pages/Admin/AdminContentPage.robot
Suite Setup       Setup
Suite teardown    Teardown       


*** Variables ***
${USERNAME}                            visualtest
${PASSWORD}                            123456789
${MANAGE_EXTENSION_MANAGE_PAGE}        Manage
${MANAGE_EXTENSION_DISCOVER_PAGE}      Discover
${MANAGE_EXTENSION_WARNING_PAGE}       Warnings
${MANAGE_EXTENSION_LANGUAGE_PAGE}      Install Languages  
${MANAGE_EXTENSION_UPDATESITE_PAGE}    Update Sites
${TEMPLATE_STYLES_PAGE}                Styles
${TEMPLATE_TEMPLATES_PAGE}             Templates
${COMPONENT_CATEGORY}                  Categories
${COMPONENT_CLIENT}                    Clients
${COMPONENT_TRACK}                     Tracks
${CONTENT_FIELDS_PAGE}                 Fields
${CONTENT_FIELDGROUPS_PAGE}            Field Groups


*** Test Cases ***
TC01 - UI Of Joomla Login Page Display Correctly
    Percy Snapshot                Login
    
TC02 - UI Of Joomla Help Page Display Correctly   
    Login Admin Site              ${USERNAME}    ${PASSWORD}
    Go To Joomla Help Page
    Percy Snapshot                Articles Page
    Logout Admin Site
    
TC03 - UI Of Manage Extensions Pages Display Correctly
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
    Logout Admin Site
    
TC04 - UI Of Modules Page Display Correctly
    Login Admin Site                 ${USERNAME}    ${PASSWORD}
    Go To Extensions Modules Page
    Percy Snapshot                   Modules Page
    Logout Admin Site
    
TC05 - UI Of Joomla Plugins Extentions Page Display Correctly   
    Login Admin Site                        ${USERNAME}    ${PASSWORD}
    Go To Joomla Plugins Extentions Page
    Percy Snapshot                          Categories Page
    Logout Admin Site
    
TC06 - UI Of Joomla Templates Page Display Correctly
    Login Admin Site                        ${USERNAME}    ${PASSWORD}
    Go To Templates Page
    Percy Snapshot                          Templates Extensions Page
    Go To Templates Extensions Page         ${TEMPLATE_STYLES_PAGE}
    Percy Snapshot                          Styles Page
    Go To Templates Extensions Page         ${TEMPLATE_TEMPLATES_PAGE}
    Percy Snapshot                          Templates Page  
    Logout Admin Site
    
TC07 - UI Of Banners Page Display Correctly
    Login Admin Site               ${USERNAME}    ${PASSWORD}
    Go To Banners Page
    Percy Snapshot                 Banners Page
    Go To Banners Content Pages    ${COMPONENT_CATEGORY} 
    Percy Snapshot                 Categories Banners Page
    Go To Banners Content Pages    ${COMPONENT_CLIENT}
    Percy Snapshot                 Clients Banners Page
    Go To Banners Content Pages    ${COMPONENT_TRACK}
    Percy Snapshot                 Tracks Banners Page
    Logout Admin Site
    
TC08 - Check UI Of Content Pages
    Login Admin Site 	                  ${USERNAME}    ${PASSWORD}
    Go To Content Feature Artical Page     
    Percy Snapshot                        Content Feature Artical Page
    Go to Content Pages                   ${CONTENT_FIELDS_PAGE}
    Percy Snapshot                        Content Fields Page
    Go to Content Pages                   ${CONTENT_FIELDGROUPS_PAGE}
    Percy Snapshot                        Content Field Groups Page