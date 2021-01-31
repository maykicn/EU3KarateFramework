Feature:Data driven tests

  Scenario Outline: get token for users <email>
    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    Then status 200
    And print response.accessToken
    And def token = response.accessToken

    Examples:
  | email                       | password           |
  | sbirdbj@fc2.com             | asenorval          |
  | htwinbrowb4@blogspot.com    | kanyabang          |
  | dfrederickb5@yellowbook.com | engraciahuc        |
  | apainb6@google.co.jp        | rosettalightollers |
  | fbawmeb7@studiopress.com    | sherilyngohn       |

  Scenario Outline: get token for users <email>
    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    Then status 200
    And print response.accessToken
    And def token = response.accessToken

    Examples:
  |read('data/users.csv')|
  @wip
Scenario: get user info verification (Database vs Api)














