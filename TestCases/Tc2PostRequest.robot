*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${base_url}    http://thetestingworldapi.com/

*** Test Cases ***
TC01_Post_Request
    create session    Add_post    ${base_url}
    ${body}=    create dictionary    first_name=Testing    middle_name=A    last_name=World    date_of_birth=01.01.1992
    ${header}=    create dictionary    Content_Type=application/json
    ${response}=    post on session    Add_post    api/studentsDetails    data=${body}    headers=${header}
    ${code}=       convert to string    ${response.status_code}
    should be equal    ${code}    201
    log to console    ${code}
    log to console    """""""""""
    log to console    ${response.content}
    log to console    ***********
    log to console    ${response.headers}
    # log to console    ${response.headers.Content-Type}
    ${response_content}=    convert to string    ${response.content}
    log to console    ${response_content}
    should contain    ${response_content}    Testing
    log to console    ***********
    ${response_headers}=    convert to string    ${response.headers}
    log to console    ${response_headers}
    should contain    ${response_headers}    PleskWin




#robot -d Results TestCases/Tc2PostRequest.robot
