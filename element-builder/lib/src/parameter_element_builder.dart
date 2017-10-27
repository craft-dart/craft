// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_type/type.dart';

import 'base_element_builder.dart';
import 'interfaces.dart';
import 'invalid_element_error.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [BaseElementBuilder] for [ParameterElement]s.
///
/// The [ParameterElementBuilder] does the following validations.
///
/// * The parameter must have a name.
/// * A default value is not valid for a required parameter.
class ParameterElementBuilder extends BaseElementBuilder<ParameterElement>
    with
        DefaultsBuilder<ParameterElement>,
        TypedBuilder<ParameterElement, DartType> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The kind of parameter.
  ParameterKind parameterKind = ParameterKind.required;

  /// Whether the parameter is an initializer.
  ///
  /// This should only be in constructors and signifies when `this.value` is
  /// used.
  bool isInitializer = false;

  /// Whether the parameter is covariant.
  ///
  /// When a parameter is covariant an override may tighten the type passed
  /// in.
  bool isCovariant = false;

  //---------------------------------------------------------------------
  // MetadataBuilder
  //---------------------------------------------------------------------

  @override
  void validate() {
    super.validate();

    if ((defaultValue != null) && (parameterKind == ParameterKind.required)) {
      throw new InvalidElementError(
        'A required parameter has no default value',
      );
    }
  }

  @override
  ParameterElement buildInternal() => new ParameterElement(
        name,
        type: type,
        parameterKind: parameterKind,
        isInitializer: isInitializer,
        isCovariant: isCovariant,
        defaultValue: defaultValue,
        annotations: annotations,
      );
}

/// Creates an instance of [ParameterElementBuilder] with the given [name]
/// which represents a required parameter.
///
/// After calling the value in the builder is equivalent to the following
/// parameter declaration.
///
///     void func(name)
ParameterElementBuilder parameter(String name) =>
    new ParameterElementBuilder()..name = name;

/// Creates an instance of [ParameterElementBuilder] with the given [name]
/// which represents a positional parameter.
///
/// After calling the value in the builder is equivalent to the following
/// parameter declaration.
///
///     void func([name])
ParameterElementBuilder positionalParameter(String name) =>
    parameter(name)..parameterKind = ParameterKind.positional;

/// Creates an instance of [ParameterElementBuilder] with the given [name]
/// which represents a named parameter.
///
/// After calling the value in the builder is equivalent to the following
/// parameter declaration.
///
///     void func({name})
ParameterElementBuilder namedParameter(String name) =>
    parameter(name)..parameterKind = ParameterKind.named;
