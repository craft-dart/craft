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

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An [ElementBuilder] for [TypedefElement].
class TypedefElementBuilder extends FunctionElementBuilder<TypedefElement> {
  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  TypedefElement buildInternal() => new TypedefElement(
        name,
        returnType: returnType,
        parameters: buildElements<ParameterElement>(parameters),
        typeParameters: typeParameters,
        annotations: annotations,
        comments: comments.toString(),
      );
}

/// Creates an instance of [TypedefElementBuilder] with the given [name].
///
/// The builder returned is equivalent to the following typedef declaration.
///
///     // sdk < 1.24.0
///     typedef dynamic name();
///
///     // sdk >= 1.24.0
///     typedef name = dynamic Function();
TypedefElementBuilder typedef(String name) =>
    new TypedefElementBuilder()..name = name;
