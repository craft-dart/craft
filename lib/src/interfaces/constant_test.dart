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

/// A matcher for [Constant] instances.
const Matcher isConstantElement = const isInstanceOf<Constant>();

/// A matcher for constant metadata.
final Matcher isConstant = predicate((value) {
  if (value is! Constant) return false;

  return (value as Constant).isConst;
}, 'element is constant');

/// A matcher for variable metadata.
final Matcher isNotConstant = predicate((value) {
  if (value is! Constant) return true;

  return !(value as Constant).isConst;
}, 'element is not constant');
