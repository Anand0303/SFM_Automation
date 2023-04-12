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
    ClickText                 00000118
    ClickText                 Contract Action
    
    
    

    DropDown                  *Contract Action    Cancel Renewal
    DropDown                  *Contract Action Reason    Content Quality
    
    
    DropDown                  *Renewal Cancellation Type    Renewal Cancelled after Notice Period Deadline
    TypeText                  *Contract Action Justification    askjhaeqeterqt qetqerteqrt qetertr qwetqretret qweterqtqertqre qewtqertqret qweqetqetre skjdhjadkjhasdkjhqoiwdqwhdjkhasfukfjhlwfeiukjhfdilufEKjsdfgfkjgJKSFLgkjgfilufekjgaFuilgfkjgAJKFgefuigaksjfgEFIUgkfjasgkajgfkDFkjdgfkJDFiuwefkjgasjkfgkjdfuiwekjgafiugWEIUF
                                                   
    DropDown                  Closed Category                   Lost To Unknown Competitor
    ClickText                 Next
    VerifyText                Contract Action Justification should not exceed 255 characters
