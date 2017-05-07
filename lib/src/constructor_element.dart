// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_type/type.dart';

import 'function_element.dart';
import 'interfaces.dart';
import 'parameter_element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An element representing a constructor.
class ConstructorElement extends FunctionElement implements Constant {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// Whether the constructor is a factory constructor.
  final bool isFactory;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ConstructorElement] with the given [type].
  ConstructorElement(
    DartType returnType, {
    String name,
    Iterable<GenericType> typeParameters,
    Iterable<ParameterElement> parameters,
    this.isConst: false,
    this.isFactory: false,
    Iterable annotations,
    String comments,
  })
      : super(
          name ?? '',
          typeParameters: typeParameters,
          returnType: returnType,
          parameters: parameters,
          annotations: annotations,
          comments: comments,
        );

  //---------------------------------------------------------------------
  // Constant
  //---------------------------------------------------------------------

  @override
  final bool isConst;

  //---------------------------------------------------------------------
  // Properties
  //---------------------------------------------------------------------

  /// Whether the constructor is the default constructor.
  bool get isDefault => name.isEmpty;
}
