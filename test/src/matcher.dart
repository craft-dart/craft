// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// The [matcher] should match the [value].
// ignore: type_annotate_public_apis
void expectMatch(Matcher matcher, value) {
  expect(matcher.matches(value, {}), isTrue);
}

/// The [matcher] should not match the [value].
// ignore: type_annotate_public_apis
void expectNoMatch(Matcher matcher, value) {
  expect(matcher.matches(value, {}), isFalse);
}
