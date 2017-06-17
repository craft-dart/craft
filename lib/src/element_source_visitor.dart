// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/ast/ast.dart' as ast;
import 'package:craft_element/element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Visits [Element]s building an AST representation.
abstract class ElementSourceVisitor {
  /// Visits a [Commented] and returns the documentation comments associated
  /// with the [element].
  ///
  /// If the comments are empty `null` will be returned.
  ast.Comment visitCommented(Commented element);
}
