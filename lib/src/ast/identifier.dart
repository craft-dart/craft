// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/ast/ast.dart' as ast;
import 'package:analyzer/dart/ast/standard_ast_factory.dart';

import 'tokens.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Creates a [ast.SimpleIdentifier] from the string [value].
ast.SimpleIdentifier stringIdentifier(String value) =>
    astFactory.simpleIdentifier(stringToken(value));

/// Create a [ast.DottedName] from the [value].
///
/// DottedNames are used for library declarations.
ast.DottedName dottedName(String value) => astFactory.dottedName(
      value.split('.').map<ast.SimpleIdentifier>(stringIdentifier).toList(),
    );
