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
    final name = 'T';
    final value = new GenericType(name);

    expect(value.name, name);
    expect(value.extending, isNull);
  });
  test('equality', () {
    final value = new GenericType('T', new InterfaceType('Foo'));
    final equal = new GenericType('T', new InterfaceType('Foo'));
    final notEqual = new GenericType('U');
    final otherType = new InterfaceType('Foo');

    expect(value == equal, isTrue);
    expect(value == notEqual, isFalse);
    expect(value == otherType, isFalse);
    expect(value == otherType, isFalse);
  });
  test('hashCode', () {
    final value = new GenericType('T', new InterfaceType('Foo')).hashCode;
    final equal = new GenericType('T', new InterfaceType('Foo')).hashCode;
    final notEqual = new GenericType('U').hashCode;
    final otherType = new InterfaceType('Foo').hashCode;

    expect(value == equal, isTrue);
    expect(value == notEqual, isFalse);
    expect(value == otherType, isFalse);
    expect(value == otherType, isFalse);
  });
}
