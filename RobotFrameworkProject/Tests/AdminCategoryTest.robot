*** Settings ***
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminCategoryPage.robot
Resource    ../Pages/Admin/AdminLoginPage.robot
Test setup	    Setup
Test teardown	Teardown


*** Variables ***
${arg_title_categories}          the saff tet Teyuyefr ad dfa dsfav e added for 2 mv inutesfggfd
${arg_cont_categories}           ret e1ejki6 yasecars ago Seth Green decided to take his love of action figures and combine it with one of his major passions: stop-motion animation. The idea for Cartoon Network's late-night animated series "Robot Chicken" was born and the animation world suddenly changed.
${arg_title_categories_edit}     ree tyeig  jikac]hyuThidasrs is thie second tittle, which have added for 2 minutes
${arg_cont_categories_edit}      ree iyet16 asyears ago Seth Green decided to take his love of action figures and combine it with one of his major passions: stop-motion animation. The idea for Cartoon Network's late-night animated series "Robot Chicken" was born and the animation world suddenly changed.
${txt_expected_message}          1 category saved.
${txt_expected_message1}         1 category trashed.


*** Test Cases ***
TC05 - Verify that admin can add a new category
    Login Admin Site                ${USERNAME}                 ${PASSWORD}
    Add New Category                ${arg_title_categories}     ${arg_cont_categories}
    Check message successfully      ${lbl_message}              ${txt_expected_message} 
    
TC06 - Verify that admin can edit category information
    Login Admin Site    ${USERNAME}    ${PASSWORD}
    Edit Category Information        ${arg_title_categories_edit}     ${arg_cont_categories_edit}
    
TC07 - Verify that admin can delete a category
    Login Admin Site                   ${USERNAME}    ${PASSWORD}
    Add New Category                   ${arg_title_categories}     ${arg_cont_categories}
    Delete a category
    Check message successfully         ${txt_message}    ${txt_expected_message1}
    
TC08 - Verify that admin can unpublish a category
    Login Admin Site    ${USERNAME}    ${PASSWORD}
    Unpublish a category
