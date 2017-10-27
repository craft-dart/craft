// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';
import 'dart:convert';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'resource.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Reads the contents of a JSON resource at the [uri].
Future<T> readJson<T>(Uri uri) async {
  final contents = await readResource(uri);

  return JSON.decode(contents) as T;
}

/// Writes the contents of a JSON resource to the [uri].
Future<Null> writeJson<T>(Uri uri, T contents) {
  final encoded = JSON.encode(contents);

  return writeResource(uri, encoded);
}
