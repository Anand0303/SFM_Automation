# NOTE: readme.txt contains important information you need to take into account
# before running this suite.
*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
*** Test Cases ***
Q2C Cancellation, CRM agreement not created due to exceeding 255 characters

    [tags]                    Contracts
    Appstate                  Home
    LaunchApp                 Contracts
    TypeText                  Search Contracts and more...    00000118
    