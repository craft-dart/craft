// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_element_test/element_test.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

import '../matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final Element _publicElement = new MethodElement('foo');
final Element _privateElement = new MethodElement('_foo');
final Element _protectedElement = new MethodElement('foo', annotations: [protected],);
final Element _notAccessibleElementType = new Element();

void main() {
  test('isAccessibleElement', () {
    final matcher = isAbstractElement;

    expectMatch(matcher, _publicElement);
    expectMatch(matcher, _privateElement);
    expectMatch(matcher, _protectedElement);
    expectNoMatch(matcher, _notAccessibleElementType);
  });
  test('isPublic', () {
    final matcher = isPublic;

    expectMatch(matcher, _publicElement);
    expectNoMatch(matcher, _privateElement);
    expectNoMatch(matcher, _protectedElement);
    expectNoMatch(matcher, _notAccessibleElementType);
  });
  test('isPrivate', () {
    final matcher = isPrivate;

    expectNoMatch(matcher, _publicElement);
    expectMatch(matcher, _privateElement);
    expectNoMatch(matcher, _protectedElement);
    expectNoMatch(matcher, _notAccessibleElementType);
  });
  test('isProtected', () {
    final matcher = isProtected;

    expectNoMatch(matcher, _publicElement);
    expectNoMatch(matcher, _privateElement);
    expectMatch(matcher, _protectedElement);
    expectNoMatch(matcher, _notAccessibleElementType);
  });
}
