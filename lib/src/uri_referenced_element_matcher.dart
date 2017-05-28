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

/// A [ElementMatcher] for [UriReferencedElement] equality.
class UriReferencedElementMatcher extends ElementMatcher<UriReferencedElement> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [UriReferencedElementMatcher] which compares
  /// metadata using the values in [expected].
  UriReferencedElementMatcher(UriReferencedElement expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    final actual = item as UriReferencedElement;

    checkField(matchState, 'prefix', actual.prefix, expected.prefix);
    checkField(matchState, 'deferred', actual.deferred, expected.deferred);
    checkUnorderedList(matchState, 'shownNames', actual.shownNames, expected.shownNames);
    checkUnorderedList(matchState, 'hiddenNames', actual.hiddenNames, expected.hiddenNames);
    checkUnorderedList(matchState, 'configurations', actual.configurations, expected.configurations);

    return matchState.isNotEmpty;
  }
}
