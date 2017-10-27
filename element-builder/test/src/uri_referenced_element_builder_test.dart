// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_element_builder/element_builder.dart';
import 'package:test/test.dart';

import 'expect_element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Test entry point.
void main() {
  test('builder defaults', () {
    final builder = new UriReferencedElementBuilder();
    final expected = new UriReferencedElement();

    expectElementEqual<UriReferencedElement>(builder, expected);
    expectElementEqual<UriReferencedElement>(uriReferenced(), expected);
  });
}
