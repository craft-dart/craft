// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import '../element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [Element]s that have default values.
abstract class Defaults implements Element {
  /// The default value.
  dynamic get defaultValue;
}
