// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// \TODO Remove this file after https://github.com/dart-lang/test/issues/36 is resolved.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';

import 'src/generic_type_test.dart' as generic_type_test;
import 'src/interface_type_test.dart' as interface_type_test;
import 'src/interface_types_test.dart' as interface_types_test;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Entry point for tests.
void main() {
  group('GenericType', generic_type_test.main);
  group('InterfaceType', interface_type_test.main);
  group('Interface types', interface_types_test.main);
}
