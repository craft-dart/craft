// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:craft_element_builder/element_builder.dart';

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [ElementBuilderVisitor] that outputs documentation comments.
abstract class DocumentationCommentVisitor implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // Class Variables
  //---------------------------------------------------------------------

  /// A multi-line regex that will max JavaDoc comments.
  ///
  /// This is used to remove the `/**` and `*/` from the documentationComment.
  static final RegExp _matchJavaDocBlock =
      new RegExp(r'^/\*\*([\s\S]*)\*/$', multiLine: true);

  /// Matches a single line of a JavaDoc comment.
  ///
  /// It will catch cases where a `*` is used at the start of the line and cases
  /// where that is not the case.
  static final RegExp _matchJavaDocLine = new RegExp(r'^\s?\*?(\s?)(.*)');

  /// Matches a forward slash `///` documentation comment.
  static final RegExp _matchForwardSlashLine = new RegExp(r'^\s?///(\s?)(.*)');

  //---------------------------------------------------------------------
  // ElementVisitor
  //---------------------------------------------------------------------

  @override
  CommentBuffer visitDocumentationComment(analyzer.Element element) {
    final buffer = new CommentBuffer();
    var comments = element.documentationComment;

    if (comments == null) {
      return buffer;
    }

    RegExp regex;

    // Determine the comment type
    //
    // The value from the analyzer never has any leading spaces so startsWith
    // can be used directly
    if (comments.startsWith('///')) {
      regex = _matchForwardSlashLine;
    } else {
      regex = _matchJavaDocLine;

      // Remove /** and */ from the documentation block
      //
      // This means that a single regex can just be used to match the rest of
      // the documentation comment
      comments = _matchJavaDocBlock.firstMatch(comments).group(1);
    }

    comments
        .split('\n')
        .map<String>((line) => _getLineText(line, regex))
        .forEach(buffer.writeRaw);

    return buffer;
  }

  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  /// Processes the [line] using the [matcher].
  ///
  /// The [matcher] is assumed to have leading spaces in group 1 and the actual
  /// text in group 2. Additionally it will trim any trailing space.
  String _getLineText(String line, RegExp matcher) {
    if (line.isEmpty) {
      return '';
    }

    final match = matcher.firstMatch(line);

    // Any leading spaces should be
    final leadingSpaces = match.group(1);
    final spaceCount = leadingSpaces.length;

    final prefix =
        (spaceCount % 2 == 0) ? leadingSpaces : leadingSpaces.substring(1);

    return '$prefix${match.group(2).trimRight()}\n';
  }
}
