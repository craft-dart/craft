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

/// A matcher that checks if [Commented.comments] contains no value.
final Matcher isUncommented = predicate((value) {
  if (value is! Commented) return true;

  return (value as Commented).comments.isEmpty;
}, 'element is uncommented');

/// A matcher that checks if [Commented.comments] contains a value.
final Matcher isCommented = predicate((value) {
  if (value is! Commented) return false;

  return (value as Commented).comments.isNotEmpty;
}, 'element is commented');

/// Matcher to see if the [comment] is present on the [Commented] element.
Matcher commentedWith(String comment) => predicate((value) {
      if (value is! Commented) return false;

      return (value as Commented).comments == comment;
    }, 'element is commented with "$comment"');
