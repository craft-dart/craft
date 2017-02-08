// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'dart_type.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A type that contains parameters.
abstract class ParameterizedType implements DartType {
  /// The arguments for the type.
  List<DartType> get typeArguments;
}
