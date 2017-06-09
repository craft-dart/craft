// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// \TODO Remove this file after https://github.com/dart-lang/test/issues/36 is resolved.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';

import 'src/function_element_builder_test.dart' as function_element_builder_test;
import 'src/method_element_builder_test.dart' as method_element_builder_test;
import 'src/parameter_element_builder_test.dart' as parameter_element_builder_test;
import 'src/uri_configuration_element_builder_test.dart' as uri_configuration_element_builder_test;
import 'src/uri_referenced_element_builder_test.dart' as uri_referenced_element_builder_test;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Entry point for tests.
void main() {
  // Run tests
  group('FunctionElementBuilder', function_element_builder_test.main);
  group('MethodElementBuilder', method_element_builder_test.main);
  group('ParameterElementBuilder', parameter_element_builder_test.main);
  group('UriConfigurationElementBuilder', uri_configuration_element_builder_test.main);
  group('UriReferencedElementBuilder', uri_referenced_element_builder_test.main);
}
