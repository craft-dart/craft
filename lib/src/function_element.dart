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
import 'helpers.dart';
import 'interfaces.dart';
import 'parameter_element.dart';
import 'parameter_kind.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An element representing a function.
class FunctionElement extends BaseElement
    with EnclosedElement, EnclosingElement, Accessible, Generic
    implements Typed<FunctionType<GenericType>> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The list of parameters for the function.
  final List<ParameterElement> parameters;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [FunctionElement] with the given [name].
  FunctionElement(
    String name, {
    Iterable<GenericType> typeParameters,
    DartType returnType,
    Iterable<ParameterElement> parameters,
    Iterable annotations,
    String comments,
  })
      : this._(
          name,
          defaultList(typeParameters),
          returnType ?? dynamicType,
          defaultList(parameters),
          annotations,
          comments,
        );

  FunctionElement._(
    String name,
    List<GenericType> typeParameters,
    DartType returnType,
    this.parameters,
    Iterable annotations,
    String comments,
  )
      : type = _functionType(typeParameters, returnType, parameters),
        super(name, annotations, comments) {
    // Using `this` is not needed as `this.parameters` is already present
    encloseAll(parameters);
  }

  //---------------------------------------------------------------------
  // Typed
  //---------------------------------------------------------------------

  @override
  final FunctionType<GenericType> type;

  static FunctionType<GenericType> _functionType(
    List<GenericType> typeParameters,
    DartType returnType,
    List<ParameterElement> parameters,
  ) {
    final requiredParameterNames = <String>[];
    final requiredParameterTypes = <DartType>[];
    final optionalParameterNames = <String>[];
    final optionalParameterTypes = <DartType>[];
    final namedParameterTypes = <String, DartType>{};

    for (var parameter in parameters) {
      final name = parameter.name;
      final type = parameter.type;

      switch (parameter.parameterKind) {
        case ParameterKind.required:
          requiredParameterNames.add(name);
          requiredParameterTypes.add(type);
          break;
        case ParameterKind.positional:
          optionalParameterNames.add(name);
          optionalParameterTypes.add(type);
          break;
        case ParameterKind.named:
          namedParameterTypes[name] = type;
          break;
      }
    }

    return new FunctionType<GenericType>(
      typeArguments: typeParameters,
      returnType: returnType,
      requiredParameterNames: requiredParameterNames,
      requiredParameterTypes: requiredParameterTypes,
      optionalParameterNames: optionalParameterNames,
      optionalParameterTypes: optionalParameterTypes,
      namedParameterTypes: namedParameterTypes,
    );
  }

  //---------------------------------------------------------------------
  // Properties
  //---------------------------------------------------------------------

  /// The return type of the function.
  DartType get returnType => type.returnType;
}
