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