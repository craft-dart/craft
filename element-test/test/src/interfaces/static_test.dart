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

final Element _staticElement = new MethodElement('s', isStatic: true);
final Element _notStaticElement = new MethodElement('i', isStatic: false);
final Element _notStaticElementType = new Element();

void main() {
  test('isStaticElement', () {
    final matcher = isStaticElement;

    expectMatch(matcher, _staticElement);
    expectMatch(matcher, _notStaticElement);
    expectNoMatch(matcher, _notStaticElementType);
  });
  test('isStatic', () {
    final matcher = isStatic;

    expectMatch(matcher, _staticElement);
    expectNoMatch(matcher, _notStaticElement);
    expectNoMatch(matcher, _notStaticElementType);
  });
  test('isNotStatic', () {
    final matcher = isNotStatic;

    expectNoMatch(matcher, _staticElement);
    expectMatch(matcher, _notStaticElement);
    expectMatch(matcher, _notStaticElementType);
  });
}
