// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:craft_element/element.dart';
import 'package:craft_element_builder/element_builder.dart';

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Implements [ElementBuilderVisitor] for [BaseElement]s and its subclasses.
abstract class BaseElementBuilderVisitor implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // ElementVisitor
  //---------------------------------------------------------------------

  @override
  ElementBuilder<T> visitElement<T extends BaseElement>(
    analyzer.Element element,
    BaseElementBuilder<T> builder,
  ) =>
      builder
        ..name = element.name
        ..annotations = element.metadata.map(visitElementAnnotation)
        ..comments = visitDocumentationComment(element);
}
