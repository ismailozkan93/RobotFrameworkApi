*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${base_url}    http://thetestingworldapi.com/

*** Test Cases ***
TC03_Put_Request
    create session    Add_put    ${base_url}
    ${body}=    create dictionary    id=541186    first_name=Ahmet    middle_name=sali    last_name=Dali    date_of_birth=01.01.1998
    ${header}=    create dictionary    Content_Type=application/json
    ${response}=    put on session    Add_put    api/studentsDetails/541186    data=${body}    headers=${header}
    log to console    ${response.content}
    log to console    *************
    log to console    ${response.status_code}
    log to console    *****************
    log to console    ${response.headers}
    log to console    ******************
    ${code}=       convert to string    ${response.status_code}
    should be equal    ${code}    200
    ${X-Pow Value}=    get from dictionary     ${response.headers}   X-Powered-By-Plesk
    log to console    ${X-Pow Value}



#robot -d Results TestCases/Tc3_PutRequest.robot
