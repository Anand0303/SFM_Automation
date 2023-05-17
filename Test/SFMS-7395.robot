# NOTE: readme.txt contains important information you need to take into account
# before running this suite.
*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
*** Test Cases ***
Expose additional fields to the eCommerce Integration Permission Set
   [tags]                    SalesforceSupport
    Appstate                  Home
    ClickText                 Salesforce Help
    VerifyText                Salesforce Support Home
    ClickText                 Salesforce Support Home
    setconfig                 DefaultTimeout                    200
    setconfig                 DefaultTimeout                    200
    setconfig                 DefaultTimeout                    200
    SwitchWindow              2
    SwitchWindow              1
    ClickText                 Setup                     anchor=Salesforce Help
    ClickText                 Opens in a new tab
    SwitchWindow              NEW
   
    TypeText                  Quick Find    permission sets\n
    ClickText                 Permission Sets           delay=3
    ClickText                 E    partial_match=False
                
    ScrollTo                  eCommerce Integration
    ClickText                 eCommerce Integration
    ClickText                 Object Settings
    ClickText                 Accounts                  anchor=Account Taxes 
    ClickText                 Edit                      partial_match=False                      
    Sleep                     5s
    ScrollTo                  Object Permissions
    ScrollTo                  Field Permissions 
    ScrollTo                  Address 
    ScrollTo                  Call Area  
    ScrollTo                  CMX End Date
    ScrollTo                  CRM account type
    ScrollTo                  CS Territory Segment 2
    ScrollTo                  DHC Address
    ScrollTo                  DHC ID Holder
    ${ClickECR}=              Set Variable                      ECR Id
    ClickElement              //tr[166]/*[text()\='${ClickECR}']
    SwipeDown                 1
    ScrollTo                  ECR Id
  
    UseTable                Field Name
    VerifyTable             r166c1    ECR Id
    ClickCheckbox           r167on/c2    off
    ClickCheckbox           r167on/c2    on
    ScrollTo                Cancel
    ClickText               Cancel
