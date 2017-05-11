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

/// A matcher for [Abstract] instances.
const Matcher isAbstractElement = const isInstanceOf<Abstract>();

/// A matcher for abstract elements.
final Matcher isAbstract = predicate((value) {
  if (value is! Abstract) return false;

  return (value as Abstract).isAbstract;
}, 'element is abstract');

/// A matcher for concrete elements.
final Matcher isConcrete = predicate((value) {
  if (value is! Abstract) return true;

  return !(value as Abstract).isAbstract;
}, 'element is concrete');
