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

/// A [FunctionElementMatcher] for [MethodElement] equality.
class MethodElementMatcher extends FunctionElementMatcher<MethodElement> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [MethodElementMatcher] which compares metadata
  /// using the values in [expected].
  MethodElementMatcher(MethodElement expected) : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    super.matches(item, matchState);

    final actual = item as MethodElement;

    checkField(matchState, 'isAbstract', actual.isAbstract, expected.isAbstract);
    checkField(matchState, 'isStatic', actual.isStatic, expected.isStatic);

    return matchState.isNotEmpty;
  }
}
