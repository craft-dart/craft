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

/// An interface for [ElementBuilder]s that build [Typed] elements.
abstract class TypedBuilder<T extends Typed<U>, U extends DartType>
    implements ElementBuilder<T> {
  /// The type for the element being built.
  DartType type = dynamicType;
}
