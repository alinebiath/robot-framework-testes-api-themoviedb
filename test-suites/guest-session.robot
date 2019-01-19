*** Settings ***

DOCUMENTATION     Testing access to API "The Movie Database" as a guest and
...               performing permitted operations and trying to perform non-permitted operations.

Resource          ../keywords/guest-session.robot

Suite Setup       Connect API
Suite Teardown    Disconnect API

*** Test Case ***

Scenario 01: Starting session as a guest with a valid api_key
    Given I have a valid api_key                ${VALID_API_KEY}
    When I enter a guest session
    Then response status should be              200                                                                          OK

Scenario 02: Starting session as a guest with a invalid api_key
    Given I have a invalid api_key              123456
    When I try enter a invalid guest session
    Then response status should be              401                                                                          Unauthorized
    And I receive a status_message              Invalid API key: You must be granted a valid key.

Scenario 03: Consulting a rated list movies, as a guest
    Given I have a valid api_key                ${VALID_API_KEY}
    And I enter a guest session
    When I consult the rated movies list
    Then response status should be              200                                                                          OK

Scenario 04: Getting account details
    Given I have a valid api_key                ${VALID_API_KEY}
    And I enter a guest session
    When I consult account details
    Then response status should be              401                                                                          Unauthorized
    And I receive a status_message              Authentication failed: You do not have permissions to access the service.