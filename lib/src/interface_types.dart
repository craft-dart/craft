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
InterfaceType listType([DartType argument]) =>
    new InterfaceType(_listName, _defaultArgumentList(argument));

/// Creates an instance of [InterfaceType] representing an iterable.
///
/// A type [argument] can be provided for additional type information. If it is
/// not specified the type is `Iterable<dynamic>`.
InterfaceType iterableType([DartType argument]) =>
    new InterfaceType(_iterableName, _defaultArgumentList(argument));

/// Creates an instance of [InterfaceType] representing a map.
///
/// A type for the [key] and/or [value] can be provided for addition type
/// information. If it is not specified the key and value type arguments
/// default to [dynamicType].
InterfaceType mapType({DartType key, DartType value}) {
  key ??= dynamicType;
  value ??= dynamicType;

  return new InterfaceType('Map', <DartType>[key, value]);
}

/// Creates an instance of [InterfaceType] representing a future.
///
/// A type [argument] can be provided for additional type information. If it is
/// not specified the type is `Future<dynamic>`.
InterfaceType futureType([DartType argument]) =>
    new InterfaceType(_futureName, _defaultArgumentList(argument));

/// Creates an instance of [InterfaceType] representing a stream.
///
/// A type [argument] can be provided for additional type information. If it is
/// not specified the type is `Future<dynamic>`.
InterfaceType streamType([DartType argument]) =>
    new InterfaceType(_streamName, _defaultArgumentList(argument));

/// Creates a default argument list for a type with a single type [argument].
List<DartType> _defaultArgumentList(DartType argument) =>
    <DartType>[argument ?? dynamicType];

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
