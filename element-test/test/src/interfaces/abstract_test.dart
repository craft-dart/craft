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

import '../matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final Element _abstractElement = new ClassElement('A', isAbstract: true);
final Element _concreteElement = new ClassElement('C', isAbstract: false);
final Element _notAbstractElementType = new Element();

void main() {
  test('isAbstractElement', () {
    final matcher = isAbstractElement;

    expectMatch(matcher, _abstractElement);
    expectMatch(matcher, _concreteElement);
    expectNoMatch(matcher, _notAbstractElementType);
  });
  test('isAbstract', () {
    final matcher = isAbstract;

    expectMatch(matcher, _abstractElement);
    expectNoMatch(matcher, _concreteElement);
    expectNoMatch(matcher, _notAbstractElementType);
  });
  test('isConcrete', () {
    final matcher = isConcrete;

    expectNoMatch(matcher, _abstractElement);
    expectMatch(matcher, _concreteElement);
    expectMatch(matcher, _notAbstractElementType);
  });
}
