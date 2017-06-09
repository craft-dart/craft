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

const String _name = 'test';

/// Test entry point.
void main() {
  test('validate name', expectThrowsOnUnnamed(parameter('')));
  test('validate required no default', () {
    final builder = parameter(_name)..defaultValue = 5;

    expectThrowsInvalidElementError(builder);
  });
  test('builder defaults', () {
    final builder = new ParameterElementBuilder()..name = _name;
    final expected = new ParameterElement(_name);

    expectElementEqual<ParameterElement>(builder, expected);
    expectElementEqual<ParameterElement>(parameter(_name), expected);
  });
  test('values set', () {
    final parameterKind = ParameterKind.positional;
    final type = intType;
    final isInitializer = true;
    final defaultValue = 5;
    final annotations = [deprecated];

    final builder = new ParameterElementBuilder()
      ..name = _name
      ..type = type
      ..parameterKind = parameterKind
      ..isInitializer = isInitializer
      ..defaultValue = defaultValue
      ..annotations = annotations;
    final expected = new ParameterElement(
      _name,
      type: type,
      parameterKind: parameterKind,
      isInitializer: isInitializer,
      defaultValue: defaultValue,
    );

    expectElementEqual<ParameterElement>(builder, expected);

    // Make sure annotated metadata is present
    //
    // Comments are not valid on parameters
    final actual = builder.build();

    expect(actual, annotationsHasLength(1));
  });
  test('parameter', () {
    final builder = parameter(_name);
    final expected = new ParameterElement(
      _name,
      parameterKind: ParameterKind.required,
    );

    expectElementEqual<ParameterElement>(builder, expected);
  });
  test('positionalParameter', () {
    final builder = positionalParameter(_name);
    final expected = new ParameterElement(
      _name,
      parameterKind: ParameterKind.positional,
    );

    expectElementEqual<ParameterElement>(builder, expected);
  });
  test('namedParameter', () {
    final builder = namedParameter(_name);
    final expected = new ParameterElement(
      _name,
      parameterKind: ParameterKind.named,
    );

    expectElementEqual<ParameterElement>(builder, expected);
  });
}
