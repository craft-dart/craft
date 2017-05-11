// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library craft_element.cached_element_builder;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:mirrors';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';

import 'src/element_builder.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An [ElementBuilder] which only allows [build] to be called a single time.
///
/// [CachedElementBuilder] prevents the same [ElementBuilder] from creating
/// multiple different instances of an [Element]. Multiple calls to [build]
/// will result in the exact same instance being returned.
///
/// Additionally it will not allow a property to be set once a build has
/// occurred. If a property is set after a call to [build] this is incorrect
/// behavior and an assertion will be triggered.
@proxy
class CachedElementBuilder<T extends Element> implements ElementBuilder<T> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The [ElementBuilder] being proxied.
  final ElementBuilder<T> _builder;

  /// The built [Element].
  T _element;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [CachedElementBuilder] with the given [_builder].
  CachedElementBuilder(this._builder);

  //---------------------------------------------------------------------
  // ElementBuilder
  //---------------------------------------------------------------------

  @override
  T build() {
    _element ??= _builder.build();

    return _element;
  }

  //---------------------------------------------------------------------
  // Object
  //---------------------------------------------------------------------

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if ((invocation.isSetter) && (_element != null)) {
      assert(false, 'The element is already built and cannot be changed');
    }

    return reflect(_builder).delegate(invocation);
  }
}

/// Creates an instance of [CachedElementBuilder] with the given [builder].
CachedElementBuilder cachedBuilder<T extends Element>(
        ElementBuilder<T> builder) =>
    new CachedElementBuilder<T>(builder);
