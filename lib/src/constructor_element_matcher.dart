// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'function_element_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [FunctionElementMatcher] for [ConstructorElement] equality.
class ConstructorElementMatcher
    extends FunctionElementMatcher<ConstructorElement> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ConstructorElementMatcher] which compares metadata
  /// using the values in [expected].
  ConstructorElementMatcher(ConstructorElement expected) : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    super.matches(item, matchState);

    final actual = item as ConstructorElement;

    checkField(matchState, 'isConst', actual.isConst, expected.isConst);
    checkField(matchState, 'isFactory', actual.isFactory, expected.isFactory);

    return matchState.isNotEmpty;
  }
}
