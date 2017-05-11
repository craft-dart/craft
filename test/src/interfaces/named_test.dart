// Copyright (c) 2016, the Dogma Project Authors.
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

const String _foo = 'foo';
const String _bar = 'bar';

final Element _namedFooElement = new BaseElement(_foo, [], '');
final Element _namedBarElement = new BaseElement(_bar, [], '');
final Element _notNamedElementType = new Element();

void main() {
  test('isNamedElement', () {
    final matcher = isNamedElement;

    expectMatch(matcher, _namedFooElement);
    expectMatch(matcher, _namedBarElement);
    expectNoMatch(matcher, _notNamedElementType);
  });
  test('isNamed', () {
    var matcher = isNamed(_foo);

    expectMatch(matcher, _namedFooElement);
    expectNoMatch(matcher, _namedBarElement);
    expectNoMatch(matcher, _notNamedElementType);

    matcher = isNamed(_bar);

    expectNoMatch(matcher, _namedFooElement);
    expectMatch(matcher, _namedBarElement);
    expectNoMatch(matcher, _notNamedElementType);
  });
}
