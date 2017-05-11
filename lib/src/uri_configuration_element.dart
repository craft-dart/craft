// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'element.dart';
import 'enclosing_element.dart';
import 'interfaces.dart';
import 'library_element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A configuration for a uri reference.
///
/// The [UriConfigurationElement] corresponds to the configuration specific
/// import specification. This allows different implementations to be used in
/// different contexts.
///
/// Configuration specific imports work with [String.fromEnvironment]. The
/// [when] value is queried from the environment and then compared against the
/// expected [equals] value. If there is a match then the referenced [library]
/// will be loaded.
class UriConfigurationElement extends Element
    with EnclosedElement
    implements LibraryReference {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The environment variable to check for.
  final String when;

  /// The expected value of the [when] clause.
  ///
  /// This is always a string and by default it is 'true'.
  final String equals;

  //---------------------------------------------------------------------
  // LibraryReference
  //---------------------------------------------------------------------

  @override
  final LibraryElement library;

  //---------------------------------------------------------------------
  // Constructors
  //---------------------------------------------------------------------

  /// Create an instance of [UriConfigurationElement] with the given [when]
  /// condition.
  ///
  /// A value can be specified within [equals] as the check for the
  /// configuration.
  UriConfigurationElement(this.when, {String equals, this.library})
      : equals = (equals == null) || (equals.isEmpty) ? 'true' : equals;
}
