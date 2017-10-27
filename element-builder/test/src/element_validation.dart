// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element_builder/element_builder.dart';
import 'package:craft_element_builder/src/interfaces/named_builder.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Signature for a function used by [expect].
typedef void TestFunction();

/// Matcher for an [InvalidElementError] being thrown.
final Matcher throwsInvalidElementError =
    throwsA(const isInstanceOf<InvalidElementError>());

/// Expect that the [builder] will throw an [InvalidElementError].
void expectThrowsInvalidElementError(ElementBuilder builder) {
  expect(builder.build, throwsInvalidElementError);
}

//---------------------------------------------------------------------
// NamedBuilder validation
//---------------------------------------------------------------------

/// Builder should error on unnamed metadata.
TestFunction expectThrowsOnUnnamed(NamedBuilder builder) => () {
      builder.name = '';

      expectThrowsInvalidElementError(builder);
    };
