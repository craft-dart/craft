// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'base_element_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [BaseElementMatcher] for [ParameterElement] equality.
class ParameterElementMatcher extends BaseElementMatcher<ParameterElement> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ParameterElementMatcher] which compares metadata
  /// using the values in [expected].
  ParameterElementMatcher(ParameterElement expected) : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as ParameterElement;

    matched = checkField(matchState, 'type', actual.type, expected.type) && matched;
    matched = checkField(matchState, 'parameterKind', actual.parameterKind, expected.parameterKind) && matched;
    matched = checkField(matchState, 'isInitializer', actual.isInitializer, expected.isInitializer) && matched;
    matched = checkField(matchState, 'isCovariant', actual.isCovariant, expected.isCovariant) && matched;
    matched = checkField(matchState, 'defaultValue', actual.defaultValue, expected.defaultValue) && matched;

    return matched;
  }
}
