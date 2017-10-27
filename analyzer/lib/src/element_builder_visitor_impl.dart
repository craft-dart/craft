// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/visitor.dart' as analyzer;

import 'annotation_visitor.dart';
import 'base_element_builder_visitor.dart';
import 'class_element_builder_visitor.dart';
import 'documentation_comment_visitor.dart';
import 'element_builder_visitor.dart';
import 'field_element_builder_visitor.dart';
import 'function_element_builder_visitor.dart';
import 'library_element_builder_visitor.dart';
import 'parameter_element_builder_visitor.dart';
import 'type_visitor.dart';
import 'uri_referenced_element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Implementation of [ElementBuilderVisitor].
///
/// Mixes in all the implementations to create the implementation.
class ElementBuilderVisitorImpl = analyzer.ThrowingElementVisitor
    with
        AnnotationVisitor,
        BaseElementBuilderVisitor,
        ClassElementVisitorBuilder,
        DocumentationCommentVisitor,
        FieldElementBuilderVisitor,
        FunctionElementBuilderVisitor,
        LibraryElementBuilderVisitor,
        TypeVisitor,
        ParameterElementBuilderVisitor,
        UriReferencedElementBuilderVisitor;
