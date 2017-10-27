// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_element_test/element_test.dart';
import 'package:test/test.dart';

import 'matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final Element _requiredParameterElement = new ParameterElement(
  'r',
  parameterKind: ParameterKind.required,
);
final Element _positionalParameterElement = new ParameterElement(
  'r',
  parameterKind: ParameterKind.positional,
);
final Element _namedParameterElement = new ParameterElement(
  'r',
  parameterKind: ParameterKind.named,
);
final Element _initializerElement = new ParameterElement(
  'r',
  isInitializer: true,
);
final Element _notInitializerElement = new ParameterElement(
  'r',
  isInitializer: false,
);
final Element _covariantElement = new ParameterElement(
  'r',
  isCovariant: true,
);
final Element _notCovariantElement = new ParameterElement(
  'r',
  isCovariant: false,
);
final Element _notParameterElementType = new Element();

void main() {
  test('isParameterElement', () {
    final matcher = isParameterElement;

    expectMatch(matcher, _requiredParameterElement);
    expectMatch(matcher, _positionalParameterElement);
    expectMatch(matcher, _namedParameterElement);
    expectNoMatch(matcher, _notParameterElementType);
  });
  test('isRequiredParameter', () {
    final matcher = isRequiredParameter;

    expectMatch(matcher, _requiredParameterElement);
    expectNoMatch(matcher, _positionalParameterElement);
    expectNoMatch(matcher, _namedParameterElement);
    expectNoMatch(matcher, _notParameterElementType);
  });
  test('isRequiredParameter', () {
    final matcher = isPositionalParameter;

    expectNoMatch(matcher, _requiredParameterElement);
    expectMatch(matcher, _positionalParameterElement);
    expectNoMatch(matcher, _namedParameterElement);
    expectNoMatch(matcher, _notParameterElementType);
  });
  test('isRequiredParameter', () {
    final matcher = isNamedParameter;

    expectNoMatch(matcher, _requiredParameterElement);
    expectNoMatch(matcher, _positionalParameterElement);
    expectMatch(matcher, _namedParameterElement);
    expectNoMatch(matcher, _notParameterElementType);
  });
  test('isInitializer', () {
    final matcher = isInitializer;

    expectMatch(matcher, _initializerElement);
    expectNoMatch(matcher, _notInitializerElement);
    expectNoMatch(matcher, _notParameterElementType);
  });
  test('isNotInitializer', () {
    final matcher = isNotInitializer;

    expectNoMatch(matcher, _initializerElement);
    expectMatch(matcher, _notInitializerElement);
    expectNoMatch(matcher, _notParameterElementType);
  });
  test('isCovariant', () {
    final matcher = isCovariant;

    expectMatch(matcher, _covariantElement);
    expectNoMatch(matcher, _notCovariantElement);
    expectNoMatch(matcher, _notParameterElementType);
  });
  test('isNotCovariant', () {
    final matcher = isNotCovariant;

    expectNoMatch(matcher, _covariantElement);
    expectMatch(matcher, _notCovariantElement);
    expectNoMatch(matcher, _notParameterElementType);
  });
}
