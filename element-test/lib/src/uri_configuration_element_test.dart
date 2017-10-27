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

/// Matches the [when] value on a [UriConfigurationElement].
///
/// Additionally the [equals] field can be checked. By default `true` is used
/// which is the default for a configuration.
Matcher useWhen(String when, [String equals = 'true']) => predicate((value) {
      if (value is! UriConfigurationElement) return false;

      final configValue = value as UriConfigurationElement;

      return configValue.when == when && configValue.equals == equals;
    }, 'configured when $when equals $equals');

/// Matches a configuration for `dart:io` applications.
final Matcher useWhenIo = useWhen(UriConfigurationElement.whenIo);

/// Matches a configuration for `dart:html` applications.
final Matcher useWhenHtml = useWhen(UriConfigurationElement.whenHtml);

/// Matches a configuration for `dart:ui` applications.
final Matcher useWhenFlutter = useWhen(UriConfigurationElement.whenFlutter);
