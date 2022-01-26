# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

@StepClassSemantics
Feature: Comparability

  @GraphComputerVerificationInjectionNotSupported
  Scenario: Inject_null_eqXnullX
    Given the empty graph
    And the traversal of
      """
      g.inject(null).is(P.eq(null))
      """
    When iterated to list
    Then the result should be unordered
      | result |
      | null |

  @GraphComputerVerificationInjectionNotSupported
  Scenario: Inject_NaN_eqXNaNX
    Given the empty graph
    And using the parameter xx1 defined as "d[NaN]"
    And the traversal of
      """
      g.inject(xx1).is(P.eq(NaN))
      """
    When iterated to list
    Then the result should be unordered
      | result |
      | d[NaN] |

  @GraphComputerVerificationInjectionNotSupported
  Scenario: Inject_NaN_neqXNaNX
    Given the empty graph
    And using the parameter xx1 defined as "d[NaN]"
    And the traversal of
      """
      g.inject(xx1).is(P.neq(NaN))
      """
    When iterated to list
    Then the result should be empty

  @GraphComputerVerificationInjectionNotSupported
  Scenario: Inject_Inf_eqXInfX
    Given the empty graph
    And using the parameter xx1 defined as "d[Infinity]"
    And the traversal of
      """
      g.inject(xx1).is(P.eq(+Infinity))
      """
    When iterated to list
    Then the result should be unordered
      | result |
      | d[Infinity] |

  @GraphComputerVerificationInjectionNotSupported
  Scenario: Inject_Inf_neqXInfX
    Given the empty graph
    And using the parameter xx1 defined as "d[Infinity]"
    And the traversal of
      """
      g.inject(xx1).is(P.neq(+Infinity))
      """
    When iterated to list
    Then the result should be empty

  @GraphComputerVerificationInjectionNotSupported
  Scenario: Inject_NegInf_eqXNegInfX
    Given the empty graph
    And using the parameter xx1 defined as "d[-Infinity]"
    And the traversal of
      """
      g.inject(xx1).is(P.eq(-Infinity))
      """
    When iterated to list
    Then the result should be unordered
      | result |
      | d[-Infinity] |

  @GraphComputerVerificationInjectionNotSupported
  Scenario: Inject_NegInf_neqXNegInfX
    Given the empty graph
    And using the parameter xx1 defined as "d[-Infinity]"
    And the traversal of
      """
      g.inject(xx1).is(P.neq(-Infinity))
      """
    When iterated to list
    Then the result should be empty



