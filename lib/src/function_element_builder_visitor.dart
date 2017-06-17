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

/// Implements [ElementBuilderVisitor] for [FunctionElement]s and its
/// subclasses.
abstract class FunctionElementBuilderVisitor implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // ElementBuilderVisitor
  //---------------------------------------------------------------------

  @override
  ElementBuilder<FunctionElement> visitFunctionElement(
    analyzer.FunctionElement element,
  ) =>
      _visitFunctionTypedElement<FunctionElement>(
          element, new FunctionElementBuilder());

  @override
  ElementBuilder<ConstructorElement> visitConstructorElement(
    analyzer.ConstructorElement element,
  ) =>
      _visitFunctionTypedElement<ConstructorElement>(
        element,
        new ConstructorElementBuilder(),
      ) as ConstructorElementBuilder
        ..isFactory = element.isFactory
        ..isConst = element.isConst;

  @override
  ElementBuilder<MethodElement> visitMethodElement(
    analyzer.MethodElement element,
  ) {
    final builder = _visitFunctionTypedElement<MethodElement>(
      element,
      new MethodElementBuilder(),
    ) as MethodElementBuilder
      ..isAbstract = element.isAbstract
      ..isStatic = element.isStatic;

    return builder;
  }

  @override
  ElementBuilder<TypedefElement> visitFunctionTypeAliasElement(
    analyzer.FunctionTypeAliasElement element,
  ) =>
      _visitFunctionTypedElement<TypedefElement>(
        element,
        new TypedefElementBuilder(),
      );

  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  FunctionElementBuilder<T>
      _visitFunctionTypedElement<T extends FunctionElement>(
    analyzer.FunctionTypedElement element,
    FunctionElementBuilder<T> builder,
  ) =>
          visitElement<FunctionElement>(
            element,
            builder,
          ) as FunctionElementBuilder<T>
            ..returnType = visitDartType(element.returnType)
            ..typeParameters = element.typeParameters
                .map<analyzer.TypeParameterType>((e) => e.type)
                .map<GenericType>(visitGenericType)
            ..parameters = element.parameters
                .map<ElementBuilder<ParameterElement>>(visitParameterElement);
}
