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
void expectMatch(Matcher matcher, dynamic value) {
  expect(matcher.matches(value, {}), isTrue);
}

/// The [matcher] should not match the [value].
void expectNoMatch(Matcher matcher, dynamic value) {
  expect(matcher.matches(value, {}), isFalse);
}
