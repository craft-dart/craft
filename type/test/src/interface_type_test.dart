// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_type/type.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

void main() {
  test('constructor', () {
    final name = 'Foo';
    final value = new InterfaceType(name);

    expect(value.name, name);
    expect(value.typeArguments, isEmpty);
    expect(value.typeArguments.clear, throwsUnsupportedError);
  });
  test('equality', () {
    final value = new InterfaceType('Foo', [new GenericType('T')]);
    final equal = new InterfaceType('Foo', [new GenericType('T')]);
    final notEqual = new InterfaceType('Bar');
    final otherType = new GenericType('T');

    expect(value == equal, isTrue);
    expect(value == notEqual, isFalse);
    expect(value == otherType, isFalse);
    expect(value == otherType, isFalse);
  });
  test('hashCode', () {
    final value = new InterfaceType('Foo', [new GenericType('T')]).hashCode;
    final equal = new InterfaceType('Foo', [new GenericType('T')]).hashCode;
    final notEqual = new InterfaceType('Bar').hashCode;
    final otherType = new GenericType('T').hashCode;

    expect(value == equal, isTrue);
    expect(value == notEqual, isFalse);
    expect(value == otherType, isFalse);
    expect(value == otherType, isFalse);
  });
}
