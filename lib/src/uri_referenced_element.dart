// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'element.dart';
import 'enclosing_element.dart';
import 'helpers.dart';
import 'library_element.dart';
import 'uri_configuration_element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Represents `import` and `export` declarations within a Dart program.
class UriReferencedElement extends Element
    with EnclosingElement, EnclosedElement {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The prefix to use for the reference.
  final String prefix;

  /// Whether loading of the library should be deferred.
  final bool deferred;

  /// The names within the library that are shown.
  final List<String> shownNames;

  /// The names within the library that are hidden.
  final List<String> hiddenNames;

  /// The element for the library being referenced.
  final LibraryElement library;

  /// The configuration specific imports.
  ///
  /// The keys of the map correspond to the if clause for the configuration
  /// with the library metadata being used.
  final List<UriConfigurationElement> configurations;

  //---------------------------------------------------------------------
  // Constructors
  //---------------------------------------------------------------------

  /// Creates an instance of [UriReferencedElement].
  ///
  /// A [prefix] can be specified which corresponds to an `as` directive in
  /// an import.
  ///
  ///     import 'dart:html' as html;
  ///
  /// Additionally the import can be declared as [deferred] which allows the
  /// library to be loaded dynamically.
  ///
  ///     import 'package:foo/bar.dart' deferred as bar;
  ///
  /// The [shownNames] and [hiddenNames] correspond to the `show` and `hide`
  /// directives within an import or export statement.
  ///
  ///     import 'dart:html' show Element;
  ///     import 'dart:async' hide Completer;
  ///
  /// Configuration specific imports can be provided in [configurations].
  ///
  ///     import 'library_interface.dart'
  ///         if (dart.library.io) 'library_io.dart'
  ///         if (dart.library.html) 'library_html.dart';
  UriReferencedElement({
    String prefix,
    this.deferred: false,
    Iterable<String> shownNames,
    Iterable<String> hiddenNames,
    this.library,
    Iterable<UriConfigurationElement> configurations,
  })
      : prefix = prefix ?? '',
        shownNames = defaultList<String>(shownNames),
        hiddenNames = defaultList<String>(hiddenNames),
        configurations = defaultList<UriConfigurationElement>(configurations) {
    // Use `this` to properly scope the value
    encloseAll(this.configurations);
  }

  //---------------------------------------------------------------------
  // Properties
  //---------------------------------------------------------------------

  /// Whether the reference changes based on the configuration.
  bool get isConfigurationSpecific => configurations.isNotEmpty;
}
