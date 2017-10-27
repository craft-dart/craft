// Copyright (c) 2017 the Craft Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A buffer for creating documentation comments.
class CommentBuffer {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The string buffer to write to.
  final StringBuffer _buffer = new StringBuffer();

  //---------------------------------------------------------------------
  // Methods
  //---------------------------------------------------------------------

  /// Writes the [value] directly to the builder.
  ///
  /// This should be used when the value does not require any formatting.
  void writeRaw(String value) {
    _buffer.write(value);
  }

  //---------------------------------------------------------------------
  // Object
  //---------------------------------------------------------------------

  /// Returns the documentation comments.
  @override
  String toString() => _buffer.toString();
}
