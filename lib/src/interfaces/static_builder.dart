// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import '../element_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [ElementBuilder]s that build [Static] elements.
abstract class StaticBuilder<T extends Static> implements ElementBuilder<T> {
  /// Whether the metadata is statically scoped.
  bool isStatic = false;
}
