// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

// This file includes internal implementation from the analyzer
// ignore_for_file: implementation_imports

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/standard_ast_factory.dart';

import 'tokens.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Creates a string literal token from the [value].
///
/// Defaults to using `'` as this is the preferred dart style.
StringLiteral stringLiteral(String value, [String literal = '\'']) =>
    astFactory.simpleStringLiteral(
      stringToken('$literal$value$literal'),
      value,
    );
