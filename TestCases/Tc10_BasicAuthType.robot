*** Settings ***
Library    XML
Library    os
Library      Collections
Library    RequestsLibrar
Library      Collections
Library    RequestsLibrary

*** Variables ***

#${base_url}    https://restapi.demoqa.com/

*** Test Cases ***
#Basic Authentication   -- Username & password
Tc_10 BasicAuthTest
    #${auth}=    create list ToolsQA    TestPassword
    #Create Session    mysession    ${base_url}     auth=${auth}
    #${response}=   get on session    mysession    /authentication/CheckForAuthentication
    #log to console    ${response.content}
    #should be equal as string as    ${response.status_code}    200







#robot -d Results TestCases/Tc09_ValidateHeadersAndCookies.robot
