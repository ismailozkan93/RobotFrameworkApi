*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${base_url}    http://thetestingworldapi.com/

*** Test Cases ***
TC04_Delete_Request
    create session    del_id    ${base_url}
    ${response}=    delete on session   del_id    api/studentsDetails/541184
    log to console    ${response.content}
    log to console    ${response.status_code}

    #Validation
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200




#robot -d Results TestCases/Tc4_DeleteRequest.robot