*** Settings ***
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminCategoryPage.robot
Resource    ../Pages/Admin/AdminLoginPage.robot
Test setup	    Setup
Test teardown	Teardown


*** Variables ***
${arg_title_categories}          tetTeeerhjkisi is the first tittle, which have added for 2 minutesfggfd
${arg_cont_categories}           rete1ejki6 years ago Seth Green decided to take his love of action figures and combine it with one of his major passions: stop-motion animation. The idea for Cartoon Network's late-night animated series "Robot Chicken" was born and the animation world suddenly changed.
${arg_title_categories_edit}     reeteijkhyThis is the second tittle, which have added for 2 minutes
${arg_cont_categories_edit}      reeiyet16 years ago Seth Green decided to take his love of action figures and combine it with one of his major passions: stop-motion animation. The idea for Cartoon Network's late-night animated series "Robot Chicken" was born and the animation world suddenly changed.
${txt_expected_message}          Category saved.
${txt_expected_message1}           category trashed.


*** Test Cases ***
${c}=    Set Variable   ${number}${txt_expected_message1}
TC05 - Verify that admin can add a new category
    Login To Joomla                 ${USERNAME}                 ${PASSWORD}
    Add New Category                ${arg_title_categories}     ${arg_cont_categories}
    Check message successfully      ${lbl_message}     ${txt_expected_message} 
    
TC06 - Verify that admin can edit category information
    Login To Joomla    ${USERNAME}    ${PASSWORD}
    Edit Category Information        ${arg_title_categories_edit}     ${arg_cont_categories_edit}
    
TC07 - Verify that admin can delete a category  
    Login To Joomla    ${USERNAME}    ${PASSWORD}
    Delete a category
    Check message successfully      ${lbl_message}     ${c}
TC08 - Verify that admin can unpublish a category
    Login To Joomla    ${USERNAME}    ${PASSWORD}