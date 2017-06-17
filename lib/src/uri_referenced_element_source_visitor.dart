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
import 'ast/literal.dart';
import 'ast/tokens.dart';
import 'element_source_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Builds an AST representation of [FunctionElement]s and its associated
/// subclasses.
abstract class UriReferencedElementSourceVisitor
    implements ElementSourceVisitor {
  //---------------------------------------------------------------------
  // ElementSourceVisitor
  //---------------------------------------------------------------------

  @override
  ast.ImportDirective visitImportElement(UriReferencedElement element) {
    final prefix = element.prefix;
    final prefixIsEmpty = prefix.isEmpty;

    return astFactory.importDirective(
      null, // comment
      null, // metadata
      $import,
      _visitUri(element),
      null, // configurations
      element.deferred ? $deferred : null,
      prefixIsEmpty ? null : $as,
      prefixIsEmpty ? null : stringIdentifier(prefix),
      _visitCombinators(element),
      $semicolon,
    );
  }

  @override
  ast.ExportDirective visitExportElement(UriReferencedElement element) =>
      astFactory.exportDirective(
        null, // comment
        null, // metadata
        $export,
        _visitUri(element),
        null, // configurations
        _visitCombinators(element),
        $semicolon,
      );

  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  /// Visits the [element]'s combinators.
  List<ast.Combinator> _visitCombinators(UriReferencedElement element) {
    final shownNames = element.shownNames;
    final hiddenNames = element.hiddenNames;
    final shownNamesEmpty = shownNames.isEmpty;

    if (shownNamesEmpty && hiddenNames.isEmpty) {
      return <ast.Combinator>[];
    }

    return [
      (!shownNamesEmpty
          ? astFactory.showCombinator($show,
              shownNames.map<ast.SimpleIdentifier>(stringIdentifier).toList())
          : astFactory.hideCombinator($hide,
              hiddenNames.map<ast.SimpleIdentifier>(stringIdentifier).toList()))
    ];
  }

  // \TODO Use relative path when relevant

  /// Visits the [element]'s uri.
  ast.StringLiteral _visitUri(UriReferencedElement element) =>
      stringLiteral(element.library.uri.toString());
}
