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

Scenario: pageSize
    * def page = 1
    * def pageSize = 2

    Given path '/skillacademy/discovery/search'
    And param searchQuery = queryKeyword
    And param page = page
    And param pageSize = pageSize
    When method GET
    Then status 200
    And match response == '#object'
    And match response.data == '#object'
    And match response.status == '#string'
    And match response.message == '#string'
    And match response.status == 'success'
    And match response.message == 'success'
    And match response.data.data == '#array'

    And match response.data.pageSize == pageSize

  Scenario: page
    * def page = 1
    * def pageSize = 2

    Given path '/skillacademy/discovery/search'
    And param searchQuery = queryKeyword
    And param page = page
    And param pageSize = pageSize
    When method GET
    Then status 200
    And match response == '#object'
    And match response.data == '#object'
    And match response.status == '#string'
    And match response.message == '#string'
    And match response.status == 'success'
    And match response.message == 'success'
    And match response.data.data == '#array'

    And match response.data.page == page

  Scenario: minPrice
    * def minPrice = 150000
    * def maxPrice = 200000

    Given path '/skillacademy/discovery/search'
    And param searchQuery = queryKeyword
    And param minPrice = minPrice
    And param maxPrice = maxPrice
    When method GET
    Then status 200
    And match response == '#object'
    And match response.data == '#object'
    And match response.status == '#string'
    And match response.message == '#string'
    And match response.status == 'success'
    And match response.message == 'success'
    And match response.data.data == '#array'

    And match each response.data.data[*] contains { basePrice: '#? _ >= minPrice && _ <= maxPrice' }

  Scenario: minDuration & maxDuration
    * def minDuration = 1
    * def maxDuration = 2

    Given path '/skillacademy/discovery/search'
    And param searchQuery = queryKeyword
    And param minDuration = minDuration
    And param maxDuration = maxDuration
    When method GET
    Then status 200
    And match response == '#object'
    And match response.data == '#object'
    And match response.status == '#string'
    And match response.message == '#string'
    And match response.status == 'success'
    And match response.message == 'success'
    And match response.data.data == '#array'

  Scenario: Sort By
    * def sortBy = 'total_rating'

    Given path '/skillacademy/discovery/search'
    And param searchQuery = queryKeyword
    And param sortBy = sortBy
    When method GET
    Then status 200
    And match response == '#object'
    And match response.data == '#object'
    And match response.status == '#string'
    And match response.message == '#string'
    And match response.status == 'success'
    And match response.message == 'success'
    And match response.data.data == '#array'

    # And match response.data.data[*] = '#object'