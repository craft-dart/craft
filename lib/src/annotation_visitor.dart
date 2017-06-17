// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/element.dart' as analyzer;

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [analyzer.ElementVisitor] that outputs annotations.
abstract class AnnotationVisitor implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // ElementVisitor
  //---------------------------------------------------------------------

  // \TODO Implement

  @override
  dynamic visitElementAnnotation(analyzer.ElementAnnotation annotation) => null;
}
