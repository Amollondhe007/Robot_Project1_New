*** Settings ***
Documentation    Simple example using selenium Library
Library    SeleniumLibrary    

Suite Setup        Log    I am inside Test Suite Setup    
Suite Teardown     Log    I am inside Test Suite Tear down    
Test Setup         Log    I am inside Test Case Setup    
Test Teardown      Log    I am inside Test Case Tear down    

Default Tags    Sanity

*** Test Cases ***
MyFirstTest
    [Tags]    Smoke
    Log    Hello everyone...    
    
FirstSeleniumTest
    
    Set Tags    regression
    Remove Tags    regression
    Open Browser    http://google.com    Chrome
    Set Browser Implicit Wait    5
    Input Text      name=q               Automation step by step
    Press Keys      name=q               ENTER
    # Click Button    name=btnK        
    Sleep    2    
    Close Browser
    Log    Test Completed!     
    
SampleLoginTest
    [Documentation]        This is sample login test
    Open Browser           ${URL}    Chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element         id=welcome    
    Click Element         link=Logout        
    Close Browser
    Log                   SeleniumLoginTest Completed!    
    Log                   This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/
@{CREDENTIAL}     Admin    admin123
&{LOGINDATA}      username=Admin    password=admin123  
    
*** Keywords ***
LoginKW
    Input Text            id=txtUsername    ${CREDENTIAL}[0]    
    Input Password        id=txtPassword    ${LOGINDATA}[password]    
    Click Button          id=btnLogin    