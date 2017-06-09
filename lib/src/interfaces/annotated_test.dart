// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A matcher for [Annotated] instances.
const Matcher isAnnotatedElement = const isInstanceOf<Annotated>();

/// Matches the [length] of [Annotated.annotations].
Matcher annotationsHasLength(int length) => predicate((value) {
  if (value is! Annotated) return false;

  return (value as Annotated).annotations.length == length;
}, 'element contains $length annotations');

/// A matcher for [Annotated] elements that are not annotated.
final Matcher annotationsIsEmpty = annotationsHasLength(0);
