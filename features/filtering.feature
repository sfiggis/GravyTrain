Feature: filtering offerings

  @wip
  Scenario: A guest filters by category
    Given there are some featured offers
    Given there are some offerings in the food category
      And there are some offerings in the sports category
      And they are on the offerings listings page
    Then they see all of the offerings
    When they filter by the food category
    Then they see only the food offerings