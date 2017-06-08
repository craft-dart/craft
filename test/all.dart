// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// \TODO Remove this file after https://github.com/dart-lang/test/issues/36 is resolved.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';

import 'src/constructor_element_test.dart' as constructor_element_test;
import 'src/function_element_test.dart' as function_element_test;
import 'src/method_element_test.dart' as method_element_test;
import 'src/parameter_element_test.dart' as parameter_element_test;
import 'src/uri_referenced_element_test.dart' as uri_referenced_element_test;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Entry point for tests.
void main() {
  group('ConstructorElement', constructor_element_test.main);
  group('FunctionElement', function_element_test.main);
  group('MethodElement', method_element_test.main);
  group('ParameterElement', parameter_element_test.main);
  group('UriReferencedElement', uri_referenced_element_test.main);
}
