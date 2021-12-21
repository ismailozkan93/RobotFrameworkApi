*** Settings ***
Library    JSONLibrary
Library    os
Library      Collections
Library    RequestsLibrary

*** Variables ***
${base_url}    http://thetestingworldapi.com/


*** Test Cases ***
Get_Info
    create session    mysession    ${base_url}
    ${response}=    get on session    mysession    api/studentsDetails/541136
    log to console    ${response.content}
    #How to validate Complex Data in JSON Response
    log to console    ***************************************
    ${json_object}=    to json    ${response.content}

    log to console    ${json_object}
    ${value_id}=    get value from json    ${json_object}    $.data.id
    log to console    ${value_id}
    should contain    ${value_id}    541136



#robot -d Results TestCases/Tc06_ComplexJSONValidation.robot