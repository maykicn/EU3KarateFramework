Feature: exchange rate api tests
  Scenario: basic test with status code validation
    Given url 'https://api.exchangeratesapi.io/latest'
    When method GET
    Then status 200


  Scenario: get rates of specific day
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When method GET
    Then status 200
  Scenario: hedare verification
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Vary == 'Accept-Encoding'
    And match header Connection == 'keep-alive'
    #header verify
    And match header Date == '#present'

   Scenario: json body verification
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And print respone.base
    #verify base is euro
    And match response.base == 'EUR'
    And print response.rates
    And print response.rates.USD
    And match response.rates.USD == '#present'
    And match response.rates.USD == 1.4481

    



