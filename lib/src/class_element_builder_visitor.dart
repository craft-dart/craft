// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:analyzer/dart/element/type.dart' as analyzer;
import 'package:craft_element/element.dart';
import 'package:craft_element_builder/element_builder.dart';
import 'package:craft_type/type.dart';

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Implements [ElementBuilderVisitor] for [ClassElement]s and its associated
/// subclasses.
abstract class ClassElementVisitorBuilder implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // ElementBuilderVisitor
  //---------------------------------------------------------------------

  @override
  ElementBuilder<ClassElement> visitClassElement(
    analyzer.ClassElement element,
  ) =>
      visitElement<ClassElement>(
        element,
        new ClassElementBuilder(),
      ) as ClassElementBuilder
        ..typeParameters = element.typeParameters
            .map<analyzer.TypeParameterType>((e) => e.type)
            .map<GenericType>(visitGenericType)
        // Object has a null supertype
        ..supertype =
            element.supertype != null ? visitDartType(element.supertype) : null
        ..interfaces = element.interfaces.map<InterfaceType>(visitInterfaceType)
        ..mixins = element.mixins.map<InterfaceType>(visitInterfaceType)
        ..constructors = element.constructors
            .map<ElementBuilder<ConstructorElement>>(visitConstructorElement)
        ..fields =
            element.fields.map<ElementBuilder<FieldElement>>(visitFieldElement)
        ..methods = element.methods
            .map<ElementBuilder<MethodElement>>(visitMethodElement);
}
