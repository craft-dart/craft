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
import 'package:analyzer/src/dart/ast/token.dart'
    show KeywordToken, StringToken;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A `abstract` token.
final Token $abstract = new KeywordToken(Keyword.ABSTRACT, 0);

/// A `class` token.
final Token $class = new KeywordToken(Keyword.CLASS, 0);

/// A `}` token.
final Token $closeCurly = new Token(TokenType.CLOSE_CURLY_BRACKET, 0);

/// A `extends` token.
final Token $extends = new KeywordToken(Keyword.EXTENDS, 0);

/// A `implements` token.
final Token $implements = new KeywordToken(Keyword.IMPLEMENTS, 0);

/// A `<` token.
final Token $lt = new Token(TokenType.LT, 0);

/// A `>` token.
final Token $gt = new Token(TokenType.GT, 0);

/// A `library` token.
final Token $library = new KeywordToken(Keyword.LIBRARY, 0);

/// A `{` token.
final Token $openCurly = new Token(TokenType.OPEN_CURLY_BRACKET, 0);

/// A `;` token.
final Token $semicolon = new Token(TokenType.SEMICOLON, 0);

/// A `with` token.
final Token $with = new KeywordToken(Keyword.WITH, 0);

/// Creates a token from the string [value].
///
/// This is not a `''` token but just a string within the AST that will be
/// parsed.
StringToken stringToken(String value) =>
    new StringToken(TokenType.STRING, value, 0);
