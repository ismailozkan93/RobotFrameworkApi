*** Settings ***
Library    XML
Library    os
Library      Collections
Library    RequestsLibrary

*** Variables ***

${base_url}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Tc_09 Validate Headers and Cookies
    Create Session    mysession    ${base_url}
    ${response}=   get on session    mysession    /photos

    #log to console    ${response.headers}
    ${contentTypeValue}=    get from dictionary    ${response.headers}    Content-Type
    log to console    ${contentTypeValue}
    should be equal   ${contentTypeValue}    application/json; charset=utf-8

    ${contentEncodeValue}=    get from dictionary    ${response.headers}    Content-Encoding
    log to console    ${contentEncodeValue}

#TestCookies
    #Create Session    mysession    ${base_url}
    #${response}=   get on session    mysession    /photos
    #log to console    ${response.cookies}    #Displayes all the cookies from response
    #${cookie_Value}=    get from Dictionary    ${response.cookies}    _cfduid(Name)
    #log to console    ${cookie_Value} #Display specific cookie value





#robot -d Results TestCases/Tc09_ValidateHeadersAndCookies.robot
