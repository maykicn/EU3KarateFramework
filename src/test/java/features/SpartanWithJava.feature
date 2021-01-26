Feature: Karate Java Integration

  Background:
    * def spartanUrl = 'http://3.80.189.73:8000'


  Scenario: Get a spartan with request header
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    When method GET
    Then status 200

  Scenario: Create a new spartan
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
        {
        "gender": "Male",
        "name": "Mayk",
        "phone": 3877445596
    }

    """
    When method POST
    Then status 201
    And print response


  @wip
  Scenario: Create a new spartan with random data

