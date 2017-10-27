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

/// A matcher for [Static] instances.
const Matcher isStaticElement = const isInstanceOf<Static>();

/// A matcher for static metadata.
final Matcher isStatic = predicate((value) {
  if (value is! Static) return false;

  return (value as Static).isStatic;
}, 'element is static');

/// A matcher for variable metadata.
final Matcher isNotStatic = predicate((value) {
  if (value is! Static) return true;

  return !(value as Static).isStatic;
}, 'element is not static');
