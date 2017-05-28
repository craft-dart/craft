// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:test/test.dart';

import 'parameter_element_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Returns a matcher that checks for equality between [Element]s.
///
/// The metadata matcher is not able to check equality for annotations.
Matcher elementEqual(Element expected) {
  Matcher matcher;

  if (expected is ParameterElement) {
    matcher = new ParameterElementMatcher(expected);
  }

  return matcher;
}
