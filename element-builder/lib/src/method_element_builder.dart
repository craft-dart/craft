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

/// A [FunctionElementBuilder] for [MethodElement]s.
class MethodElementBuilder extends FunctionElementBuilder<MethodElement>
    with AbstractBuilder, StaticBuilder {
  //---------------------------------------------------------------------
  // MetadataBuilder
  //---------------------------------------------------------------------

  @override
  MethodElement buildInternal() => new MethodElement(
        name,
        returnType: returnType,
        parameters: buildElements<ParameterElement>(parameters),
        typeParameters: typeParameters,
        isAbstract: isAbstract,
        isStatic: isStatic,
        annotations: annotations,
        comments: comments.toString(),
      );
}

/// Creates an instance of [MethodElementBuilder] with the given [name].
MethodElementBuilder method(String name) =>
    new MethodElementBuilder()..name = name;

/// Creates an instance of [MethodElementBuilder] with the given [name] where
/// the method is a static class method.
MethodElementBuilder staticMethod(String name) => method(name)..isStatic = true;
