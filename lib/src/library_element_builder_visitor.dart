// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:craft_element/element.dart';
import 'package:craft_element_builder/element_builder.dart';
import 'package:craft_element_builder/cached_element_builder.dart';

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Implements [ElementBuilderVisitor] for [LibraryElement]s.
abstract class LibraryElementBuilderVisitor implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// A cache containing the libraries encountered.
  final Map<Uri, ElementBuilder<LibraryElement>> _libraries =
      <Uri, ElementBuilder<LibraryElement>>{};

  //---------------------------------------------------------------------
  // ElementBuilderVisitor
  //---------------------------------------------------------------------

  @override
  ElementBuilder<LibraryElement> visitLibraryElement(
    analyzer.LibraryElement element,
  ) {
    final uri = element.source.uri;

    if (_libraries.containsKey(uri)) {
      return _libraries[uri];
    }

    // Create the builder and store it within the cache
    final builder = library(uri);
    _libraries[uri] = new CachedElementBuilder<LibraryElement>(builder);

    // Assign the values that are directly present on the element
    visitElement(element, builder);

    builder
      ..imports = element.imports
          .map<ElementBuilder<UriReferencedElement>>(visitImportElement)
          .toList()
      ..exports = element.exports
          .map<ElementBuilder<UriReferencedElement>>(visitExportElement)
          .toList();

    // Iterate through the units to get the contents of the library
    //
    // Create temporary lists as Iterable does not contain add methods
    final classes = <ElementBuilder<ClassElement>>[];
    final fields = <ElementBuilder<FieldElement>>[];
    final functions = <ElementBuilder<FunctionElement>>[];
    final typedefs = <ElementBuilder<TypedefElement>>[];

    for (var unit in element.units) {
      classes
        ..addAll(unit.types.map(visitClassElement))
        ..addAll(unit.enums.map(visitClassElement));

      fields.addAll(
        unit.topLevelVariables.map(visitTopLevelVariableElement),
      );
      functions.addAll(
        unit.functions.map(visitFunctionElement),
      );
      typedefs.addAll(
        unit.functionTypeAliases.map(visitFunctionTypeAliasElement),
      );
    }

    builder
      ..classes = classes
      ..fields = fields
      ..functions = functions
      ..typedefs = typedefs
      // Force a build to prevent stack overflows when a library contains a
      // circular reference
      ..build();

    return builder;
  }
}
