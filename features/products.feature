Feature: The product store service back-end
    As a Product Store Owner
    I need a RESTful catalog service
    So that I can keep track of all my products

Background:
    Given the following products
        | name       | description     | price   | available | category   |
        | Hat        | A red fedora    | 59.95   | True      | CLOTHS     |
        | Shoes      | Blue shoes      | 120.50  | False     | CLOTHS     |
        | Big Mac    | 1/4 lb burger   | 5.99    | True      | FOOD       |
        | Sheets     | Full bed sheets | 87.00   | True      | HOUSEWARES |

Scenario: The server is running
    When I visit the "Home Page"
    Then I should see "Product Catalog Administration" in the title
    And I should not see "404 Not Found"

Scenario: Read a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hat" in the "Name" field
    And I should see "A red fedora" in the "Description" field
    And I should see "True" in the "Available" dropdown
    And I should see "CLOTHS" in the "Category" dropdown
    And I should see "59.95" in the "Price" field

Scenario: Update a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    When I change "Description" to "A red beret"
    And I press the "Update" button
    Then I should see the message "Success"
    When I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see "A red beret" in the "Description" field

Scenario: Delete a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Delete" button
    Then I should see the message "Product has been Deleted!"
    When I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "404 Not Found"

Scenario: List all Products
    When I visit the "Home Page"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should see "Pants" in the results
    And I should see "Shoes" in the results

Scenario: Search by Category
    When I visit the "Home Page"
    And I select "CLOTHS" in the "Category" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should see "Pants" in the results
    And I should not see "Hammer" in the results

Scenario: Search by Availability
    When I visit the "Home Page"
    And I select "True" in the "Available" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should not see "Bowling Ball" in the results

Scenario: Search by Name
    When I visit the "Home Page"
    And I set the "Name" to "Hat"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should not see "Pants" in the results