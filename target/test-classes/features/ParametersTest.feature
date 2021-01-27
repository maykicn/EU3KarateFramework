Feature: Parameters examples

  Background:
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://3.80.189.73:8000'
    * def hrUrl = 'http://3.80.189.73:1000/ords/hr'

  Scenario: path parameters
    Given url baseUrl
    And path 'latest'
    When method GET
    Then status 200

  Scenario: path parameters
    Given url baseUrl
    And path '2010-01-12'
    When method GET
    Then status 200

  Scenario: get all spartans
    Given url spartanUrl
    And path 'api/spartans'
    When method GET
    Then status 200
    And print response


  Scenario: get one spartan
    Given url spartanUrl
    And path 'api/spartans'
    And path '11'
    When method GET
    Then status 200
    And print response
    And match response == {"gender": "Male","phone": 1231232145,"name": "Lionel Cola","id": 11}
  Scenario: get one spartan
    * def expectedSpartan =
  """
    {
        "gender": "Male",
        "phone": 1231232145,
        "name": "Lionel Cola",
        "id": 11
    }
    """
    Given url spartanUrl
    And path 'api/spartans'
    And path '11'
    When method GET
    Then status 200
    And print response
    And match response == expectedSpartan

  Scenario: query parameters
    Given url spartanUrl
    And path 'api/spartans/search'
    And param nameContains = 'j'
    And param gender = 'Female'
    When method get
    Then status 200
    And match header Content-Type == 'application/json;charset=UTF-8'
    And print response.content
    And match response.pageable.pageNumber == 0
    #verify each content has gender =female
    And match each response.content contains {'gender':'Female'}
    #second way of iteration
    And match each response.content[*].gender == 'Female'
    And match response.content[0].name == 'Junia'
    #verify each content phone is number
    And match each response.content[*].phone == '#number'


  Scenario: hr regions example
    Given url hrUrl
    And path 'regions'
    When method GET
    Then status 200
    #And print response
    And match response.limit == 25
    And match each response.items[*].region_id == '#number'

    

















