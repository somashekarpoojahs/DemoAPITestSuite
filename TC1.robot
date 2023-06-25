*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Example API Test
    Create Session    example    https://api.example.com
    ${response}    Get Request    example    /api/users
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_data}    Set Variable    ${response.json()}
    Should Not Be Empty    ${json_data}
    Should Contain    ${json_data}[0]['name']    John Doe
    Delete All Sessions
