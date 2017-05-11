// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_element_test/element_test.dart';
import 'package:craft_type/type.dart';
import 'package:test/test.dart';

import '../matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final Element _constantElement = new ConstructorElement(new InterfaceType('Foo'), isConst: true,);
final Element _notConstantElement = new ConstructorElement(new InterfaceType('Foo'), isConst: false,);
final Element _notConstantElementType = new ParameterElement('param');

void main() {
  test('isConstantElement', () {
    final matcher = isConstantElement;

    expectMatch(matcher, _constantElement);
    expectMatch(matcher, _notConstantElement);
    expectNoMatch(matcher, _notConstantElementType);
  });
  test('isConstant', () {
    final matcher = isConstant;

    expectMatch(matcher, _constantElement);
    expectNoMatch(matcher, _notConstantElement);
    expectNoMatch(matcher, _notConstantElementType);
  });
  test('isNotConstant', () {
    final matcher = isNotConstant;

    expectNoMatch(matcher, _constantElement);
    expectMatch(matcher, _notConstantElement);
    expectMatch(matcher, _notConstantElementType);
  });
}
