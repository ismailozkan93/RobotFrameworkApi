*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${base_url}    http://thetestingworldapi.com/

*** Test Cases ***
TC01_Get_Request
    create session    Api_get    ${base_url}
    ${response}=    get on session    Api_get    api/studentsDetails        #/541136
    log to console    ${response.status_code}
    log to console    ${response.content}
    log to console    ${response.headers}
    # log to console    ${response.headers.Content-Type}

    ${status_code_str}=    convert to string    ${response.status_code}
    log to console    ${status_code_str}
    should be equal   ${status_code_str}        200

    ${body}=   convert to string    ${response.content}
    log to console    ${body}
    should contain    ${body}    sample string 2

    ${contentTypeValue}=    get from dictionary    ${response.headers}    Content-Type
    log to console    ${contentTypeValue}
    should contain    ${contentTypeValue}    application/json
    log to console    """""""""
    ${json_response}=    set variable    ${response.json()}
    log to console    ${json_response}
    @{firstname_data}=    get value from json    ${json_response}     data.first_name
    log to console    ${firstname_data}




#robot -d Results TestCases/Tc1_GetRequest.robot