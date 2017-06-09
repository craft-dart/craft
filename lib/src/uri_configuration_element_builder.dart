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

/// An [ElementBuilder] for [UriConfigurationElement]s.
///
/// No validation is performed on the element.
class UriConfigurationElementBuilder
    extends ElementBuilder<UriConfigurationElement>
    with LibraryReferenceBuilder<UriConfigurationElement> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The environment variable to check for within the built element.
  String when = '';

  /// The expected value of the [when] clause within the built element.
  String equals = 'true';

  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  UriConfigurationElement buildInternal() => new UriConfigurationElement(
        when,
        equals: equals,
        library: library.build(),
      );
}

/// Creates an instance of [UriConfigurationElementBuilder] with the given
/// [when] clause.
///
/// After calling the value in the builder is equivalent to the following
/// configuration import declaration.
///
///     if (when)
UriConfigurationElementBuilder uriConfiguration(String when) =>
    new UriConfigurationElementBuilder()..when = when;

/// A configuration for `dart.io` applications.
UriConfigurationElementBuilder dartIoConfiguration() =>
    new UriConfigurationElementBuilder()..when = UriConfigurationElement.whenIo;

/// A configuration for `dart:html` applications.
UriConfigurationElementBuilder dartHtmlConfiguration() =>
    new UriConfigurationElementBuilder()
      ..when = UriConfigurationElement.whenHtml;

/// A configuration for `dart:ui` applications.
UriConfigurationElementBuilder flutterUiConfiguration() =>
    new UriConfigurationElementBuilder()
      ..when = UriConfigurationElement.whenFlutter;
