// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_element/element.dart';
import 'package:craft_type/type.dart';

import 'base_element_builder.dart';
import 'element_builder.dart';
import 'interfaces.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [ElementBuilder] for [FieldElement]s.
class FieldElementBuilder extends BaseElementBuilder<FieldElement>
    with
        AbstractBuilder<FieldElement>,
        ConstantBuilder<FieldElement>,
        DefaultsBuilder<FieldElement>,
        StaticBuilder<FieldElement>,
        TypedBuilder<FieldElement, DartType> {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// Whether the field is a property (getter and/or setter).
  bool isProperty = false;

  /// Whether the field has a getter.
  bool getter = true;

  /// Whether the field has a setter.
  bool setter = true;

  /// Whether the field is final.
  bool isFinal = false;

  //---------------------------------------------------------------------
  // MetadataBuilder
  //---------------------------------------------------------------------

  @override
  FieldElement buildInternal() => new FieldElement(
        name,
        type: type,
        isProperty: isProperty,
        getter: getter,
        setter: setter,
        isAbstract: isAbstract,
        isConst: isConst,
        isFinal: isFinal,
        isStatic: isStatic,
        defaultValue: defaultValue,
        annotations: annotations,
        comments: comments.toString(),
      );
}

/// Creates an instance of [FieldElementBuilder] with the given [name] which
/// represents a field.
///
/// The builder returned is equivalent to the following field declaration.
///
///     int aField;
FieldElementBuilder field(String name) =>
    new FieldElementBuilder()..name = name;

/// Creates an instance of [FieldElementBuilder] with the given [name] which
/// represents a constant field.
///
/// The builder returned is equivalent to the following field declaration.
///
///     const int aField = 1;
FieldElementBuilder constField(String name) => field(name)
  ..isConst = true
  ..setter = false;

/// Creates an instance of [FieldElementBuilder] with the given [name] which
/// represents a final field.
///
/// The builder returned is equivalent to the following field declaration.
///
///     final int aField = 1;
FieldElementBuilder finalField(String name) => field(name)
  ..isFinal = true
  ..setter = false;

///
///     int get aProperty => ...;
///     set aProperty(int value) { ... }
FieldElementBuilder property(String name) => new FieldElementBuilder()
  ..name = name
  ..isProperty = true;

/// Creates an instance of [FieldElementBuilder] with the given [name] which
/// represents a getter.
///
/// The builder returned is equivalent to the following field declaration.
///
///    int get aProperty => ...;
FieldElementBuilder getter(String name) => property(name)..setter = false;

/// Creates an instance of [FieldElementBuilder] with the given [name] which
/// represents a setter.
///
/// The builder returned is equivalent to the following field declaration.
///
///    set aProperty(int value) { ... }
FieldElementBuilder setter(String name) => property(name)..getter = false;
