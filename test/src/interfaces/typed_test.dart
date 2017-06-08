// Copyright (c) 2016, the Dogma Project Authors.
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

void main() {
  test('isTypedElement', () {
    final matcher = isTypedElement;

    expectMatch(matcher, new ParameterElement('p'));
    expectNoMatch(matcher, new Element());
  });
  test('isType', () {
    final matcher = isType(new InterfaceType('Foo'));

    expectMatch(matcher, new ClassElement('Foo'));
    expectNoMatch(matcher, new ClassElement('Bar'));
  });
  test('isDynamicType', () {
    final matcher = isDynamicType;

    expectMatch(matcher, new ParameterElement('p', type: dynamicType));
    expectNoMatch(matcher, new ParameterElement('p', type: intType));
  });
}
