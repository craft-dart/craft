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

/// A [ElementMatcher] for [UriConfigurationElement] equality.
class UriConfigurationElementMatcher
    extends ElementMatcher<UriConfigurationElement> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [UriConfigurationElementMatcher] which compares
  /// metadata using the values in [expected].
  UriConfigurationElementMatcher(UriConfigurationElement expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    final actual = item as UriConfigurationElement;

    checkField(matchState, 'when', actual.when, expected.when);
    checkField(matchState, 'equals', actual.equals, expected.equals);

    return matchState.isNotEmpty;
  }
}
