*** Settings ***
Resource	     ../Resources/Setup.robot
Resource         ../Pages/Admin/AdminArticlePage.robot
Test setup       Setup
Test teardown    Teardown


*** Variables ***
${TITLE}       Hello Dong
${CONTENT}     My name is Dong, I'm 20 years old. I am a student at PNV


*** Test Cases ***
Add New Article
    Add New Article    ${TITLE}    ${CONTENT}
 