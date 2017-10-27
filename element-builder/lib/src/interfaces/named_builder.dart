// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:meta/meta.dart';

import '../element_builder.dart';
import '../invalid_element_error.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [ElementBuilder]s that build [Named] elements.
abstract class NamedBuilder<T extends Named> implements ElementBuilder<T> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The name of the element being built.
  String name = '';

  //---------------------------------------------------------------------
  // Validation
  //---------------------------------------------------------------------

  /// Validates the name of the element.
  @protected
  void validateName() {
    if (name.isEmpty) {
      throw new InvalidElementError('Element has no name');
    }
  }
}
