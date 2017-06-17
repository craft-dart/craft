// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:analyzer/dart/element/type.dart' as analyzer;
import 'package:craft_type/type.dart';

import 'element_builder_visitor.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Implements [ElementBuilderVisitor] methods for [DartType]s.
abstract class TypeVisitor implements ElementBuilderVisitor {
  //---------------------------------------------------------------------
  // ElementVisitor
  //---------------------------------------------------------------------

  @override
  T visitDartType<T extends DartType>(analyzer.DartType type) =>
      _visitDartType(type, false);

  @override
  InterfaceType<T> visitInterfaceType<T extends DartType>(
    analyzer.InterfaceType type,
  ) =>
      _visitInterfaceType<T>(type, false);

  @override
  FunctionType<T> visitFunctionType<T extends DartType>(
    analyzer.FunctionType type,
  ) =>
      _visitFunctionType<T>(type, false);

  @override
  GenericType visitGenericType(
    analyzer.TypeParameterType type,
  ) =>
      _visitGenericType(type, false) as GenericType;

  //---------------------------------------------------------------------
  // Private methods
  //---------------------------------------------------------------------

  // The below functions mirror their public counterparts but contain a boolean
  // for whether generic types should be treated as [InterfaceType]s or
  // [GenericType]s.
  //
  // A generic can be recursive which will cause infinite recursion unless the
  // [treatGenericAsInterface] value is false.
  //
  //     class Foo<E extends List<E>>
  //
  // The value of [treatGenericAsInterface] is false when visiting function
  // types and when visiting an extension of a generic.

  T _visitDartType<T extends DartType>(
    analyzer.DartType type,
    bool treatGenericAsInterface,
  ) {
    var dartType;

    // Determine the dart type
    if (type.isDynamic) {
      dartType = dynamicType;
    } else if (type.isVoid) {
      dartType = voidType;
    } else if (type.isObject) {
      dartType = objectType;
    } else if (type.isDartCoreNull) {
      dartType = nullType;
    } else if (type is analyzer.InterfaceType) {
      dartType = _visitInterfaceType<T>(type, treatGenericAsInterface);
    } else if (type is analyzer.TypeParameterType) {
      dartType = _visitGenericType(type, treatGenericAsInterface);
    } else if (type is analyzer.FunctionType) {
      dartType = _visitFunctionType(type, treatGenericAsInterface);
    }

    assert(dartType != null);
    return dartType as T;
  }

  InterfaceType<T> _visitInterfaceType<T extends DartType>(
    analyzer.InterfaceType type,
    bool treatGenericAsInterface,
  ) {
    final name = type.name;
    var dartType;

    // Use the interface types for known types
    if (type.element.library.isDartCore) {
      if (name == 'num') {
        dartType = numType;
      } else if (name == 'int') {
        dartType = intType;
      } else if (name == 'double') {
        dartType = doubleType;
      } else if (name == 'String') {
        dartType = stringType;
      } else if (name == 'bool') {
        dartType = boolType;
      }
    }

    dartType ??= new InterfaceType<T>(
      name,
      type.typeArguments
          .map<T>((t) => _visitDartType(t, treatGenericAsInterface)),
    );

    return dartType as InterfaceType<T>;
  }

  FunctionType<T> _visitFunctionType<T extends DartType>(
    analyzer.FunctionType type,
    bool treatGenericAsInterface,
  ) {
    // Map the named parameter types
    final namedParameterTypes = <String, DartType>{};

    type.namedParameterTypes.forEach((name, parameterType) {
      namedParameterTypes[name] = visitDartType(parameterType);
    });

    return new FunctionType(
      typeArguments: type.typeArguments.map<T>(visitDartType),
      returnType: visitDartType(type.returnType),
      requiredParameterNames: type.normalParameterNames,
      requiredParameterTypes: type.normalParameterTypes
          .map((t) => _visitDartType(t, treatGenericAsInterface)),
      optionalParameterNames: type.optionalParameterNames,
      optionalParameterTypes: type.optionalParameterTypes
          .map((t) => _visitDartType(t, treatGenericAsInterface)),
      namedParameterTypes: namedParameterTypes,
    );
  }

  DartType _visitGenericType(
    analyzer.TypeParameterType type,
    bool treatGenericAsInterface,
  ) {
    if (treatGenericAsInterface) {
      return new InterfaceType(type.name);
    }

    final bound = type.bound;
    final extending =
        bound != null ? _visitDartType<InterfaceType>(bound, true) : null;

    return new GenericType(type.name, extending);
  }
}
