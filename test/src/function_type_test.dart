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
    final value = new FunctionType();

    expect(value.typeArguments, isEmpty);
    expect(value.typeArguments.clear, throwsUnsupportedError);
    expect(value.returnType, dynamicType);
    expect(value.requiredParameterNames, isEmpty);
    expect(value.requiredParameterNames.clear, throwsUnsupportedError);
    expect(value.requiredParameterTypes, isEmpty);
    expect(value.requiredParameterTypes.clear, throwsUnsupportedError);
    expect(value.optionalParameterNames, isEmpty);
    expect(value.optionalParameterNames.clear, throwsUnsupportedError);
    expect(value.optionalParameterTypes, isEmpty);
    expect(value.optionalParameterTypes.clear, throwsUnsupportedError);
    expect(value.namedParameterTypes, isEmpty);
    expect(value.namedParameterTypes.clear, throwsUnsupportedError);
  });
  test('equality', () {
    final value = new FunctionType(
      typeArguments: [new GenericType('T')],
      returnType: new GenericType('T'),
      requiredParameterNames: ['foo'],
      requiredParameterTypes: [intType],
      namedParameterTypes: {'bar': new GenericType('T')},
    );
    final equal = new FunctionType(
      typeArguments: [new GenericType('T')],
      returnType: new GenericType('T'),
      requiredParameterNames: ['foo'],
      requiredParameterTypes: [intType],
      namedParameterTypes: {'bar': new GenericType('T')},
    );
    final notEqual = new FunctionType(returnType: voidType);
    final otherType = new GenericType('T');

    expect(value == equal, isTrue);
    expect(value == notEqual, isFalse);
    expect(value == otherType, isFalse);
    expect(value == otherType, isFalse);
  });
  test('hashCode', () {
    final value = new FunctionType(
      typeArguments: [new GenericType('T')],
      returnType: new GenericType('T'),
      requiredParameterNames: ['foo'],
      requiredParameterTypes: [intType],
      namedParameterTypes: {'bar': new GenericType('T')},
    ).hashCode;
    final equal = new FunctionType(
      typeArguments: [new GenericType('T')],
      returnType: new GenericType('T'),
      requiredParameterNames: ['foo'],
      requiredParameterTypes: [intType],
      namedParameterTypes: {'bar': new GenericType('T')},
    ).hashCode;
    final notEqual = new FunctionType(returnType: voidType).hashCode;
    final otherType = new GenericType('T').hashCode;

    expect(value == equal, isTrue);
    expect(value == notEqual, isFalse);
    expect(value == otherType, isFalse);
    expect(value == otherType, isFalse);
  });
}
