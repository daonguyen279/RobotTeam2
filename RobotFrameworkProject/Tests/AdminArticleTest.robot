*** Settings ***
Resource          ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminArticlePage.robot
Resource          ../Pages/Admin/AdminLoginPage.robot
Suite Setup       Setup
Suite teardown    Teardown    


*** Variables ***
${ARTICLE_CONTENT}          IT BEGAN WITH A TRICKLE — curious developments that mostly raised more questions. There was evidence of election hacking — but could it really have been directed by the Kremlin? Certain Americans on Facebook, pitching for Donald J. Trump and stirring up anger, turned out to be impostors — but who had concocted them? 
${ARTICLE_CHECK_MESSAGE}    Article saved.
${ARTICLE_EDIT_TITLE}       Glimpses of the Mystery   


*** Test Cases ***
TC01 - Add A New Aticle
    [Tags]    1.0
    ${ARTICLE_ALIAS}=    Generate Random String    12                          [LETTERS]
    ${ARTICLE_TITLE}=    Generate Random String    30                          [LETTERS]     
    Login Admin Site                               ${USERNAME}                 ${PASSWORD}
    Go To Add New Article Page      
    Add New Article                                ${ARTICLE_TITLE}            ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Check Add New Article Sucessfully              ${ARTICLE_TITLE}
    Check Message                                  ${ARTICLE_CHECK_MESSAGE}            
    Delete Article                                 ${ARTICLE_TITLE}
    Logout Admin Site
    
TC02 - Edit Article Information
    ${ARTICLE_ALIAS}=    Generate Random String    12                       [LETTERS]
    ${ARTICLE_TITLE}=    Generate Random String    30                       [LETTERS] 
    Login Admin Site                               ${USERNAME}              ${PASSWORD}
    Go To Add New Article Page                      
    Add New Article                                ${ARTICLE_TITLE}         ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Go To Edit Article Page                        ${ARTICLE_TITLE}
    Edit Article                                   ${ARTICLE_EDIT_TITLE}                
    Check Edit Article Sucessfully                 ${ARTICLE_EDIT_TITLE}
    Delete Article                                 ${ARTICLE_EDIT_TITLE}                
    Logout Admin Site
    
TC03 - Unpublish An Article
    ${ARTICLE_ALIAS}=    Generate Random String    12                  [LETTERS]
    ${ARTICLE_TITLE}=    Generate Random String    30                  [LETTERS] 
    Login Admin Site                               ${USERNAME}         ${PASSWORD}
    Go To Add New Article Page      
    Add New Article                                ${ARTICLE_TITLE}    ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Unpublish Article                              ${ARTICLE_TITLE}  
    Check Unpublish Article Successfully           ${ARTICLE_TITLE}   
    Delete Article                                 ${ARTICLE_TITLE}
    Logout Admin Site
      
TC04 - Delete An Article
    ${ARTICLE_ALIAS}=    Generate Random String    12                  [LETTERS]
    ${ARTICLE_TITLE}=    Generate Random String    30                  [LETTERS]
    Login Admin Site                               ${USERNAME}         ${PASSWORD}
    Go To Add New Article Page      
    Add New Article                                ${ARTICLE_TITLE}    ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Delete Article                                 ${ARTICLE_TITLE} 
    Check Delete Article Successfully              ${ARTICLE_ALIAS}         
    Logout Admin Site