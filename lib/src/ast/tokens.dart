// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

// This file includes internal implementation from the analyzer
// ignore_for_file: implementation_imports

import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/src/dart/ast/token.dart' show StringToken;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Creates a token from the string [value].
///
/// This is not a `''` token but just a string within the AST that will be
/// parsed.
StringToken stringToken(String value) =>
    new StringToken(TokenType.STRING, value, 0);
