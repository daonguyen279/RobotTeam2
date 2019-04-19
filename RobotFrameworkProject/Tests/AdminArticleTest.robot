*** Settings ***
Resource	     ../Resources/Setup.robot
Resource         ../Pages/Admin/AdminArticlePage.robot
Suite setup       Setup
Suite teardown    Teardown


*** Variables ***
${ARTICLE_TITLE}            Glimpses of the Mystery That Is the Muelle Investigation
${ARTICLE_CONTENT}          IT BEGAN WITH A TRICKLE — curious developments that mostly raised more questions. There was evidence of election hacking — but could it really have been directed by the Kremlin? Certain Americans on Facebook, pitching for Donald J. Trump and stirring up anger, turned out to be impostors — but who had concocted them? One Trump campaign aide after another surfaced in sketchy reports of meetings with mysterious Russians — but did the encounters add up to anything significant?Then there was the candidate’s famously twitchy Twitter finger, scathing toward so many public figures but oddly respectful of the Russian president. Was that a signal of dark secrets, or just of a soft spot for a strongman? And so, in 2016, began the F.B.I.’s epic investigation — and the attempt by journalists to track it. On Thursday, barring a natural disaster or alien attack, the public should get its first real look at the report of Robert S. Mueller III, the special counsel. 
${ARTICLE_CHECK_MESSAGE}    Article saved.
${ARTICLE_EDIT_TITLE}       Glimpses of the Mystery          


*** Test Cases ***
Add New A Aticle
    ${ARTICLE_ALIAS} =  Generate Random String    12    [LETTERS]
    Login Admin Site    ${USERNAME}         ${PASSWORD}
    Add New Article    ${ARTICLE_TITLE}    ${ARTICLE_ALIAS}    ${ARTICLE_CONTENT}
    Logout Admin Site


Edit Article Information
    Login Admin Site            ${USERNAME}                  ${PASSWORD}
    Edit Article Information   ${ARTICLE_EDIT_TITLE} 
    Logout Admin Site
    
Delete Article Information
     Login Admin Site            ${USERNAME}                  ${PASSWORD}
     Delete Article Information
     Logout Admin Site