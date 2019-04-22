*** Settings ***
Resource	      ../Resources/Setup.robot
Resource          ../Pages/Admin/AdminArticlePage.robot
Suite setup       Setup
Suite teardown    Teardown


*** Variables ***
${ARTICLE_TITLE}            Glimpses of the Mystery That Is the Muelle Investigation
${ARTICLE_CONTENT}          IT BEGAN WITH A TRICKLE — curious developments that mostly raised more questions. There was evidence of election hacking — but could it really have been directed by the Kremlin? Certain Americans on Facebook, pitching for Donald J. Trump and stirring up anger, turned out to be impostors — but who had concocted them? 
${ARTICLE_CHECK_MESSAGE}    Article saved.
${ARTICLE_EDIT_TITLE}       Glimpses of the Mystery          


*** Test Cases ***
TC01 - Add A New Aticle
    ${ARTICLE_ALIAS} =  Generate Random String    12    [LETTERS]
    Login Admin Site                     ${USERNAME}         ${PASSWORD}
    Go To Add New Article Page      
    Add New Article                      ${ARTICLE_TITLE}    ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Check Add New Article Sucessfully    
    Logout Admin Site

Edit Article Information
    ${ARTICLE_ALIAS} =  Generate Random String    12    [LETTERS]
    Login Admin Site                  ${USERNAME}              ${PASSWORD}
    Go To Add New Article Page      
    Add New Article                   ${ARTICLE_TITLE}         ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Go To Edit Article Page
    Edit Article                      ${ARTICLE_EDIT_TITLE}    
    Check Edit Article Sucessfully        
    Delete Article
    Logout Admin Site
    
Unpublish An Article
    ${ARTICLE_ALIAS} =  Generate Random String    12    [LETTERS]
    Login Admin Site                        ${USERNAME}         ${PASSWORD}
    Go To Add New Article Page      
    Add New Article                         ${ARTICLE_TITLE}    ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Unpublish Article
    Check Unpublish Article Successfully    
    Delete Article
    Logout Admin Site 
      
Delete An Article
    ${ARTICLE_ALIAS} =  Generate Random String    12    [LETTERS]
    Login Admin Site                     ${USERNAME}         ${PASSWORD}
    Go To Add New Article Page      
    Add New Article                      ${ARTICLE_TITLE}    ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Delete Article      
    Check Delete Article Successfully    ${ARTICLE_ALIAS} 
    Logout Admin Site 

    
   