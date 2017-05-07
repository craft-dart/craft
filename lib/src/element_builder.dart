// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:meta/meta.dart';

import 'invalid_element_error.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Base class for a builder.
abstract class ElementBuilder<T extends Element> {
  //---------------------------------------------------------------------
  // Public methods
  //---------------------------------------------------------------------

  /// Creates an instance of the [Element] type.
  ///
  /// Before creating the instance the values within the builder are validated.
  /// If the validation fails then an [InvalidElementError] is thrown.
  T build() {
    validate();

    return buildInternal();
  }

  //---------------------------------------------------------------------
  // Protected methods
  //---------------------------------------------------------------------

  /// Validates the metadata being built.
  @protected
  void validate();

  /// Creates the [Element] instance.
  T buildInternal();
}

/// Builds a list of [ElementBuilder]s.
List<T> buildElementList<T extends Element>(
        Iterable<ElementBuilder<T>> builders) =>
    builders.map<T>((value) => value.build()).toList();
