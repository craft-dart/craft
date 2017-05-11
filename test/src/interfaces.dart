// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// \TODO Remove this file after https://github.com/dart-lang/test/issues/36 is resolved.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';

import 'interfaces/abstract_test.dart' as abstract_test;
import 'interfaces/accessible_test.dart' as accessible_test;
import 'interfaces/constant_test.dart' as constant_test;
import 'interfaces/named_test.dart' as named_test;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Entry point for tests.
void main() {
  // Run tests
  group('Abstract tests', abstract_test.main);
  group('Accessible tests', accessible_test.main);
  group('Constant tests', constant_test.main);
  group('Named tests', named_test.main);
}
