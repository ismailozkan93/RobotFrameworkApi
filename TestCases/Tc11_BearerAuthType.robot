*** Settings ***
Library      Collections
Library    RequestsLibrary
Library    os

*** Variables ***

${base_url}   https://www.gmibank.com/api/tp-states/
${bearer_token}    "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJncm91cDE2ZW1wbG95ZWUiLCJhdXRoIjoiUk9MRV9FTVBMT1lFRSIsImV4cCI6MTY0MDE2NTA4Nn0.LP3eZev65dwVteyY_Lx41oA98JmTAOIFDRxS_RhalllquDUurlBx-iuLmCpWsp_pwOkRPI7kyVDjSPHesJhEpQ"
*** Test Cases ***
#BearerToken Authentication
Tc_11 BearerAuthTest
    Create Session    mysession    ${base_url}     Authorization=${bearer_token}

    ${headers}    create dictionary    Authorization=${bearer_token}    Content-Type=text/xml
    ${req_body}=    get file for streaming upload    C:\Development\robot-scripts\APIAutomation\Xml\PostData.txt
    ${response}=    post on session    mysession     /    data=${req_body}    headers=${headers}
    log to console    ${response.status_code}



#robot -d Results TestCases/Tc11_BearerAuthType.robot
