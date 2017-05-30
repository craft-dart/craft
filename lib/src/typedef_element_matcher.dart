// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'function_element_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [FunctionElementMatcher] for [TypedefElement] equality.
class TypedefElementMatcher extends FunctionElementMatcher<TypedefElement> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [TypedefElementMatcher] which compares metadata
  /// using the values in [expected].
  TypedefElementMatcher(TypedefElement expected) : super(expected);
}
