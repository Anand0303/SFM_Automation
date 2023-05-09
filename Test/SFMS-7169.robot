# NOTE: readme.txt contains important information you need to take into account
# before running this suite.
*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
*** Test Cases ***
End Date validation required on Quote
    [tags]                    Quotes
    Appstate                  Home
    #${user}=                  Set Variable                      Erin Shore
    #Login As                  ${user}
    LaunchApp                 Quotes
    
    
    
    ClickText                 Search...
    TypeText                  Search...                         Q-12790\n
    setconfig                 DefaultTimeout                    60
    ClickText                 Quotes                            anchor=Chatter
    ${data_requests}=         Set Variable                      Q-12790
    ClickText                 ${data_requests}                  anchor=Primary
    VerifyText                End Date
    
    ClickText           Edit                      partial_match=False
    UseModal        On
    ScrollTo            End Date
    ${Enddate}=     Set Variable         SBQQ__EndDate__c
    ClickElement    //*[@name\='${Enddate}']
    ClickText           Today                   partial_match=False
    ClickText           Save                    partial_match=False

    SetConfig                 ShadowDOM                             True
    VerifyItem                We hit a snag.
    ${approver}=              Set Variable                  Review the errors on this page.
    VerifyText                //div[@class\='container']//div[2]//div//div//*[text()\='${approver}']
    ${approver1}=            Set Variable                   pageLevelErrors        
    VerifyText               //div[@class\='${approver1}']/ul/li    delay=5
    ${Error1}=           Set Variable                      Close error dialog
    ClickElement                //*[text()\='${Error1}']
    
    