# NOTE: readme.txt contains important information you need to take into account
# before running this suite.
*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
*** Test Cases ***
Create rules for prevent contacts duplication - (First Name + Last Name + Account) - This should show an alert 
but allow the Contact to be saved
    [tags]                    Contacts
    Appstate                  Home
    LaunchApp                 Contacts
    ClickText                 New
    TypeText                  Search Accounts...               HSQ2C Test Account
    ClickText                 Show All Results for "HSQ2C Test Account"
    ClickText                 HSQ2C Test Account               anchor=Account Name
    PickList                  Salutation                       Mr.
    ${Name}=                  Set Variable                      firstName
    TypeText                  //*[@name\='${Name}']             Anand
    TypeText                  *Last Name                        Balapure\n
    ClickText                 Department
    SetConfig                 ShadowDOM                             True
    VerifyItem                Similar Records Exist
    ${approver}=              Set Variable                       This record looks like an existing record. Make sure to check any potential duplicate records before saving.
    VerifyText                //div[@class\='container']//div[2]//div[text()\='${approver}']
    VerifyText                *Job Title 
    TypeText                  *Job Title                        Test Lead\n
    ClickText                 Save                              partial_match=False

Create rules for prevent contacts duplication - (First Name + Last Name + Email Address) - This should block and not be allowed to create
    [tags]                    Contacts
    Appstate                  Home
    LaunchApp                 Contacts
    ClickText                 New
    TypeText                  Search Accounts...               HSQ2C Test Account
    ClickText                 Show All Results for "HSQ2C Test Account"
    ClickText                 HSQ2C Test Account               anchor=Account Name
    PickList                  Salutation                       Mr.
    ${Name}=                  Set Variable                      firstName
    TypeText                  //*[@name\='${Name}']             Anand
    TypeText                  *Last Name                        Balapure\n
    ${Name}=                  Set Variable                      Email
    TypeText                  //*[@name\='${Name}']             a.balapure@elsevier.com
    ClickText                 Department
    SetConfig                 ShadowDOM                             True
    VerifyItem                We hit a snag.
    ${approver}=              Set Variable                       You can't save this record because a duplicate record already exists. To save, use different information.
    
    VerifyText                //div[@class\='container']//div[2]//div[text()\='${approver}']
    VerifyText                *Job Title 
    TypeText                  *Job Title                        Test Lead\n
    ClickText                 Save                              partial_match=False