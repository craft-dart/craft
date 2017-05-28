// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'element_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Base class for determining equality between [Element]s.
class BaseElementMatcher<T extends BaseElement> extends ElementMatcher<T> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [BaseElementMatcher] which compares metadata
  /// using the values in [expected].
  BaseElementMatcher(T expected) : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    final actual = item as BaseElement;

    return checkField(matchState, 'name', actual.name, expected.name);
  }
}
