// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/ast/ast.dart' as ast;
import 'package:craft_element/element.dart';

import 'element_source_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Builds an AST representation of [Commented] elements.
abstract class AnnotatedSourceVisitor implements ElementSourceVisitor {
  //---------------------------------------------------------------------
  // ElementSourceVisitor
  //---------------------------------------------------------------------

  // \TODO Implement

  @override
  List<ast.Annotation> visitAnnotated(Annotated element) => <ast.Annotation>[];
}
