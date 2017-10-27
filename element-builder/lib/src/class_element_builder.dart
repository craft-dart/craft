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
import 'constructor_element_builder.dart';
import 'element_builder.dart';
import 'interfaces.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [ElementBuilder] for [ClassElement]s.
class ClassElementBuilder extends BaseElementBuilder<ClassElement>
    with AbstractBuilder<ClassElement>, GenericBuilder<ClassElement> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The parent class type.
  InterfaceType supertype;

  /// The types this class implements.
  Iterable<InterfaceType> interfaces = <InterfaceType>[];

  /// The types this class mixins with.
  Iterable<InterfaceType> mixins = <InterfaceType>[];

  /// The fields for the class.
  Iterable<ElementBuilder<FieldElement>> fields =
      <ElementBuilder<FieldElement>>[];

  /// The methods for the class.
  Iterable<ElementBuilder<MethodElement>> methods =
      <ElementBuilder<MethodElement>>[];

  /// The constructors for the class.
  Iterable<ElementBuilder<ConstructorElement>> constructors =
      <ElementBuilder<ConstructorElement>>[];

  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  ClassElement buildInternal() {
    // For classes which declare no constructors there is always an implicit
    // one created by the analyzer. This mirrors this behavior.
    final classConstructors = constructors.isNotEmpty
        ? constructors
        : <ConstructorElementBuilder>[defaultConstructor()];

    // Set the type on all the constructors to be the class name
    //
    // The return type also includes the type parameters for the class.
    final classType = new InterfaceType(name, typeParameters);
    for (var constructor in classConstructors) {
      (constructor as ConstructorElementBuilder).returnType = classType;
    }

    return new ClassElement(
      name,
      supertype: supertype,
      isAbstract: isAbstract,
      interfaces: interfaces,
      mixins: mixins,
      typeParameters: typeParameters,
      fields: buildElements<FieldElement>(fields),
      methods: buildElements<MethodElement>(methods),
      constructors: buildElements<ConstructorElement>(classConstructors),
      annotations: annotations,
      comments: comments.toString(),
    );
  }
}

/// Creates an instance of [ClassElementBuilder] with the given [name].
ClassElementBuilder clazz(String name) =>
    new ClassElementBuilder()..name = name;
