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
    ${user}=                  Set Variable                      Theresa Dudas
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
    
    #Add Primary contract on Opportunity
    ClickText                 Details                           partial_match=False                        delay=3
    ClickText                 Related                           anchor=Details    delay=3
    ClickText                 Add Contact Roles
    UseModal                  On
    ComboBox                  Search Contacts...                Dnyaneshwar Jalamkar                       dealay=2
    ClickText                 Next                             delay=5
    ClickText                 Save                             delay=5
    #Create New Quote from Opportunity
    ClickText                 New Quote
    ComboBox                  Primary Contact                  Dnyaneshwar Jalamkar
    ComboBox                  Legal Entity                        Elsevier Inc.
    PickList                  Region                        A
    PickList                  CK Account Type               Hospital
    clicktext                 Save
    VerifyText                Dnyaneshwar Jalamkar
    ClickText                 Edit Lines                       Anchor=Submit For Approval    delay=2
    SetConfig                 ShadowDOM    True                        
    ClickText                 Save    parent=SB-DIALOG                        delay=10
   
    
    
    ClickText    Add Products
    ClickText    Select
    VerifyText    145
    VerifyText    145
    ClickElement    /div[1]/paper-checkbox[1]
    ClickElement    /div[1]/paper-checkbox[1]
    ClickText    Save
    ClickText    Save    partial_match=False
    SetConfig    ShadowDOM    False
    
    TypeText                  *Opportunity Name            Test_Opp123            anchor=Cancel                      
    VerifyText                *Account Name
    ComboBox                  Search Accounts...          CSQ2C Test Account     
    VerifyText                *Stage
    PickList                  *Stage                      Needs Analysis                 
    ClickText                 *Expected Close Date
    ClickText                 Today
    ClickText                 Save                        partial_match=False                           
    ClickText                 Log out as Theresa Dudas 
    LaunchApp                 Elsevier