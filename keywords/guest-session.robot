*** Settings ***

Resource                libraries.robot

*** Variables ***

${URL_API}=             https://api.themoviedb.org/3
# ${URI}=               movie/upcoming
# ${BODY_POST_PATH}=    ./keywords/body-model-post.json
# ${BODY_PUT_PATH}=     ./keywords/body-model-put.json
&{HEADERS}=             content-type=application/json               charset=utf-8
&{API_KEY}=             api_key=1f54bd990f1cdfb230adb312546d765d    sort_by=created_at.asc

*** Keywords ***

#Suite Setup and Teardown
Connect API
    request.Create Session         tmovie                            ${URL_API}                       disable_warnings=0                                    debug=1

Disconnect API
    request.Delete All Sessions

I connect as a guest
    ${response}=                   request.Get Request               alias=tmovie                     uri=authentication/guest_session/new                  params=${API_KEY}
    std.Log                        ${response.json()}
    ${guest_session_id}=           collection.Get From Dictionary    dictionary=${response.json()}    key=guest_session_id
    std.Set Test Variable          ${guest_session_id}


I request rated movies
    ${response}=                   request.Get Request               alias=tmovie                     uri=guest_session/${guest_session_id}/rated/movies    params=${API_KEY}    headers=${HEADERS}
    std.Log                        ${response.json()}

