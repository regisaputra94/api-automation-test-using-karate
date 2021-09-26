Feature: API Automation

  Background:
    * url baseUrl

  Scenario: Search Using Query

    Given path '/skillacademy/discovery/search'
    And param searchQuery = queryKeyword
    When method GET
    Then status 200
    And match response == '#object'
    And match response.data == '#object'
    And match response.status == '#string'
    And match response.message == '#string'
    And match response.status == 'success'
    And match response.message == 'success'

    And match response.data.data == '#array'
    And match each response.data.data[*] == '#object'
    And match each response.data.data[*].courseName == '#string'
#    And match each response.data.data[*].courseDescription contains queryKeyword