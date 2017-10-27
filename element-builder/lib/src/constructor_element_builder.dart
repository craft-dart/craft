// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'element_builder.dart';
import 'function_element_builder.dart';
import 'interfaces.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An [ElementBuilder] for [ConstructorElement]s.
class ConstructorElementBuilder
    extends FunctionElementBuilder<ConstructorElement>
    with ConstantBuilder<ConstructorElement> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// Whether the constructor is a factory constructor.
  bool isFactory = false;

  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  void validate() {
    // Do not call super.validate() as it contains name validation which will
    // fail for default constructors
  }

  @override
  ConstructorElement buildInternal() => new ConstructorElement(
        returnType,
        name: name,
        parameters: buildElements<ParameterElement>(parameters),
        typeParameters: typeParameters,
        isConst: isConst,
        isFactory: isFactory,
        annotations: annotations,
        comments: comments.toString(),
      );
}

/// Creates an instance of [ConstructorElement] that represents a default
/// constructor.
ConstructorElementBuilder defaultConstructor() =>
    new ConstructorElementBuilder();

/// Creates an instance of [ConstructorElement] with the given [name]d
/// constructor.
ConstructorElementBuilder constructor(String name) =>
    new ConstructorElementBuilder()..name = name;
