import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:png_chunk_text/png_chunk_text.dart' as text;
import 'package:png_chunks_encode/png_chunks_encode.dart';
import 'package:png_chunks_extract/png_chunks_extract.dart';


void main() {
  test('png-chunk-text', () {
    var dir = Directory.current.path;
    if (dir.endsWith('/test')) {
      dir = dir.replaceAll('/test', '');
    }
    File file = File('$dir/test/test.png');
    final bytes = file.readAsBytesSync();
    final chunks = extractChunks(bytes);
    chunks.insert(chunks.length-1, text.encode('Author', 'Lorem Ipsum'));

    // // Re-encode the PNG with modified metadata, then try
    // // and extract it again
    final encoded = encodeChunks(chunks);
    final decoded = extractChunks(encoded);
    final textChunk = decoded[decoded.length - 2];
    expect(text.decode(textChunk['data'])['keyword'], 'Author', reason: 'keyword matched successfully');
    expect(text.decode(textChunk['data'])['text'], 'Lorem Ipsum', reason: 'text matched successfully');
  });
}