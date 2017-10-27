// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import '../element.dart';
import '../library_element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [Element]s referencing a [LibraryElement].
abstract class LibraryReference implements Element {
  /// The [LibraryElement] referenced by the [Element].
  LibraryElement get library;
}
