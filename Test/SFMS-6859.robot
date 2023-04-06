# NOTE: readme.txt contains important information you need to take into account
# before running this suite.
*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
*** Test Cases ***
Create rules for prevent contacts duplication
    [tags]                    Contacts
    Appstate                  Home
    LaunchApp                 Contacts
    ClickText                 New
    ComboBox                  Search Accounts...                CSQ2C Test Account
    PickList                  Salutation                        Mr.
    TypeText                  First Name                        Anand
    TypeText                  *Last Name                        Balapure
    TypeText                  Department                        Test\n                        
    VerifyText                *Job Title 
    TypeText                  *Job Title                        Test Lead\n
    
    

    
    
    
    SetConfig                 ShadowDOM                             True
    VerifyItem                Similar Records Exist
    ${approver}=              Set Variable                       This record looks like an existing record. Make sure to check any potential duplicate records before saving.
    VerifyText                //div[@class\='container']//div[2]//div[text()\='${approver}']
    
    
    
    VerifyText                Similar Records Exist                
    ClickText                 Similar Records Exist
    Sleep                     5s
    ClickText                 Save                              partial_match=False