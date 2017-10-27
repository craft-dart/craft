// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/ast/ast.dart' as ast;
import 'package:analyzer/dart/ast/standard_ast_factory.dart';
import 'package:analyzer/dart/ast/token.dart' as ast;
import 'package:craft_element/element.dart';

import 'ast/identifier.dart';
import 'ast/tokens.dart';
import 'element_source_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Builds an AST representation of [LibraryElement]s.
abstract class LibraryElementSourceBuilder implements ElementSourceVisitor {
  //---------------------------------------------------------------------
  // ElementSourceVisitor
  //---------------------------------------------------------------------

  @override
  ast.CompilationUnit visitLibraryElement(LibraryElement element) {
    final directives = <ast.Directive>[];

    // Add library directive if applicable
    final libraryDirective = _libraryDirective(element);

    if (libraryDirective != null) {
      directives.add(libraryDirective);
    }

    // Add imports and exports
    directives
      ..addAll(
        element.imports.map<ast.ImportDirective>(visitImportElement),
      )
      ..addAll(
        element.exports.map<ast.ExportDirective>(visitExportElement),
      );

    // Add declarations
    final declarations = <ast.CompilationUnitMember>[]..addAll(
        element.classes.map<ast.ClassDeclaration>(visitClassElement),
      );

    return astFactory.compilationUnit(
      null, // beginToken
      null, // scriptTag
      directives,
      declarations,
      null, // endToken
    );
  }

  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  /// Create a [ast.LibraryDirective] from the [element].
  ///
  /// If a library directive is not needed none will be created.
  ///
  /// It is not needed if
  ///
  /// * The name is empty
  /// * The annotations are empty
  /// * The comments are empty
  ast.LibraryDirective _libraryDirective(LibraryElement element) {
    final name = element.name;
    final nameEmpty = name.isEmpty;

    // See if a directive is needed
    if (nameEmpty && element.annotations.isEmpty && element.comments.isEmpty) {
      return null;
    }

    return astFactory.libraryDirective(
      visitCommented(element),
      visitAnnotated(element),
      $library,
      _libraryIdentifier(nameEmpty ? _generatedLibraryName(element.uri) : name),
      $semicolon,
    );
  }

  /// Create a [ast.LibraryIdentifier] from the [name].
  ast.LibraryIdentifier _libraryIdentifier(String name) =>
      astFactory.libraryIdentifier(dottedName(name).components);

  // \TODO Implement

  /// Generates a library name based on the [uri].
  String _generatedLibraryName(Uri uri) => 'temp';
}
