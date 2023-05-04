# NOTE: readme.txt contains important information you need to take into account
# before running this suite.
*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
*** Test Cases ***
Creating Opportunity from Account
    [tags]                    Opportunities
    Appstate                  Home
    ${user}=                  Set Variable                      Katie Gerhard
    Login As                  ${user}
    LaunchApp                 Opportunities
    ClickText                 New
    ClickText                 Next
    VerifyText                *Opportunity Name
    TypeText                  *Opportunity Name                 Test_Opp123            anchor=Cancel                      
    VerifyText                *Account Name
    ComboBox                  Search Accounts...                CSQ2C Test Account     
    VerifyText                *Stage
    PickList                  *Stage                            Needs Analysis                 
    ClickText                 *Expected Close Date
    ClickText                 Today
    Picklist                  Level 1 Product                   Reference
    Picklist                  Level 2 Product                   CK Physician
    MultiPickList             Level 3 Product                   CK Japan
    ClickText                 Move selection to Chosen          anchor=Available
    ClickText                 Save                              partial_match=False   