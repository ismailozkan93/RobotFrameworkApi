*** Settings ***
Library    XML
Library    OS
Library    Collections

*** Variables ***


*** Test Cases ***
Tc_XML_File
    ${xml_obj}=    parse xml    C:/Development/robot-scripts/APIAutomation/Xml/data.xml
#    log to console    ${xml_obj}

    #Approach 1
    ${emp_firstname}=    get element text    ${xml_obj}    .//student[1]/first_name
    log to console    ${emp_firstname}
    should be equal    ${emp_firstname}    Naber


    #Approach 2
    ${emp_lastname}=    get element    ${xml_obj}    .//student[1]/last_name
    log to console    ${emp_lastname.text}

    #Approach 3
    element text should be    ${xml_obj}    Manisa    .//student[1]/last_name

    #Val2- Check Number of elements
    ${count}=    get element count    ${xml_obj}    .//student
    log to console    ${count}
    should be equal as integers    ${count}     7

    #Val3 Check attribute presence
    element attribute should be    ${xml_obj}    id    6    .//student[1]
    element attribute should be    ${xml_obj}    id    7    .//student[2]

    #Val4 Check values of child
    ${child_elements}=    get child elements    ${xml_obj}    .//student[1]
    log to console    ${child_elements}
    should not be empty    ${child_elements}

    ${fname}=    get element text    ${child_elements[1]}
    log to console    ${fname}
    ${lname}=    get element text    ${child_elements[2]}
    log to console    ${lname}
    ${mname}=    get element text    ${child_elements[3]}
    log to console    ${mname}

    should be equal    ${lname}    Manisa
    should be equal    ${fname}    Naber
    should be equal    ${mname}    sample string 3





#robot -d Results TestCases/Tc07_XML.robot