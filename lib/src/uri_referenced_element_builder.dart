// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'element_builder.dart';
import 'uri_configuration_element_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [ElementBuilder] for [UriReferencedElement]s.
class UriReferencedElementBuilder extends ElementBuilder<UriReferencedElement> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The prefix to use for the reference.
  String prefix = '';

  /// Whether the library loading should be deferred.
  bool deferred = false;

  /// The names within the library that are shown.
  List<String> shownNames = <String>[];

  /// The names within the library that are hidden.
  List<String> hiddenNames = <String>[];

  /// The configuration specific imports.
  List<UriConfigurationElementBuilder> configurations =
      <UriConfigurationElementBuilder>[];

  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  UriReferencedElement buildInternal() => new UriReferencedElement(
        prefix: prefix,
        deferred: deferred,
        shownNames: shownNames,
        hiddenNames: hiddenNames,
        configurations: buildElements<UriConfigurationElement>(configurations),
      );
}

/// Creates an instance of [UriReferencedElementBuilder].
UriReferencedElementBuilder uriReferenced() =>
    new UriReferencedElementBuilder();
