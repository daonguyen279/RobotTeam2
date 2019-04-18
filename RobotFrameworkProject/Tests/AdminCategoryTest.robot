# *** Settings ***
# Resource	     ../Resources/Setup.robot
# Resource         ../Pages/Admin/AdminCategoryPage.robot
# Test setup       Setup
# Test teardown    Teardown


# *** Variables ***
# ${arg_title_categories}       This is the first tittle, which have added for 2 minutes
# ${arg_cont_categories}        16 years ago Seth Green decided to take his love of action figures and combine it with one of his major passions: stop-motion animation. The idea for Cartoon Network's late-night animated series "Robot Chicken" was born and the animation world suddenly changed.


# *** Test Cases ***
# Valid Login
    # Login to Wordpress    ${arg_title_categories}    ${arg_cont_categories}
    # Check login successfully

*** Settings ***
Resource	../Resources/Setup.robot
Resource    ../Pages/Admin/AdminCategoryPage.robot
Resource    ../Pages/Admin/AdminLoginPage.robot
Test setup	    Setup
Test teardown	Teardown


*** Variables ***
${USERNAME}	                    admin
${PASSWORD}	                    123456789
${arg_title_categories}         This is the first tittle, which have added for 2 minutes
${arg_cont_categories}          16 years ago Seth Green decided to take his love of action figures and combine it with one of his major passions: stop-motion animation. The idea for Cartoon Network's late-night animated series "Robot Chicken" was born and the animation world suddenly changed.




*** Test Cases ***
Valid update admin profile
    Login To Joomla    ${USERNAME}    ${PASSWORD}
    Add New Category    ${arg_title_categories}     ${arg_cont_categories}    
