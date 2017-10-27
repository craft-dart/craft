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

import 'ast/identifier.dart';
import 'ast/tokens.dart';
import 'element_source_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Builds an AST representation of [ClassElement]s and its associated
/// subclasses.
abstract class ClassElementSourceVisitor implements ElementSourceVisitor {
  //---------------------------------------------------------------------
  // ElementSourceVisitor
  //---------------------------------------------------------------------

  @override
  ast.ClassDeclaration visitClassElement(ClassElement element) {
    final declaration = astFactory.classDeclaration(
      visitCommented(element),
      visitAnnotated(element),
      element.isAbstract ? $abstract : null,
      $class,
      stringIdentifier(element.name),
      null, // typeParameters
      null, // extendsClause
      null, // withClause
      null, // implementsClause
      $openCurly,
      null, // members
      $closeCurly,
    );

    return declaration;
  }
}
