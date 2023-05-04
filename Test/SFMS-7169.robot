# NOTE: readme.txt contains important information you need to take into account
# before running this suite.
*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
*** Test Cases ***
End Date validation required on Quote
    [tags]                    Opportunities
    Appstate                  Home
    ${user}=                  Set Variable                      Erin Shore
    Login As                  ${user}
    LaunchApp                 Quotes
    
    
    

    ClickText    Search...    anchor=Elsevier
    TypeText    Search...    Q-12790
    ClickText    Quote


   
    