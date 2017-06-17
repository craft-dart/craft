// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:analyzer/dart/element/type.dart' as analyzer;
import 'package:craft_element/element.dart';
import 'package:craft_element_builder/element_builder.dart';

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Implements [ElementBuilderVisitor] for [FieldElement]s.
abstract class FieldElementBuilderVisitor implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // ElementBuilderVisitor
  //---------------------------------------------------------------------

  @override
  ElementBuilder<FieldElement> visitFieldElement(
    analyzer.FieldElement element,
  ) =>
      _visitPropertyInducingElement(element);

  @override
  ElementBuilder<FieldElement> visitTopLevelVariableElement(
    analyzer.TopLevelVariableElement element,
  ) =>
      _visitPropertyInducingElement(element);

  ElementBuilder<FieldElement> _visitPropertyInducingElement(
    analyzer.PropertyInducingElement element,
  ) {
    final builder = visitElement(
      element,
      new FieldElementBuilder(),
    ) as FieldElementBuilder
      ..type = visitDartType(element.type)
      ..isStatic = element.isStatic;

    print('FIELD ${element.name}');

    final isFinal = element.isFinal;
    final isConst = element.isConst;
    var isAbstract = false;
    bool getter;
    bool setter;

    if (element.isSynthetic) {
      builder.isProperty = true;

      final getterElement = element.getter;
      final setterElement = element.setter;

      getter = getterElement != null;
      setter = setterElement != null;

      // Get the annotation on the individual parts
      if (getter) {
        isAbstract = getterElement.isAbstract;
      }

      if (setter) {
        isAbstract = setterElement.isAbstract || isAbstract;
      }
    } else {
      builder..isProperty = false;
      //..defaultValue = dartValue(element.constantValue, dartEnumIndex);

      // Field always has a getter
      getter = true;

      // If the field is final or const it is not possible to set the value
      setter = !(isFinal || isConst);
    }

    builder
      ..getter = getter
      ..setter = setter
      ..isFinal = isFinal
      ..isConst = isConst
      ..isAbstract = isAbstract;

    return builder;
  }
}
