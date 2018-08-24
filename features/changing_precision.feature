Feature: Changing precision
  Default precision may not be enough for evey use case, so it can be changed.

  Scenario: Setting precision to 10
    Given current precision is the default
    When I set precision to 10
    Then I should have it set to 10
