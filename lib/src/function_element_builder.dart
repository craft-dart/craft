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
import 'element_builder.dart';
import 'interfaces.dart';
import 'parameter_element_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [ElementBuilder] for [FunctionElement].
///
/// The [FunctionElementBuilder] does the following validations.
///
/// * The function must have a name.
class FunctionElementBuilder<T extends FunctionElement>
    extends BaseElementBuilder<T> with GenericBuilder<T> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The return type of the function.
  DartType returnType = dynamicType;

  /// The list of parameters for the function.
  List<ParameterElementBuilder> parameters = <ParameterElementBuilder>[];

  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  T buildInternal() => new FunctionElement(
        name,
        returnType: returnType,
        parameters: buildElements<ParameterElement>(parameters),
        typeParameters: typeParameters,
        annotations: annotations,
        comments: comments.toString(),
      ) as T;
}

/// Creates an instance of [FunctionElementBuilder] with the given [name].
///
/// The builder returned is equivalent to the following function declaration.
///
///     name()
FunctionElementBuilder function(String name) =>
    new FunctionElementBuilder()..name = name;
