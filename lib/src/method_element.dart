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

/// An element representing a method.
class MethodElement extends FunctionElement implements Abstract, Static {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [MethodElement] with the given [name].
  MethodElement(
    String name, {
    Iterable<GenericType> typeParameters,
    DartType returnType,
    Iterable<ParameterElement> parameters,
    this.isAbstract: false,
    this.isStatic: false,
    Iterable annotations,
    String comments,
  })
      : super(
          name,
          typeParameters: typeParameters,
          returnType: returnType,
          parameters: parameters,
          annotations: annotations,
          comments: comments,
        );

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
}
