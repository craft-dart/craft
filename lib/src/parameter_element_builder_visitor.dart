// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/analyzer.dart' as analyzer;
import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:craft_element/element.dart';
import 'package:craft_element_builder/element_builder.dart';

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Implements [ElementBuilderVisitor] for [ParameterElement]s.
abstract class ParameterElementBuilderVisitor implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // ElementBuilderVisitor
  //---------------------------------------------------------------------

  @override
  ElementBuilder<ParameterElement> visitParameterElement(
    analyzer.ParameterElement element,
  ) =>
      visitElement(
        element,
        new ParameterElementBuilder(),
      ) as ParameterElementBuilder
        ..type = visitDartType(element.type)
        ..parameterKind = _parameterKind(element.parameterKind)
        ..isCovariant = element.isCovariant
        ..isInitializer = element.isInitializingFormal;

  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  /// Determines what kind of parameter the [value] refers to.
  ///
  /// The analyzer uses string values to denote the different kind of parameters.
  /// These match to the following strings.
  ///
  /// * [ParameterKind.named] == 'NAMED'
  /// * [ParameterKind.positional] == 'POSITIONAL'
  /// * [ParameterKind.required] == 'REQUIRED'
  ParameterKind _parameterKind(analyzer.ParameterKind value) {
    if (value == analyzer.ParameterKind.NAMED) {
      return ParameterKind.named;
    } else if (value == analyzer.ParameterKind.POSITIONAL) {
      return ParameterKind.positional;
    } else {
      return ParameterKind.required;
    }
  }
}
