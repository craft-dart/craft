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

/// A [BaseElementMatcher] for [FunctionElement] equality.
class FunctionElementMatcher extends BaseElementMatcher<FunctionElement> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [FunctionElementMatcher] which compares metadata
  /// using the values in [expected].
  FunctionElementMatcher(FunctionElement expected) : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    final actual = item as FunctionElement;

    checkField(matchState, 'type', actual.type, expected.type);
    checkOrderedList(matchState, 'parameters', actual.parameters, expected.parameters);

    return matchState.isNotEmpty;
  }
}
