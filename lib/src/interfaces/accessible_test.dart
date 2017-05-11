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

/// A matcher for [Accessible] instances.
const Matcher isAccessibleElement = const isInstanceOf<Abstract>();

/// A matcher for public element.
final Matcher isPublic = predicate((value) {
  if (value is! Accessible) return false;

  return (value as Accessible).isPublic;
}, 'element is public');

/// A matcher for private element.
final Matcher isPrivate = predicate((value) {
  if (value is! Accessible) return false;

  return (value as Accessible).isPrivate;
}, 'element is private');

/// A matcher for protected elements.
final Matcher isProtected = predicate((value) {
  if (value is! Accessible) return false;

  return (value as Accessible).isProtected;
}, 'element is protected');
