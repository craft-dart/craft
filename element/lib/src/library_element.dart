// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'base_element.dart';
import 'class_element.dart';
import 'enclosing_element.dart';
import 'field_element.dart';
import 'function_element.dart';
import 'helpers.dart';
import 'typedef_element.dart';
import 'uri_referenced_element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An element representing a Dart library.
class LibraryElement extends BaseElement with EnclosingElement {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The location of the library.
  final Uri uri;

  /// The import references for the library.
  final List<UriReferencedElement> imports;

  /// The export references for the library.
  final List<UriReferencedElement> exports;

  /// The classes contained within the library.
  final List<ClassElement> classes;

  /// The fields contained within the library.
  final List<FieldElement> fields;

  /// The functions contained within the library.
  final List<FunctionElement> functions;

  /// The function type definitions contained within the library.
  final List<TypedefElement> typedefs;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [LibraryElement] with the given [uri].
  ///
  /// The library can be given a [name]. This would correspond to a `library`
  /// directive within the library. The library directive has been optional
  /// so it is not required.
  ///
  ///     library foo;
  ///
  /// For referenced dart files the [imports] and [exports] can be specified.
  LibraryElement(
    this.uri, {
    String name,
    Iterable<UriReferencedElement> imports,
    Iterable<UriReferencedElement> exports,
    Iterable<ClassElement> classes,
    Iterable<FieldElement> fields,
    Iterable<FunctionElement> functions,
    Iterable<TypedefElement> typedefs,
    Iterable annotations,
    String comments,
  })
      : imports = defaultList<UriReferencedElement>(imports),
        exports = defaultList<UriReferencedElement>(exports),
        classes = defaultList<ClassElement>(classes),
        fields = defaultList<FieldElement>(fields),
        functions = defaultList<FunctionElement>(functions),
        typedefs = defaultList<TypedefElement>(typedefs),
        super(name ?? '', annotations, comments) {
    // Use `this` to properly scope the value
    encloseAll(this.imports);
    encloseAll(this.exports);

    encloseAll(this.classes);
    encloseAll(this.fields);
    encloseAll(this.functions);
    encloseAll(this.typedefs);
  }

  //---------------------------------------------------------------------
  // Properties
  //---------------------------------------------------------------------

  /// The libraries imported into this library.
  ///
  /// The values returned do not account for any configuration specific imports
  /// and will only return the interface library.
  Iterable<LibraryElement> get imported =>
      imports.map<LibraryElement>((value) => value.library);

  /// The libraries exported by this library.
  ///
  /// The values returned do not account for any configuration specific exports
  /// and will only return the interface library.
  Iterable<LibraryElement> get exported =>
      exports.map<LibraryElement>((value) => value.library);
}
