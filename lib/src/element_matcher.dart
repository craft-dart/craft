// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Base class for determining equality between [Element]s.
///
/// The [ElementMatcher] extends the [Matcher] interface and is meant to be
/// used within the test framework.
abstract class ElementMatcher<T extends Element> extends Matcher {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The value to compare against.
  final T expected;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ElementMatcher] which compares metadata using
  /// the values in [expected].
  ElementMatcher(this.expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  Description describe(Description description) =>
      description.add('metadata is equal');

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    matchState.forEach((key, value) {
      mismatchDescription.add(key.toString()).addDescriptionOf(value);
    });

    return mismatchDescription;
  }

  //---------------------------------------------------------------------
  // Protected methods
  //---------------------------------------------------------------------

  /// Compares the values of [actual] vs [expected].
  ///
  /// If the values are not equal then a description of the discrepancy is
  /// added to the [matchState] under the [name].
  @protected
  bool checkField(
    Map matchState,
    String name,
    dynamic actual,
    dynamic expected,
  ) {
    final matcher = _matcher(expected);

    return _checkMatch(matchState, name, actual, matcher);
  }

  /// Compares the values of [actual] vs [expected] respecting ordering.
  ///
  /// This should be used when the order of the values matters. If it does not
  /// use [checkUnorderedList] instead.
  @protected
  bool checkOrderedList(
    Map matchState,
    String name,
    List actual,
    List expected,
  ) {
    final matcher = equals(_matcherList(expected).toList());

    return _checkMatch(matchState, name, actual, matcher);
  }

  /// Compares the values of [actual] vs [expected] without respecting
  /// ordering.
  ///
  /// This should be used when the order of the values does not matter. If it
  /// does use [checkOrderedList] instead.
  @protected
  bool checkUnorderedList(
    Map matchState,
    String name,
    List actual,
    List expected,
  ) {
    final matcher = equals(_matcherList(expected).toSet());

    return _checkMatch(matchState, name, actual, matcher);
  }

  //---------------------------------------------------------------------
  // Private class methods
  //---------------------------------------------------------------------

  /// Checks the [actual] value against the [matcher].
  static bool _checkMatch(
    Map matchState,
    String name,
    dynamic actual,
    Matcher matcher,
  ) {
    final valueMatchState = {};
    final matches = matcher.matches(actual, valueMatchState);

    if (!matches) {
      matchState[name] = valueMatchState;
    }

    return matches;
  }

  /// Create matchers for the given list of [expected] values.
  static Iterable<Matcher> _matcherList(Iterable expected) =>
      expected.map<Matcher>(_matcher);

  /// Creates a matcher for the [expected] value.
  ///
  /// If the [expected] value is metadata then a [ElementMatcher] will be
  /// returned. Otherwise it will do an [equals] check.
  static Matcher _matcher(dynamic expected) {
    Matcher matcher;

    if (expected is Element) {
      matcher = elementEqual(expected);
    }

    return matcher ?? equals(expected);
  }
}
