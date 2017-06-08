// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_element_test/element_test.dart';
import 'package:craft_type/type.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

void main() {
  test('constructor', () {
    final type = new InterfaceType('Foo');
    final element = new ConstructorElement(type);

    // Check values
    expect(element, isDefaultConstructor);
    expect(element, isType(new FunctionType(returnType: type)));
    expect(element, isNotConstant);
    expect(element, isNotFactory);

    // Check immutable lists
    expect(element.parameters.clear, throwsUnsupportedError);
  });
}
