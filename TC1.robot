*** Settings ***
Documentation   A sample API test suite
Library         RequestsLibrary
Library         BuiltIn

*** Variables ***
${BASE_URL}     https://api.example.com

*** Test Cases ***
Valid API Request
    Create Session   example   ${BASE_URL}
    ${response}   Get Request   example   /users
    Should Be Equal As Strings   ${response.status_code}   200
    Should Be Equal As Strings   ${response.json()['count']}   10

*** Keywords ***
Create Session
    [Arguments]    ${alias}    ${url}
    Create Session    ${alias}    ${url}    verify=${FALSE}

Get Request
    [Arguments]    ${alias}    ${endpoint}
    ${response}    Get Request    ${alias}    ${endpoint}
    [Return]       ${response}
