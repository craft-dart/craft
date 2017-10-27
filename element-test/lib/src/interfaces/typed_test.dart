// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_type/type.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A matcher for [Typed] instances.
const Matcher isTypedElement = const isInstanceOf<Typed>();

/// A matcher for a dynamic typed [Element].
final Matcher isDynamicType = isType(dynamicType);

/// Matches the [expected] type on [Typed].
///
/// This is for testing an exact match. It does not determine if the value is
/// compatible due to interfaces or extension.
Matcher isType(DartType expected) => predicate((value) {
      if (value is! Typed) return false;

      return (value as Typed).type == expected;
    }, 'Element type is equal to $expected');
