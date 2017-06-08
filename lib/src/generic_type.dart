// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:quiver/core.dart';

import 'dart_type.dart';
import 'interface_type.dart';
import 'named_type.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A type that references a generic.
class GenericType extends DartType implements NamedType {
  //---------------------------------------------------------------------
  // NamedType
  //---------------------------------------------------------------------

  @override
  final String name;

  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The interface that the generic extends from.
  final InterfaceType extending;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates a new [GenericType] with the given [name].
  ///
  /// If [extending] is provided the generic will always be of that type.
  GenericType(this.name, [this.extending]);

  //---------------------------------------------------------------------
  // Object
  //---------------------------------------------------------------------

  @override
  // ignore: type_annotate_public_apis
  bool operator ==(other) =>
      other is GenericType &&
      other.name == name &&
      other.extending == extending;

  @override
  int get hashCode => hash2(name.hashCode, extending.hashCode);
}
