// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:meta/meta.dart';

import 'annotated.dart';
import 'named.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [Named] and [Annotated] elements with accessibility.
///
/// In Dart access levels are determined by naming conventions and through
/// annotations.
abstract class Accessible implements Named, Annotated {
  /// Whether the element is private to the library.
  bool get isPrivate => name.startsWith('_');

  /// Whether the element is protected.
  ///
  /// This is only valid for elements contained in classes.
  bool get isProtected => annotations.contains(protected);

  /// Whether the element is public to the library.
  bool get isPublic => !(isPrivate || isProtected);
}
