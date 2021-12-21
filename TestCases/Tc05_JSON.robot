*** Settings ***
Library    JSONLibrary
Library    os
Library      Collections

*** Test Cases ***
#How to validate Data in JSONFile

Tc01 Load JSON from File
    ${json_obj}=    load json from file    C:/Development/robot-scripts/APIAutomation/jsondata/jsondata.json
    log to console    ${json_obj}
    ${name_value}=    get value from json    ${json_obj}     $.firstName
    log to console    ${name_value}
    ${tel_value}=   get value from json    ${json_obj}      $.phoneNumbers[0].number
    should contain    ${tel_value}     0123-4567-8888






#robot -d Results TestCases/Tc05_JSON.robot