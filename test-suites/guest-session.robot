*** Settings ***

DOCUMENTATION     Testing access to API "The Movie Database" as a guest.

Resource          ../keywords/guest-session.robot

Suite Setup       Connect API
Suite Teardown    Disconnect API

*** Test Case ***

Scenario 01: List all movies upcoming as a guest
    Given I connect as a guest
    When I request rated movies
    # Then I should see one list with rated movies




