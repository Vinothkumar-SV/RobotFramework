*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        http://leaftaps.com/opentaps/control/main

*** Test Cases ***
Create Lead Test - Guest Mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --guest

    Open Browser    ${URL}    Chrome    options=${options}
    Maximize Browser Window

    # Login
        Wait Until Element Is Visible    id=username    10s
        Input Text    id=username    DemoSalesManager
        Input Text    id=password    crmsfa
        Click Button    class=decorativeSubmit

        Wait Until Element Is Visible    link=CRM/SFA    10s
        Click Link    CRM/SFA
        Wait Until Element Is Visible    link=Leads    10s
        Click Link    Leads
        Wait Until Element Is Visible    link=Create Lead    10s
        Click Link    Create Lead

        Wait Until Element Is Visible    id=createLeadForm_companyName    10s
        Input Text    id=createLeadForm_companyName    TestLeaf
        Input Text    id=createLeadForm_firstName      John
        Input Text    id=createLeadForm_lastName       Doe

        Click Button    name=submitButton

        Page Should Contain    View Lead

        Close Browser