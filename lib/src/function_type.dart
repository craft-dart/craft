// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'dart_type.dart';
import 'parameterized_type.dart';
import 'helpers.dart';
import 'interface_types.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A type that references a function.
class FunctionType extends DartType implements ParameterizedType {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  @override
  final List<DartType> typeArguments;

  /// The return type of the function.
  final DartType returnType;

  /// The names for the required parameters.
  final List<String> requiredParameterNames;

  /// The types for the required parameters.
  final List<DartType> requiredParameterTypes;

  /// The names for the optional parameters.
  final List<String> optionalParameterNames;

  /// The types for the positional parameters.
  final List<DartType> optionalParameterTypes;

  /// The types for the named parameters.
  final Map<String, DartType> namedParameterTypes;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [FunctionType].
  ///
  /// A [returnType] can be specified for the function type. If it is not
  /// specified it is set to [dynamicType].
  ///
  /// A generic function/method can be specified through [typeArguments].
  ///
  /// Required and optional parameters need to have a name and corresponding
  /// type for each parameter. For required parameters these are set in
  /// [requiredParameterNames] and [requiredParameterTypes]. For optional
  /// parameters [optionalParameterNames] and [optionalParameterTypes] are
  /// used.
  ///
  /// Named parameters are specified in [namedParameterTypes] where the key is
  /// the variable name and the value is the type.
  FunctionType({
    Iterable<DartType> typeArguments,
    DartType returnType,
    Iterable<String> requiredParameterNames,
    Iterable<DartType> requiredParameterTypes,
    Iterable<String> optionalParameterNames,
    Iterable<DartType> optionalParameterTypes,
    Map<String, DartType> namedParameterTypes,
  })
      : typeArguments = defaultList<DartType>(typeArguments),
        returnType = returnType ?? dynamicType,
        requiredParameterNames = defaultList<String>(requiredParameterNames),
        requiredParameterTypes = defaultList<DartType>(requiredParameterTypes),
        optionalParameterNames = defaultList<String>(optionalParameterNames),
        optionalParameterTypes = defaultList<DartType>(optionalParameterTypes),
        namedParameterTypes = defaultMap<String, DartType>(namedParameterTypes);
}
