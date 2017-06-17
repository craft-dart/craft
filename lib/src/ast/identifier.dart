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

ast.SimpleIdentifier stringIdentifier(String value) =>
    astFactory.simpleIdentifier(stringToken(value));
