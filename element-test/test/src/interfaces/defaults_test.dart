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

import '../matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

const int _defaultInt = 1;

final Element _defaultsValueInt = new ParameterElement(
  'one',
  type: intType,
  parameterKind: ParameterKind.positional,
  defaultValue: _defaultInt,
);
final Element _defaultsValueNull = new ParameterElement(
  'nulling',
  parameterKind: ParameterKind.positional,
  defaultValue: null,
);
final Element _notDefaultsElementType = new Element();

void main() {
  test('isDefaultsElement', () {
    final matcher = isDefaultsElement;

    expectMatch(matcher, _defaultsValueInt);
    expectMatch(matcher, _defaultsValueNull);
    expectNoMatch(matcher, _notDefaultsElementType);
  });
  test('defaultsTo', () {
    final matcher = defaultsTo(_defaultInt);

    expectMatch(matcher, _defaultsValueInt);
    expectNoMatch(matcher, _defaultsValueNull);
    expectNoMatch(matcher, _notDefaultsElementType);
  });
  test('defaultsToNull', () {
    final matcher = defaultsToNull;

    expectNoMatch(matcher, _defaultsValueInt);
    expectMatch(matcher, _defaultsValueNull);
    expectNoMatch(matcher, _notDefaultsElementType);
  });
}
