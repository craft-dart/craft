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

/// A matcher for [Named] instances.
const Matcher isNamedElement = const isInstanceOf<Named>();

/// Returns a matcher that checks the [expected] name on metadata.
Matcher isNamed(String expected) => predicate((value) {
      if (value is! Named) return false;

      return (value as Named).name == expected;
    }, 'metadata is named $expected');
