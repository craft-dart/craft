// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:resource/resource.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Reads a package resource at the [uri].
///
/// This assumes that the [uri] is a package path.
Future<String> readPackageResource(Uri uri) => new Resource(uri).readAsString();
