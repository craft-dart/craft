// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:collection';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_element_test/element_test.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

void main() {
  test('constructor', () {
    final element = new UriReferencedElement();

    // Check values
    expect(element, notPrefixed);
    expect(element, notDeferred);
    expect(element, shownNamesIsEmpty);
    expect(element, hiddenNamesIsEmpty);
    expect(element, configurationsIsEmpty);

    // Check immutable lists
    expect(element.shownNames.clear, throwsUnsupportedError);
    expect(element.hiddenNames.clear, throwsUnsupportedError);
    expect(element.configurations.clear, throwsUnsupportedError);
  });
}
