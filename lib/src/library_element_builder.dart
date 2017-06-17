// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'base_element_builder.dart';
import 'class_element_builder.dart';
import 'element_builder.dart';
import 'field_element_builder.dart';
import 'function_element_builder.dart';
import 'typedef_element_builder.dart';
import 'uri_referenced_element_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An [ElementBuilder] for [LibraryElement]s.
class LibraryElementBuilder extends BaseElementBuilder<LibraryElement> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The location of the library.
  Uri uri;

  /// The import references for the library.
  Iterable<ElementBuilder<UriReferencedElement>> imports =
      <ElementBuilder<UriReferencedElement>>[];

  /// The export references for the library.
  Iterable<ElementBuilder<UriReferencedElement>> exports =
      <ElementBuilder<UriReferencedElement>>[];

  /// The classes contained within the library.
  Iterable<ElementBuilder<ClassElement>> classes =
      <ElementBuilder<ClassElement>>[];

  /// The functions contained within the library.
  Iterable<ElementBuilder<FunctionElement>> functions =
      <ElementBuilder<FunctionElement>>[];

  /// The fields contained within the library.
  Iterable<ElementBuilder<FieldElement>> fields =
      <ElementBuilder<FieldElement>>[];

  /// The function type definitions contained within the library.
  Iterable<ElementBuilder<TypedefElement>> typedefs =
      <ElementBuilder<TypedefElement>>[];

  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  LibraryElement buildInternal() => new LibraryElement(
        uri,
        name: name,
        imports: buildElements<UriReferencedElement>(imports),
        exports: buildElements<UriReferencedElement>(exports),
        classes: buildElements<ClassElement>(classes),
        functions: buildElements<FunctionElement>(functions),
        fields: buildElements<FieldElement>(fields),
        typedefs: buildElements<TypedefElement>(typedefs),
        annotations: annotations,
        comments: comments.toString(),
      );

  @override
  void validate() {}
}

/// Creates an instance of [LibraryElementBuilder] located at the given [uri].
LibraryElementBuilder library(Uri uri) =>
    new LibraryElementBuilder()..uri = uri;
