// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A matcher for [UriReferencedElement] instances.
const Matcher isUriReferencedElement =
    const isInstanceOf<UriReferencedElement>();

//---------------------------------------------------------------------
// prefixed
//---------------------------------------------------------------------

/// A matcher for references that are not prefixed.
final Matcher notPrefixed = predicate((value) {
  if (value is! UriReferencedElement) return true;

  return (value as UriReferencedElement).prefix.isEmpty;
}, 'element is not prefixed');

/// A matcher for references that contain a prefix.
final Matcher isPrefixed = predicate((value) {
  if (value is! UriReferencedElement) return false;

  return (value as UriReferencedElement).prefix.isNotEmpty;
}, 'element is prefixed');

/// Matches the [prefix] on [UriReferencedElement].
Matcher prefixedBy(String prefix) => predicate((value) {
      if (value is! UriReferencedElement) return false;

      return (value as UriReferencedElement).prefix == prefix;
    }, 'element is prefixed by $prefix');

//---------------------------------------------------------------------
// deferred
//---------------------------------------------------------------------

/// A matcher for [UriReferencedElement]s that are not deferred.
final Matcher notDeferred = predicate((value) {
  if (value is! UriReferencedElement) return false;

  return !(value as UriReferencedElement).deferred;
}, 'element is deferred');

/// A matcher for [UriReferencedElement]s that are deferred.
final Matcher isDeferred = predicate((value) {
  if (value is! UriReferencedElement) return false;

  return (value as UriReferencedElement).deferred;
}, 'element is not deferred');

//---------------------------------------------------------------------
// shownNames
//---------------------------------------------------------------------

/// Matches [UriReferencedElement]s that show [length] items.
Matcher shownNamesHasLength(int length) => predicate((value) {
      if (value is! UriReferencedElement) return false;

      return (value as UriReferencedElement).shownNames.length == length;
    }, 'element shows $length names');

/// A matcher for [UriReferencedElement]s that do not show any names.
final Matcher shownNamesIsEmpty = shownNamesHasLength(0);

/// Matches [UriReferencedElement]s that explicitly show the [name].
///
/// This checks the [UriReferencedElement.shownNames] value to determine if
/// the [name] is contained in the list. If it is not there then false will
/// be returned.
Matcher showsName(String name) => predicate((value) {
      if (value is! UriReferencedElement) return false;

      return (value as UriReferencedElement).shownNames.contains(name);
    }, 'element shows metadata named $name');

//---------------------------------------------------------------------
// hiddenNames
//---------------------------------------------------------------------

/// Matches [UriReferencedElement]s that hide [length] items.
Matcher hiddenNamesHasLength(int length) => predicate((value) {
      if (value is! UriReferencedElement) return false;

      return (value as UriReferencedElement).hiddenNames.length == length;
    }, 'element hides $length names');

/// A matcher for [UriReferencedElement]s that do not hide any names.
final Matcher hiddenNamesIsEmpty = hiddenNamesHasLength(0);

/// Matches [UriReferencedElement] that explicitly hides the [name].
///
/// This checks the [UriReferencedElement.hiddenNames] value to determine if
/// the [name] is contained in the list. If it is not there then false will
/// be returned.
Matcher hidesName(String name) => predicate((value) {
      if (value is! UriReferencedElement) return false;

      return (value as UriReferencedElement).hiddenNames.contains(name);
    }, 'element hides metadata named $name');

//---------------------------------------------------------------------
// configurations
//---------------------------------------------------------------------

/// Matches [UriReferencedElement]s with [length] configurations.
Matcher configurationsHasLength(int length) => predicate((value) {
      if (value is! UriReferencedElement) return false;

      return (value as UriReferencedElement).hiddenNames.length == length;
    }, 'element has $length configurations');

/// A matcher for [UriReferencedElement]s that do not have any configurations.
final Matcher configurationsIsEmpty = hiddenNamesHasLength(0);
