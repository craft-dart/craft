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

const String _name = 'constructor';
final InterfaceType _type = new InterfaceType('Foo');

/// Test entry point.
void main() {
  test('validate name', expectThrowsOnUnnamed(method('')));
  test('builder defaults', () {
    final builder = new ConstructorElementBuilder()..returnType = _type;
    final expected = new ConstructorElement(_type);

    expectElementEqual<ConstructorElement>(builder, expected);
    expectElementEqual<ConstructorElement>(
      defaultConstructor()..returnType = _type,
      expected,
    );
  });
  test('values set', () {
    final paramName = 'param';
    final isConst = true;
    final isFactory = false;
    final annotations = [deprecated];
    final comments = 'comment';

    final builder = new ConstructorElementBuilder()
      ..name = _name
      ..returnType = _type
      ..parameters = <ParameterElementBuilder>[parameter(paramName)]
      ..isConst = isConst
      ..isFactory = isFactory
      ..annotations = annotations
      ..comments.writeRaw(comments);
    final expected = new ConstructorElement(
      _type,
      name: _name,
      parameters: <ParameterElement>[new ParameterElement(paramName)],
      isConst: isConst,
      isFactory: isFactory,
    );

    expectElementEqual<ConstructorElement>(builder, expected);

    // Make sure annotated metadata is present
    final actual = builder.build();

    expect(actual, annotationsHasLength(1));
    expect(actual, commentedWith(comments));
  });
  test('namedConstructor', () {
    final builder = constructor(_name)..returnType = _type;
    final expected = new ConstructorElement(_type, name: _name);

    expectElementEqual<ConstructorElement>(builder, expected);
  });
}
