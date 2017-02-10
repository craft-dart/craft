// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'element.dart';
import 'helpers.dart';
import 'interfaces.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An [Element] with the most common options.
///
/// The vast majority of subclasses of [Element] will be [Annotated],
/// [Commented] and [Named]. This allows all the defaults to be set in one
/// location.
class BaseElement extends Element implements Annotated, Commented, Named {
  //---------------------------------------------------------------------
  // Named
  //---------------------------------------------------------------------

  @override
  String name;

  //---------------------------------------------------------------------
  // Annotated
  //---------------------------------------------------------------------

  @override
  List annotations;

  //---------------------------------------------------------------------
  // Commented
  //---------------------------------------------------------------------

  @override
  String comments;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [BaseElement] with the given [name].
  ///
  /// Annotations are contained in the [annotations] array. These are a list of
  /// annotations that have been constructed.
  ///
  /// Any code [comments] are present in that value.
  BaseElement(this.name, List annotations, String comments)
      : annotations = defaultList(annotations),
        comments = comments ?? '';
}
