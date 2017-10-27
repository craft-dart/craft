// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_type/type.dart';

import 'base_element.dart';
import 'enclosing_element.dart';
import 'interfaces.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Represents a field within a class or library.
///
/// A field can either be a member variable declaration or a property. This
/// follows the behavior of the analyzer which returns properties as fields on
/// the class.
///
/// This behavior is different from a how dart:mirrors behaves as properties
/// are considered methods and member variables are considered variables.
class FieldElement extends BaseElement
    with Accessible, EnclosedElement
    implements Abstract, Constant, Defaults, Static, Typed {
  //---------------------------------------------------------------------
  // Typed
  //---------------------------------------------------------------------

  @override
  final DartType type;

  //---------------------------------------------------------------------
  // Abstract
  //---------------------------------------------------------------------

  @override
  final bool isAbstract;

  //---------------------------------------------------------------------
  // Static
  //---------------------------------------------------------------------

  @override
  final bool isStatic;

  //---------------------------------------------------------------------
  // Constant
  //---------------------------------------------------------------------

  @override
  final bool isConst;

  //---------------------------------------------------------------------
  // Defaults
  //---------------------------------------------------------------------

  @override
  final dynamic defaultValue;

  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// Whether the field is a property (getter and/or setter).
  final bool isProperty;

  /// Whether the field has a getter.
  final bool getter;

  /// Whether the field has a setter.
  final bool setter;

  /// Whether the field is final.
  final bool isFinal;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of the [FieldElement] class with the given [name].
  FieldElement(
    String name, {
    DartType type,
    this.isProperty: false,
    this.getter: true,
    this.setter: true,
    this.isAbstract: false,
    this.isConst: false,
    this.isFinal: false,
    this.isStatic: false,
    this.defaultValue,
    Iterable annotations,
    String comments,
  })
      : type = type ?? dynamicType,
        super(name, annotations, comments);
}
