// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_element_builder/element_builder.dart';
import 'package:craft_element_test/element_test.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Helper for determining if an [actual] builder generates the [expected]
/// element when [ElementBuilder.build] is invoked.
void expectElementEqual<T extends Element>(
  ElementBuilder<T> actual,
  T expected,
) {
  expect(actual.build(), elementEqual(expected));
}
