// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_type/type.dart';

import '../element_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [ElementBuilder]s that build [Generic] elements.
abstract class GenericBuilder<T extends Generic> implements ElementBuilder<T> {
  /// The type parameters for the element being built.
  Iterable<GenericType> typeParameters = <GenericType>[];
}
