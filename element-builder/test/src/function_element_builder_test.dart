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
import 'package:craft_type/type.dart';
import 'package:test/test.dart';

import 'element_validation.dart';
import 'expect_element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

const String _name = 'function';

/// Test entry point.
void main() {
  test('validate name', expectThrowsOnUnnamed(function('')));
  test('builder defaults', () {
    final builder = new FunctionElementBuilder()..name = _name;
    final expected = new FunctionElement(_name);

    expectElementEqual<FunctionElement>(builder, expected);
    expectElementEqual<FunctionElement>(function(_name), expected);
  });
  test('values set', () {
    final returnType = intType;
    final paramName = 'param';
    final annotations = [deprecated];
    final comments = 'comment';

    final builder = new FunctionElementBuilder()
      ..name = _name
      ..returnType = returnType
      ..parameters = <ParameterElementBuilder>[parameter(paramName)]
      ..annotations = annotations
      ..comments.writeRaw(comments);
    final expected = new FunctionElement(_name,
        returnType: returnType,
        parameters: <ParameterElement>[new ParameterElement(paramName)]);

    expectElementEqual<FunctionElement>(builder, expected);

    // Make sure annotated metadata is present
    final actual = builder.build();

    expect(actual, annotationsHasLength(1));
    expect(actual, commentedWith(comments));
  });
}
