// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'dart_type.dart';
import 'interface_type.dart';

//---------------------------------------------------------------------
// Common interface types
//---------------------------------------------------------------------

/// A boolean type.
final InterfaceType boolType = new InterfaceType('bool');

/// A number type.
final InterfaceType numType = new InterfaceType('num');

/// An integer type.
final InterfaceType intType = new InterfaceType('int');

/// A double type.
final InterfaceType doubleType = new InterfaceType('double');

/// A string type.
final InterfaceType stringType = new InterfaceType('String');

/// A dynamic type.
final InterfaceType dynamicType = new InterfaceType('dynamic');

/// An object type.
final InterfaceType objectType = new InterfaceType('Object');

/// A null type.
final InterfaceType nullType = new InterfaceType('Null');

/// A void type.
final InterfaceType voidType = new InterfaceType('void');

//---------------------------------------------------------------------
// Factory functions
//---------------------------------------------------------------------

/// Name for a List.
const String _listName = 'List';

/// Name for an Iterable.
const String _iterableName = 'Iterable';

/// Name for a Map.
const String _mapName = 'Map';

/// Name for a Future.
const String _futureName = 'Future';

/// Name for a Stream.
const String _streamName = 'Stream';

/// Creates an instance of [InterfaceType] representing a list.
///
/// A type [argument] can be provided for additional type information. If it is
/// not specified the type is `List<dynamic>`.
InterfaceType<T> listType<T extends DartType>([T argument]) =>
    new InterfaceType<T>(_listName, _defaultArgumentList<T>(argument));

/// Creates an instance of [InterfaceType] representing an iterable.
///
/// A type [argument] can be provided for additional type information. If it is
/// not specified the type is `Iterable<dynamic>`.
InterfaceType<T> iterableType<T extends DartType>([T argument]) =>
    new InterfaceType<T>(_iterableName, _defaultArgumentList<T>(argument));

/// Creates an instance of [InterfaceType] representing a map.
///
/// A type for the [key] and/or [value] can be provided for addition type
/// information. If it is not specified the key and value type arguments
/// default to [dynamicType].
InterfaceType<T> mapType<T extends DartType>({T key, T value}) {
  key ??= dynamicType as T;
  value ??= dynamicType as T;

  return new InterfaceType<T>('Map', <T>[key, value]);
}

/// Creates an instance of [InterfaceType] representing a future.
///
/// A type [argument] can be provided for additional type information. If it is
/// not specified the type is `Future<dynamic>`.
InterfaceType<T> futureType<T extends DartType>([T argument]) =>
    new InterfaceType<T>(_futureName, _defaultArgumentList<T>(argument));

/// Creates an instance of [InterfaceType] representing a stream.
///
/// A type [argument] can be provided for additional type information. If it is
/// not specified the type is `Future<dynamic>`.
InterfaceType<T> streamType<T extends DartType>([T argument]) =>
    new InterfaceType<T>(_streamName, _defaultArgumentList<T>(argument));

/// Creates a default argument list for a type with a single type [argument].
List<T> _defaultArgumentList<T extends DartType>(T argument) =>
    <T>[argument ?? dynamicType as T];

//---------------------------------------------------------------------
// Type checks
//---------------------------------------------------------------------

/// Checks whether the [type] is a List.
///
/// This will not verify the correctness of any generic type arguments.
bool isListType(DartType type) =>
    type is InterfaceType ? type.name == _listName : false;

/// Checks whether the [type] is an Iterable.
///
/// This will not verify the correctness of any generic type arguments.
bool isIterableType(DartType type) =>
    type is InterfaceType ? type.name == _iterableName : false;

/// Checks whether the [type] is a Map.
///
/// This will not verify the correctness of any generic type arguments.
bool isMapType(DartType type) =>
    type is InterfaceType ? type.name == _mapName : false;

/// Checks whether the [type] is a Future.
///
/// This will not verify the correctness of any generic type arguments.
bool isFutureType(DartType type) =>
    type is InterfaceType ? type.name == _futureName : false;

/// Checks whether the [type] is a Stream.
///
/// This will not verify the correctness of any generic type arguments.
bool isStreamType(DartType type) =>
    type is InterfaceType ? type.name == _streamName : false;
