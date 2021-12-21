*** Settings ***
Library      Collections
Library    RequestsLibrary
Library    os

*** Variables ***

${base_url}     https://maps.googleapis.com
${req_uri}      /maps/api/place/nearbysearch/json?
*** Test Cases ***
#BearerToken Authentication
Tc_12 GoogleMapPlacesAPITC
    Create Session    mysession    ${base_url}
    ${params}    create dictionary    location=-33.8670522,151.1957362    radius=500    types=food    name=harbour    key=AIzaSyDZbrBQ5l07PhumCEj9oPYeB_Y1PAxC1HE
    ${response}=    get request    mysession    ${req_uri}    params=${params}

    log to console    ${response.status_code}
    log to console    ${response.content}


#robot -d Results TestCases/Tc12_GoogleMapAPI.robot
