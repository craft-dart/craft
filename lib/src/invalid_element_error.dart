// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Signifies that the element being constructed is invalid.
///
/// Elements created through the ElementBuilder is validated before the
/// element instance is created. If the element being constructed is not
/// valid for a Dart program then the [InvalidElementError] will be thrown.
class InvalidElementError extends StateError {
  /// Creates an instance of the [InvalidElementError] class.
  InvalidElementError(String message)
      : super(message);
}
