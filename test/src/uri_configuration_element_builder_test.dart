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

const String _when = 'value';

/// Test entry point.
void main() {
  test('builder defaults', () {
    final builder = new UriConfigurationElementBuilder()..when = _when;
    final expected = new UriConfigurationElement(_when);

    expectElementEqual<UriConfigurationElement>(builder, expected);
    expectElementEqual<UriConfigurationElement>(
      uriConfiguration(_when),
      expected,
    );
  });
}
