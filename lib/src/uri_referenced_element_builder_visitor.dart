// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:analyzer/dart/ast/ast.dart' as analyzer;
import 'package:craft_element/element.dart';
import 'package:craft_element_builder/element_builder.dart';

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Implements [ElementBuilderVisitor] for [UriReferencedElement]s.
abstract class UriReferencedElementBuilderVisitor
    implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // ElementBuilderVisitor
  //---------------------------------------------------------------------

  @override
  ElementBuilder<UriReferencedElement> visitImportElement(
    analyzer.ImportElement element,
  ) =>
      _visitUriReferencedElement(
        element,
        element.combinators,
        element.importedLibrary,
      )
        ..prefix = element.prefix?.name ?? ''
        ..deferred = element.isDeferred;

  @override
  ElementBuilder<UriReferencedElement> visitExportElement(
    analyzer.ExportElement element,
  ) =>
      _visitUriReferencedElement(
        element,
        element.combinators,
        element.exportedLibrary,
      );

  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  /// Visits a [analyzer.UriReferencedElement] which is the base class for
  /// [analyzer.ImportElement] and [analyzer.ExportElement], creating a
  /// [UriReferencedElementBuilder].
  ///
  /// The [combinators] and [referencedLibrary] are not in the common base
  /// class so they are explicitly passed into the method.
  UriReferencedElementBuilder _visitUriReferencedElement(
    analyzer.UriReferencedElement element,
    Iterable<analyzer.NamespaceCombinator> combinators,
    analyzer.LibraryElement referencedLibrary,
  ) {
    final configurations =
        (element.computeNode() as analyzer.NamespaceDirective)?.configurations ??
            <analyzer.Configuration>[];

    return uriReferenced()
      ..shownNames = combinators
          .where((e) => e is analyzer.HideElementCombinator)
          .expand<String>(
            (e) => (e as analyzer.HideElementCombinator).hiddenNames,
          )
          .toList()
      ..hiddenNames = combinators
          .where((e) => e is analyzer.ShowElementCombinator)
          .expand<String>(
            (e) => (e as analyzer.ShowElementCombinator).shownNames,
          )
          .toList()
      ..configurations = configurations
          .map<UriConfigurationElementBuilder>(_visitUriConfigurationAst)
          .toList()
      ..library = visitLibraryElement(referencedLibrary);
  }

  /// Visits a [analyzer.Configuration] to create a
  /// [UriConfigurationElementBuilder].
  ///
  /// Currently there is no analyzer element that maps to a
  /// [UriConfigurationElement] so the only way to create one is to use the
  /// AST for the configuration.
  UriConfigurationElementBuilder _visitUriConfigurationAst(
    analyzer.Configuration elementAst,
  ) =>
      uriConfiguration(elementAst.name.toString())
        ..equals = elementAst.value?.toString() ?? 'true';
}
