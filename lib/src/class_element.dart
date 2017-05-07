// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_type/type.dart';

import 'base_element.dart';
import 'constructor_element.dart';
import 'enclosing_element.dart';
import 'field_element.dart';
import 'helpers.dart';
import 'interfaces.dart';
import 'method_element.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Contains metadata for a class.
class ClassElement extends BaseElement
    with Accessible, EnclosedElement, EnclosingElement
    implements Abstract, Generic, Typed {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  @override
  final InterfaceType type;
  @override
  final bool isAbstract;

  /// The parent class type.
  final InterfaceType supertype;

  /// The types this class implements.
  final List<InterfaceType> interfaces;

  /// The types this class mixins with.
  final List<InterfaceType> mixins;
  @override
  final List<GenericType> typeParameters;

  /// The fields for the class.
  final List<FieldElement> fields;

  /// The methods for the class.
  final List<MethodElement> methods;

  /// The constructors for the class.
  final List<ConstructorElement> constructors;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ClassElement] with the given [name].
  ///
  /// The class hierarchy can be specified with the [supertype]. Additionally
  /// interfaces that the class conforms to can be specified in [interfaces].
  ///
  /// Currently this implementation is ignoring mixins so this information
  /// is not available to query.
  ClassElement(
    String name, {
    this.supertype,
    this.isAbstract: false,
    Iterable<InterfaceType> interfaces,
    Iterable<InterfaceType> mixins,
    Iterable<GenericType> typeParameters,
    Iterable<FieldElement> fields,
    Iterable<MethodElement> methods,
    Iterable<ConstructorElement> constructors,
    Iterable annotations,
    String comments,
  })
      : type = new InterfaceType(name, typeParameters),
        interfaces = defaultList<InterfaceType>(interfaces),
        mixins = defaultList<InterfaceType>(mixins),
        typeParameters = defaultList<GenericType>(typeParameters),
        fields = defaultList<FieldElement>(fields),
        methods = defaultList<MethodElement>(methods),
        constructors = defaultList<ConstructorElement>(constructors),
        super(name, annotations, comments) {
    // Use `this` to properly scope the value
    encloseAll(this.fields);
    encloseAll(this.methods);
    encloseAll(this.constructors);
  }
}
