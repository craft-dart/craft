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

/// Matcher for [ConstructorElement] instances.
const Matcher isConstructorElement = const isInstanceOf<ConstructorElement>();

/// Matcher for [ConstructorElement] that is a factory.
final Matcher isFactory = predicate((value) {
  if (value is! ConstructorElement) return false;

  return (value as ConstructorElement).isFactory;
}, 'factory constructor');

/// Matcher for [ConstructorElement] that is not a factory.
final Matcher isNotFactory = predicate((value) {
  if (value is! ConstructorElement) return false;

  return !(value as ConstructorElement).isFactory;
}, 'parameter is not covariant');
