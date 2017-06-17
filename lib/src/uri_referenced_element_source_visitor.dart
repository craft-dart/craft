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

/// Builds an AST representation of [UriReferencedElement]s and
/// [UriConfigurationElement]s.
abstract class UriReferencedElementSourceVisitor
    implements ElementSourceVisitor {
  //---------------------------------------------------------------------
  // ElementSourceVisitor
  //---------------------------------------------------------------------

  @override
  ast.ImportDirective visitImportElement(UriReferencedElement element) {
    final elementPrefix = element.prefix;
    var asKeyword;
    var prefix;

    if (elementPrefix.isNotEmpty) {
      asKeyword = $as;
      prefix = stringIdentifier(elementPrefix);
    }

    return astFactory.importDirective(
      null, // comment
      null, // metadata
      $import,
      _visitUriReference(element),
      element.configurations
          .map<ast.Configuration>(visitUriConfigurationElement)
          .toList(),
      element.deferred ? $deferred : null,
      asKeyword as ast.Token,
      prefix as ast.SimpleIdentifier,
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
        _visitUriReference(element),
        element.configurations
            .map<ast.Configuration>(visitUriConfigurationElement)
            .toList(),
        _visitCombinators(element),
        $semicolon,
      );

  @override
  ast.Configuration visitUriConfigurationElement(
    UriConfigurationElement element,
  ) {
    final equals = element.equals;
    var equalsToken;
    var value;

    if (equals != 'true') {
      equalsToken = $equality;
      value = stringLiteral(equals);
    }

    return astFactory.configuration(
      $if,
      $openParen,
      dottedName(element.when),
      equalsToken as ast.Token,
      value as ast.StringLiteral,
      $closeParen,
      _visitUriConfiguration(element),
    );
  }

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

  /// Determines the path to the [element]s uri from the library containing the
  /// element.
  ast.StringLiteral _visitUriReference(UriReferencedElement element) =>
      _uriPath(
        element.library.uri,
        (element.enclosingElement as LibraryElement).uri,
      );

  /// Determines the path to the [element]s uri from the library containing the
  /// element.
  ast.StringLiteral _visitUriConfiguration(UriConfigurationElement element) =>
      _uriPath(
        element.library.uri,
        ((element.enclosingElement as UriReferencedElement).enclosingElement
                as LibraryElement)
            .uri,
      );

  // \TODO Use relative path when relevant

  /// Determines the path [to] the Uri [from] its current location.
  ast.StringLiteral _uriPath(Uri to, Uri from) =>
      stringLiteral(from.toString());
}
