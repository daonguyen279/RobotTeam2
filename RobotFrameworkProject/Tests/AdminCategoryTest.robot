*** Settings ***
Resource	      ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminCategoryPage.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Suite setup	      Setup
Suite teardown    Teardown


*** Variables ***
${CATEGORY_TITLE}                    Robot Framework is operating system and application independent
${CATEGORY_CONTENT}                  Many years ago Seth Green decided to take his love of action figures and combine it with one of his major passions: stop-motion animation. The idea for Cartoon Network's late-night animated series "Robot Chicken" was born and the animation world suddenly changed.
${CATEGORY_EDIT_TITLE}               Robot Framework is operating system and application independent
${CATEGORY_EDIT_CONTENT}             Long time ago Seth Green decided to take his love of action figures and combine it with one of his major passions: stop-motion animation. The idea for Cartoon Network's late-night animated series "Robot Chicken" was born and the animation world suddenly changed.
${TXT_ADD_MESSAGE_EXPECTED}          Category saved.
${TXT_EIT_MESSAGE_EXPECTED}          1 category trashed.
${TXT_MESSAGE}                       xpath=//div[@class="alert-message"]
${TXT_EDIT_MESSAGE_EXPECTED}         1 category trashed.
${TXT_UNPUBLISH_MESSAGE_EXPECTED}    1 category unpublished.
  
*** Test Cases ***
TC05 - Verify That Admin Can Add A New Category
    ${CATEGORY_ALIAS} =  Generate Random String    12    [LETTERS]
    Login Admin Site              ${USERNAME}           ${PASSWORD}
    Go To Add New Category Page
    Add New Category              ${CATEGORY_TITLE}     ${CATEGORY_CONTENT}            ${CATEGORY_ALIAS}    
    Check Message Successfully    ${TXT_MESSAGE}        ${TXT_ADD_MESSAGE_EXPECTED} 
    Logout Admin Site

TC06 - Verify That Admin Can Edit Category Information
    ${CATEGORY_EDIT_CONTENT} =    Generate Random String    12    [LETTERS]
    ${CATEGORY_EDIT_TITLE} =    Generate Random String    12    [LETTERS]
    Login Admin Site              ${USERNAME}               ${PASSWORD}
    Go To Edit Category Page
    Edit Category Information     ${CATEGORY_EDIT_TITLE}    ${CATEGORY_EDIT_CONTENT}
    Check Message Successfully    ${TXT_MESSAGE}            ${TXT_ADD_MESSAGE_EXPECTED} 
    Delete A Category
    Check Message Successfully    ${TXT_MESSAGE}            ${TXT_EDIT_MESSAGE_EXPECTED} 
    Logout Admin Site

TC07 - Verify That Admin Can Delete A New Category
    ${CATEGORY_ALIAS} =  Generate Random String    12    [LETTERS]
    Login Admin Site              ${USERNAME}           ${PASSWORD}
    Go To Add New Category Page
    Add New Category              ${CATEGORY_TITLE}     ${CATEGORY_CONTENT}            ${CATEGORY_ALIAS}
    Check Message Successfully    ${TXT_MESSAGE}        ${TXT_ADD_MESSAGE_EXPECTED}     
    Delete A Category
    Check Message Successfully    ${TXT_MESSAGE}        ${TXT_EDIT_MESSAGE_EXPECTED} 
    Logout Admin Site

TC08 - Verify That Admin Can Unpublish A Category
    ${CATEGORY_ALIAS} =  Generate Random String    12    [LETTERS]
    Login Admin Site              ${USERNAME}           ${PASSWORD}
    Go To Add New Category Page
    Add New Category              ${CATEGORY_TITLE}     ${CATEGORY_CONTENT}                 ${CATEGORY_ALIAS}
    Check Message Successfully    ${TXT_MESSAGE}        ${TXT_ADD_MESSAGE_EXPECTED} 
    Unpublish A Category
    Check Message Successfully    ${TXT_MESSAGE}        ${TXT_UNPUBLISH_MESSAGE_EXPECTED} 
    Logout Admin Site
