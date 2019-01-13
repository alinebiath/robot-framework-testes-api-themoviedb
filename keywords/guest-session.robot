*** Settings ***

Resource        libraries.robot

*** Variables ***

${URL_API}=     https://api.themoviedb.org/3
&{HEADERS}=     content-type=application/json               charset=utf-8
# &{PARAMS}=    api_key=c51f9deb0e83b37f5db774c5f239a34a    sort_by=created_at.asc


*** Keywords ***

Connect API
    request.Create Session                       tmovie                                  ${URL_API}                       disable_warnings=0

Disconnect API
    request.Delete All Sessions

I have a valid api_key
    [Arguments]                                  ${valid_api_key}
    ${params}                                    std.Create Dictionary                   api_key=${valid_api_key}         sort_by=created_at.asc
    std.Set Test Variable                        ${params}

I have a invalid api_key
    [Arguments]                                  ${invalid_api_key}
    ${params}                                    std.Create Dictionary                   api_key=${invalid_api_key}       sort_by=created_at.asc
    std.Set Test Variable                        ${params}

I enter a guest session
    ${response}=                                 request.Get Request                     alias=tmovie                     uri=authentication/guest_session/new                  params=${params}
    std.Log                                      ${response.json()}
    ${guest_session_id}=                         collection.Get From Dictionary          dictionary=${response.json()}    key=guest_session_id
    std.Set Test Variable                        ${guest_session_id}
    std.Set Test Variable                        ${response}

I try enter a invalid guest session
    ${response}=                                 request.Get Request                     alias=tmovie                     uri=authentication/guest_session/new                  params=${params}
    std.Log                                      ${response.json()}
    std.Set Test Variable                        ${response}

response status should be
    [Arguments]                                  ${status_code_expected}                 ${reason_expected}
    std.Should Be Equal As Strings               ${response.status_code}                 ${status_code_expected}
    std.Should Be Equal As Strings               ${response.reason}                      ${reason_expected}

I receive a status_message
    [Arguments]                                  ${message_expected}
    collection.Dictionary Should Contain Item    ${response.json()}                      status_message                   ${message_expected}
    std.Log                                      ${response.json()["status_message"]}

I consult the rated movies list
    ${response}=                                 request.Get Request                     alias=tmovie                     uri=guest_session/${guest_session_id}/rated/movies    params=${params}    headers=${HEADERS}
    std.Log                                      ${response.json()}

I consult account details
    ${response}=                                 request.Get Request                     alias=tmovie                     uri=account                                           params=${params}    headers=${HEADERS}
    std.Log                                      ${response.json()}
    std.Set Test Variable                        ${response}
