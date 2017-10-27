// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import '../comment_buffer.dart';
import '../element_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [ElementBuilder]s that build [Commented] elements.
abstract class CommentedBuilder<T extends Commented>
    implements ElementBuilder<T> {
  /// The documentation comments describing the [Element].
  CommentBuffer comments = new CommentBuffer();
}
