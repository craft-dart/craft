// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/ast/ast.dart' as ast;
import 'package:analyzer/dart/ast/standard_ast_factory.dart';
import 'package:analyzer/dart/ast/token.dart' as ast;
import 'package:craft_element/element.dart';

import 'ast/tokens.dart';
import 'element_source_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Builds an AST representation of [Commented] elements.
abstract class CommentedSourceVisitor implements ElementSourceVisitor {
  //---------------------------------------------------------------------
  // ElementSourceVisitor
  //---------------------------------------------------------------------

  @override
  ast.Comment visitCommented(Commented element) {
    final comments = element.comments;

    return comments.isNotEmpty
        ? astFactory.documentationComment(
            comments
                .split('\n')
                .map<String>((l) => '/// $l')
                .map<ast.Token>(stringToken)
                .toList(),
          )
        : null;
  }
}
