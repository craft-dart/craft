// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Matcher for [UriConfigurationElement] instances.
const Matcher isUriConfigurationElement =
    const isInstanceOf<UriConfigurationElement>();

/// Matches the [expected] value of when on a [UriConfigurationElement].
Matcher useWhen(String expected) => predicate((value) {
      if (value is! UriConfigurationElement) return false;

      return (value as UriConfigurationElement).when == expected;
    }, 'configured when $expected');

/// Matches a configuration for
final Matcher useWhenIo = useWhen(UriConfigurationElement.whenIo);
final Matcher useWhenHtml = useWhen(UriConfigurationElement.whenHtml);
final Matcher useWhenFlutter = useWhen(UriConfigurationElement.whenFlutter);

/// Matches the [expected] value of equals on a [UriConfigurationElement].
Matcher useWhenEquals(String expected) => predicate((value) {
      if (value is! UriConfigurationElement) return false;

      return (value as UriConfigurationElement).equals == expected;
    }, 'configured when equals $expected');
