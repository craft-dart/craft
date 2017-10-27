// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'element_builder.dart';
import 'interfaces.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [ElementBuilder] for [UriReferencedElement]s.
class UriReferencedElementBuilder extends ElementBuilder<UriReferencedElement>
    with LibraryReferenceBuilder<UriReferencedElement> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The prefix to use for the reference.
  String prefix = '';

  /// Whether the library loading should be deferred.
  bool deferred = false;

  /// The names within the library that are shown.
  Iterable<String> shownNames = <String>[];

  /// The names within the library that are hidden.
  Iterable<String> hiddenNames = <String>[];

  /// The configuration specific imports.
  Iterable<ElementBuilder<UriConfigurationElement>> configurations =
      <ElementBuilder<UriConfigurationElement>>[];

  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  UriReferencedElement buildInternal() => new UriReferencedElement(
        prefix: prefix,
        library: library?.build(),
        deferred: deferred,
        shownNames: shownNames,
        hiddenNames: hiddenNames,
        configurations: buildElements<UriConfigurationElement>(configurations),
      );
}

/// Creates an instance of [UriReferencedElementBuilder].
UriReferencedElementBuilder uriReferenced() =>
    new UriReferencedElementBuilder();
