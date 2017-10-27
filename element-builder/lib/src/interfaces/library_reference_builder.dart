// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import '../element_builder.dart';
import '../library_element_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [ElementBuilder]s that build [LibraryReference] elements.
abstract class LibraryReferenceBuilder<T extends LibraryReference>
    implements ElementBuilder<T> {
  /// The [LibraryElementBuilder] referenced.
  ElementBuilder<LibraryElement> library;
}
