// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:quiver/core.dart';
import 'package:collection/collection.dart';

import 'dart_type.dart';
import 'helpers.dart';
import 'named_type.dart';
import 'parameterized_type.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Equality check for [List]s.
const ListEquality _list = const ListEquality();

/// A type that references a class.
class InterfaceType extends DartType implements NamedType, ParameterizedType {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  @override
  final String name;
  @override
  final List<DartType> typeArguments;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates a new [InterfaceType] with the given [name].
  ///
  /// If [typeArguments] are provided the type represents a generic type.
  InterfaceType(this.name, [Iterable<DartType> typeArguments])
      : typeArguments = defaultList<DartType>(typeArguments);

  //---------------------------------------------------------------------
  // Object
  //---------------------------------------------------------------------

  @override
  // ignore: type_annotate_public_apis
  bool operator ==(other) =>
      other is InterfaceType &&
      other.name == name &&
      _list.equals(other.typeArguments, typeArguments);

  @override
  int get hashCode => hash2(name.hashCode, _list.hash(typeArguments));
}
