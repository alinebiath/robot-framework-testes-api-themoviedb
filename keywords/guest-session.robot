*** Settings ***

Resource                libraries.robot

*** Variables ***

${URL_API}=             https://api.themoviedb.org/3/
# ${URI}=               movie/upcoming
# ${BODY_POST_PATH}=    ./keywords/body-model-post.json
# ${BODY_PUT_PATH}=     ./keywords/body-model-put.json
&{HEADERS}=             content-type=application/json               charset=utf-8
&{API-KEY}=             api-key=1f54bd990f1cdfb230adb312546d765d

*** Keywords ***

#Suite Setup and Teardown
Connect API
    request.Create Session         tmovie                 ${URL_API}      disable_warnings=0

Disconnect API
    request.Delete All Sessions

I connect as a guest
    ${response}=                   request.Get Request    alias=tmovie    uri=authentication/guest_session/new?api_key=1f54bd990f1cdfb230adb312546d765d
    std.Log                        ${response.json()}
    std.Set Test Variable          ${response}

I request rated movies


