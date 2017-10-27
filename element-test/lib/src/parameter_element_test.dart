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

/// Matcher for [ParameterElement] instances.
const Matcher isParameterElement = const isInstanceOf<ParameterElement>();

/// Matches the [ParameterKind] [expected] value on [ParameterElement].
Matcher parameterKind(ParameterKind expected) => predicate((value) {
      if (value is! ParameterElement) return false;

      return (value as ParameterElement).parameterKind == expected;
    }, 'parameter kind is $expected');

/// Matcher for [ParameterElement] where the parameter is required.
final Matcher isRequiredParameter = parameterKind(ParameterKind.required);

/// Matcher for [ParameterElement] where the parameter is positional.
final Matcher isPositionalParameter = parameterKind(ParameterKind.positional);

/// Matcher for [ParameterElement] where the parameter is named.
final Matcher isNamedParameter = parameterKind(ParameterKind.named);

/// Matcher for [ParameterElement] that is an initializer.
final Matcher isInitializer = predicate((value) {
  if (value is! ParameterElement) return false;

  return (value as ParameterElement).isInitializer;
}, 'parameter is initializer');

/// Matcher for [ParameterElement] that is not an initializer.
final Matcher isNotInitializer = predicate((value) {
  if (value is! ParameterElement) return false;

  return !(value as ParameterElement).isInitializer;
}, 'parameter is not an initializer');

/// Matcher for [ParameterElement] that is covariant.
final Matcher isCovariant = predicate((value) {
  if (value is! ParameterElement) return false;

  return (value as ParameterElement).isCovariant;
}, 'parameter is covariant');

/// Matcher for [ParameterElement] that is not covariant.
final Matcher isNotCovariant = predicate((value) {
  if (value is! ParameterElement) return false;

  return !(value as ParameterElement).isCovariant;
}, 'parameter is not covariant');
