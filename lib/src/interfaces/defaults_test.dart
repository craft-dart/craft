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

/// A matcher for [Defaults] instances.
const Matcher isDefaultsElement = const isInstanceOf<Defaults>();

/// Matches the [expected] default value on [Defaults].
Matcher defaultsTo(dynamic expected) => predicate((value) {
      if (value is! Defaults) return false;

      return (value as Defaults).defaultValue == expected;
    }, 'element defaults to $expected');

/// Matcher for `null` default values.
final Matcher defaultsToNull = defaultsTo(null);
