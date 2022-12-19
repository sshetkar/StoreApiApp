Feature: StoreApp >> User API's >> All Category

Background:
    * def readKarateConfig = call read('../Karate-config.js')
    * def getBaseUrl = readKarateConfig.prodBaseUrl
    Then print getBaseUrl

Scenario: To verify response of all categories API
    Given url getBaseUrl + '/categories'
    When method Get
    Then status 200
    And match response.message contains 'Success'

Scenario: To verify response for single category
    Given url 'https://api.storerestapi.com/categories/bags-and-shoes'
    When method get
    Then status 200
    And match response ==
    """
            {
            "data": {
                "products": [
                    {
                        "_id": "61ab431c0f34753bcedfa7a6",
                        "title": "running sneaker",
                        "price": 200,
                        "description": null,
                        "imageSource": null,
                        "createdBy": "612e4851345dcc333ac6cb24",
                        "createdAt": "2021-12-04T10:29:48.295Z",
                        "updatedAt": "2021-12-04T10:29:48.295Z",
                        "slug": "running-sneaker"
                    },
                    {
                        "_id": "61ab43350f34753bcedfa7aa",
                        "title": "men casual shoes sports running sneakers",
                        "price": 100,
                        "description": null,
                        "imageSource": null,
                        "createdBy": "612e48fb345dcc333ac6cb2e",
                        "createdAt": "2021-12-04T10:30:13.299Z",
                        "updatedAt": "2021-12-04T10:30:13.299Z",
                        "slug": "men-casual-shoes-sports-running-sneakers"
                    },
                    {
                        "_id": "61ab434b0f34753bcedfa7ae",
                        "title": "premium leather matt black casual boot",
                        "price": 250,
                        "description": null,
                        "imageSource": null,
                        "createdBy": "612e4991345dcc333ac6cb3b",
                        "createdAt": "2021-12-04T10:30:35.528Z",
                        "updatedAt": "2021-12-04T10:30:35.528Z",
                        "slug": "premium-leather-matt-black-casual-boot"
                    }
                ],
                "_id": "61ab1d0e4a0fef3f27dc664d",
                "name": "bags & shoes",
                "slug": "bags-and-shoes"
            },
            "status": 200,
            "message": "Success! Category found"
        }
    """

Scenario: To verify 'Fuzzy Match' for single category
    Given url 'https://api.storerestapi.com/categories/bags-and-shoes'
    When method get

    And match response.data.products == '#[]'
    And match response.data.products[*]._id contains '#string'

    And match each response.data.products[*] ==
    """
        {
            "_id": "#string",
            "title": "#string",
            "price": '#number',
            "description": '#',
            "imageSource": '#',
            "createdBy": "#string",
            "createdAt": "#string",
            "updatedAt": "#string",
            "slug": "#string"
        }
    """


Scenario: To validate response value for each node for single category
    Given url 'https://api.storerestapi.com/categories/bags-and-shoes'
    When method get

    And match response.data.name contains 'bags & shoes'
    And match each response..name == '#string'
    And match response.data.slug == 'bags-and-shoes'
    And match response.data.slug != '#number'

    And match response.data._id == '#present'
    And match each response.._id == '##'
    And match each response..status == 200
    And match response.status != 400
    And match each response.data..products[7] == '61ab47e70f34753bcedfa857', '61ab47fd0f34753bcedfa85b'
