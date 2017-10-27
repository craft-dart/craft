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
  // Common interface types

  test('bool', () {
    expect(boolType.name, 'bool');
    expect(boolType.typeArguments, isEmpty);
  });
  test('num', () {
    expect(numType.name, 'num');
    expect(numType.typeArguments, isEmpty);
  });
  test('num', () {
    expect(numType.name, 'num');
    expect(numType.typeArguments, isEmpty);
  });
  test('int', () {
    expect(intType.name, 'int');
    expect(intType.typeArguments, isEmpty);
  });
  test('String', () {
    expect(stringType.name, 'String');
    expect(stringType.typeArguments, isEmpty);
  });
  test('dynamic', () {
    expect(dynamicType.name, 'dynamic');
    expect(dynamicType.typeArguments, isEmpty);
  });
  test('Object', () {
    expect(objectType.name, 'Object');
    expect(objectType.typeArguments, isEmpty);
  });
  test('Null', () {
    expect(nullType.name, 'Null');
    expect(nullType.typeArguments, isEmpty);
  });
  test('void', () {
    expect(voidType.name, 'void');
    expect(voidType.typeArguments, isEmpty);
  });

  // Factory functions

  test('List', () {
    final emptyArguments = listType();

    expect(emptyArguments.name, 'List');
    expect(emptyArguments.typeArguments, hasLength(1));
    expect(emptyArguments.typeArguments[0], dynamicType);

    final withArguments = listType(stringType);

    expect(withArguments.name, 'List');
    expect(withArguments.typeArguments, hasLength(1));
    expect(withArguments.typeArguments[0], stringType);
  });
  test('Iterable', () {
    final emptyArguments = iterableType();

    expect(emptyArguments.name, 'Iterable');
    expect(emptyArguments.typeArguments, hasLength(1));
    expect(emptyArguments.typeArguments[0], dynamicType);

    final withArguments = iterableType(stringType);

    expect(withArguments.name, 'Iterable');
    expect(withArguments.typeArguments, hasLength(1));
    expect(withArguments.typeArguments[0], stringType);
  });
  test('Future', () {
    final emptyArguments = futureType();

    expect(emptyArguments.name, 'Future');
    expect(emptyArguments.typeArguments, hasLength(1));
    expect(emptyArguments.typeArguments[0], dynamicType);

    final withArguments = futureType(stringType);

    expect(withArguments.name, 'Future');
    expect(withArguments.typeArguments, hasLength(1));
    expect(withArguments.typeArguments[0], stringType);
  });
  test('Stream', () {
    final emptyArguments = streamType();

    expect(emptyArguments.name, 'Stream');
    expect(emptyArguments.typeArguments, hasLength(1));
    expect(emptyArguments.typeArguments[0], dynamicType);

    final withArguments = streamType(stringType);

    expect(withArguments.name, 'Stream');
    expect(withArguments.typeArguments, hasLength(1));
    expect(withArguments.typeArguments[0], stringType);
  });
  test('Map', () {
    final emptyArguments = mapType();

    expect(emptyArguments.name, 'Map');
    expect(emptyArguments.typeArguments, hasLength(2));
    expect(emptyArguments.typeArguments[0], dynamicType);
    expect(emptyArguments.typeArguments[1], dynamicType);

    final keyArgument = mapType(key: intType);

    expect(keyArgument.name, 'Map');
    expect(keyArgument.typeArguments, hasLength(2));
    expect(keyArgument.typeArguments[0], intType);
    expect(keyArgument.typeArguments[1], dynamicType);

    final valueArgument = mapType(value: intType);

    expect(valueArgument.name, 'Map');
    expect(valueArgument.typeArguments, hasLength(2));
    expect(valueArgument.typeArguments[0], dynamicType);
    expect(valueArgument.typeArguments[1], intType);

    final withArguments = mapType(key: intType, value: stringType);

    expect(withArguments.name, 'Map');
    expect(withArguments.typeArguments, hasLength(2));
    expect(withArguments.typeArguments[0], intType);
    expect(withArguments.typeArguments[1], stringType);
  });

  // Type checks

  test('isListType', () {
    expect(isListType(boolType), isFalse);
    expect(isListType(listType()), isTrue);
    expect(isListType(iterableType()), isFalse);
    expect(isListType(mapType()), isFalse);
    expect(isListType(futureType()), isFalse);
    expect(isListType(streamType()), isFalse);
  });
  test('isIterableType', () {
    expect(isIterableType(boolType), isFalse);
    expect(isIterableType(listType()), isFalse);
    expect(isIterableType(iterableType()), isTrue);
    expect(isIterableType(mapType()), isFalse);
    expect(isIterableType(futureType()), isFalse);
    expect(isIterableType(streamType()), isFalse);
  });
  test('isMapType', () {
    expect(isMapType(boolType), isFalse);
    expect(isMapType(listType()), isFalse);
    expect(isMapType(iterableType()), isFalse);
    expect(isMapType(mapType()), isTrue);
    expect(isMapType(futureType()), isFalse);
    expect(isMapType(streamType()), isFalse);
  });
  test('isFutureType', () {
    expect(isFutureType(boolType), isFalse);
    expect(isFutureType(listType()), isFalse);
    expect(isFutureType(iterableType()), isFalse);
    expect(isFutureType(mapType()), isFalse);
    expect(isFutureType(futureType()), isTrue);
    expect(isFutureType(streamType()), isFalse);
  });
  test('isStreamType', () {
    expect(isStreamType(boolType), isFalse);
    expect(isStreamType(listType()), isFalse);
    expect(isStreamType(iterableType()), isFalse);
    expect(isStreamType(mapType()), isFalse);
    expect(isStreamType(futureType()), isFalse);
    expect(isStreamType(streamType()), isTrue);
  });
}
