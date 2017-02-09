// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Create a default list.
///
/// If [value] is not null then it will be used, otherwise an empty list will
/// be returned.
List<T> defaultList<T>(Iterable<T> value) =>
    new List<T>.unmodifiable(value ?? <T>[]);

/// Create a default map.
///
/// If [value] is not null then it will be used, otherwise an empty map will
/// be returned.
Map<K, V> defaultMap<K, V>(Map<K, V> value) =>
    new Map<K, V>.unmodifiable(value ?? <K, V>{});
