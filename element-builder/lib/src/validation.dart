// Copyright (c) 2017, the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'interfaces.dart';
import 'invalid_element_error.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Validates that all the [builders] contain unique names.
void validateUniqueNames(Iterable<NamedBuilder> builders) {
  final names = <String>[];

  for (var builder in builders) {
    final name = builder.name;
    final repeat =
        names.firstWhere((value) => value == name, orElse: () => null);

    if (repeat != null) {
      throw new InvalidElementError('The name $name is not unique');
    }

    names.add(name);
  }
}
