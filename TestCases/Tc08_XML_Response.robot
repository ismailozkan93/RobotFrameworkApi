*** Settings ***
Library    XML
Library    os
Library      Collections
Library    RequestsLibrary
*** Variables ***

${base_url}   http://thomas-bayer.com

*** Test Cases ***
Tc_08 XML Response
    Create Session    mysession    ${base_url}
    ${response}=   get on session    mysession    /sqlrest/CUSTOMER/15
    ${xml_string}=  convert to string    ${response.content}
    ${xml_obj}=    parse xml    ${xml_string}

    ${XML_ID}=   get element text    ${xml_obj}    .//ID
    should be equal as integers    ${XML_ID}    15


    ${child_elements}=    get child elements    ${xml_obj}
    ${ID}=    get element text    ${child_elements[0]}
    ${fname}=   get element text    ${child_elements[1]}
    ${lname}=    get element text    ${child_elements[2]}
    ${street}=    get element text    ${child_elements[3]}
    ${city}=    get element text    ${child_elements[4]}

    log to console  ${ID}
    log to console  ${fname}
    log to console  ${lname}
    log to console  ${street}
    log to console  ${city}



#http://thomas-bayer.com/sqlrest/CUSTOMER/15
#robot -d Results TestCases/Tc08_XML_Response.robot