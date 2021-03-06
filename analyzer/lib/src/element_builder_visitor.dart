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

import 'element_builder_visitor_impl.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [analyzer.ElementVisitor] that outputs [ElementBuilder]s that represent
/// the structure of elements encountered by the analyzer.
abstract class ElementBuilderVisitor
    implements analyzer.ElementVisitor<ElementBuilder> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of the [ElementBuilderVisitor] class.
  factory ElementBuilderVisitor() => new ElementBuilderVisitorImpl();

  //---------------------------------------------------------------------
  // ElementVisitor
  //---------------------------------------------------------------------

  @override
  ElementBuilder<ClassElement> visitClassElement(
    analyzer.ClassElement element,
  );

  @override
  ElementBuilder<ConstructorElement> visitConstructorElement(
    analyzer.ConstructorElement element,
  );

  @override
  ElementBuilder<UriReferencedElement> visitExportElement(
    analyzer.ExportElement element,
  );

  @override
  ElementBuilder<FieldElement> visitFieldElement(
    analyzer.FieldElement element,
  );

  @override
  ElementBuilder<FunctionElement> visitFunctionElement(
    analyzer.FunctionElement element,
  );

  @override
  ElementBuilder<TypedefElement> visitFunctionTypeAliasElement(
    analyzer.FunctionTypeAliasElement element,
  );

  @override
  ElementBuilder<UriReferencedElement> visitImportElement(
    analyzer.ImportElement element,
  );

  @override
  ElementBuilder<LibraryElement> visitLibraryElement(
    analyzer.LibraryElement element,
  );

  @override
  ElementBuilder<MethodElement> visitMethodElement(
    analyzer.MethodElement element,
  );

  @override
  ElementBuilder<ParameterElement> visitParameterElement(
    analyzer.ParameterElement element,
  );

  @override
  ElementBuilder<FieldElement> visitTopLevelVariableElement(
    analyzer.TopLevelVariableElement element,
  );

  //---------------------------------------------------------------------
  // DartType
  //---------------------------------------------------------------------

  /// Visits the [type] and creates the associated [DartType].
  T visitDartType<T extends DartType>(analyzer.DartType type);

  /// Visits the [type] and creates the associated [InterfaceType].
  InterfaceType<T> visitInterfaceType<T extends DartType>(
    analyzer.InterfaceType type,
  );

  /// Visits the [type] and creates the associated [FunctionType].
  FunctionType<T> visitFunctionType<T extends DartType>(
    analyzer.FunctionType type,
  );

  /// Visits the [type] and creates the associated [GenericType].
  GenericType visitGenericType(
    analyzer.TypeParameterType type,
  );

  //---------------------------------------------------------------------
  // BaseElement
  //---------------------------------------------------------------------

  /// Visits the [element] and assigns values to the [builder].
  ///
  /// This is used to get common [BaseElementBuilder] functionality that is
  /// present on an [analyzer.Element]. This will get the name of the element,
  /// visit annotations, and documentation comments.
  ElementBuilder<T> visitElement<T extends BaseElement>(
    analyzer.Element element,
    BaseElementBuilder<T> builder,
  );

  /// Visits the [annotation] and returns an instance of it if possible.
  dynamic visitElementAnnotation(analyzer.ElementAnnotation annotation);

  /// Visits the [element] and returns its documentation comment.
  CommentBuffer visitDocumentationComment(analyzer.Element element);
}
