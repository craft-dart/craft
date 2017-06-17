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
import 'parameter_kind.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An element representing a parameter on a function or method.
class ParameterElement extends BaseElement
    with EnclosedElement
    implements Defaults, Typed {
  //---------------------------------------------------------------------
  // Typed
  //---------------------------------------------------------------------

  @override
  final DartType type;

  //---------------------------------------------------------------------
  // Defaults
  //---------------------------------------------------------------------

  @override
  final dynamic defaultValue;

  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The kind of parameter.
  final ParameterKind parameterKind;

  /// Whether the parameter is an initializer.
  ///
  /// This should only be in constructors and signifies when `this.value` is
  /// used.
  final bool isInitializer;

  /// Whether the parameter is covariant.
  ///
  /// When a parameter is covariant an override may tighten the type passed
  /// in.
  final bool isCovariant;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ParameterElement] with the given [name] and
  /// accepting the given [type].
  ///
  /// By default the [parameterKind] is set to required. If the parameter is
  /// optional then [defaultValue] should be set unless null is desired for the
  /// default value.
  ParameterElement(
    String name, {
    DartType type,
    this.parameterKind: ParameterKind.required,
    this.isInitializer: false,
    this.isCovariant: false,
    this.defaultValue,
    Iterable annotations,
  })
      : type = type ?? dynamicType,
        super(name, annotations, '');

  //---------------------------------------------------------------------
  // Properties
  //---------------------------------------------------------------------

  /// Whether the parameter is required by calling code.
  bool get isRequired => parameterKind == ParameterKind.required;

  /// Whether the parameter is optional for calling code.
  bool get isOptional => !isRequired;
}
