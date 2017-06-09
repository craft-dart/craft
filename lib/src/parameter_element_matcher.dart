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
  // ignore: type_annotate_public_apis
  bool matches(item, Map matchState) {
    super.matches(item, matchState);

    final actual = item as ParameterElement;

    checkField(matchState, 'type', actual.type, expected.type);
    checkField(
      matchState,
      'parameterKind',
      actual.parameterKind,
      expected.parameterKind,
    );
    checkField(
      matchState,
      'isInitializer',
      actual.isInitializer,
      expected.isInitializer,
    );
    checkField(
      matchState,
      'isCovariant',
      actual.isCovariant,
      expected.isCovariant,
    );
    checkField(
      matchState,
      'defaultValue',
      actual.defaultValue,
      expected.defaultValue,
    );

    return matchState.isEmpty;
  }
}
