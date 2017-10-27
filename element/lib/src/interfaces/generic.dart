// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:craft_type/type.dart';

import '../element.dart';
import 'typed.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// An interface for [Element]s that can be generic.
abstract class Generic implements Typed<ParameterizedType<GenericType>> {
  /// The type parameters for the element.
  List<GenericType> get typeParameters => type.typeArguments;
}
