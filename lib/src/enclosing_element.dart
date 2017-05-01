// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:meta/meta.dart';

import 'element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An [Element] that is enclosed by another [Element].
///
/// Allows linkage between this element and the element that contains it.
class EnclosedElement implements Element {
  Element _enclosingElement;

  /// The element enclosing this element.
  Element get enclosingElement => _enclosingElement;
}

/// An [Element] that encloses other [Element]s.
///
/// Contains functionality to link elements enclosed by this element.
class EnclosingElement implements Element {
  /// Marks the [element] as enclosed by `this`.
  @protected
  void enclose(EnclosedElement element) {
    assert(element._enclosingElement == null,
        'An element can only be enclosed once');

    element._enclosingElement = this;
  }

  /// Marks all the [elements] as enclosed by `this`.
  @protected
  void encloseAll(Iterable<EnclosedElement> elements) {
    for (var element in elements) {
      enclose(element);
    }
  }
}
