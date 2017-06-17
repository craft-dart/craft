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

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final _requiredParameterElement = new ParameterElement(
  'r',
  parameterKind: ParameterKind.required,
);
final _positionalParameterElement = new ParameterElement(
  'r',
  parameterKind: ParameterKind.positional,
);
final _namedParameterElement = new ParameterElement(
  'r',
  parameterKind: ParameterKind.named,
);

void main() {
  test('constructor', () {
    final element = new ParameterElement('foo');

    expect(element, isNamed('foo'));
    expect(element, isRequiredParameter);
    expect(element, isNotInitializer);
    expect(element, isNotCovariant);
    expect(element, annotationsIsEmpty);
    expect(element, isUncommented);
    // Comments aren't allowed on a parameter
    expect(element, isUncommented);

    // Check immutable lists
    expect(element.annotations.clear, throwsUnsupportedError);
  });
  test('isRequired', () {
    expect(_requiredParameterElement.isRequired, isTrue);
    expect(_positionalParameterElement.isRequired, isFalse);
    expect(_namedParameterElement.isRequired, isFalse);
  });
  test('isOptional', () {
    expect(_requiredParameterElement.isOptional, isFalse);
    expect(_positionalParameterElement.isOptional, isTrue);
    expect(_namedParameterElement.isOptional, isTrue);
  });
}
