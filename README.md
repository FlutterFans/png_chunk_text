# png_chunk_text

[![pub package](https://img.shields.io/pub/v/png_chunk_text.svg)](https://pub.dev/packages/png_chunk_text)

Dart port of [png_chunk_text](https://github.com/hughsk/png-chunk-text).

Create or parse a PNG tEXt chunk for storing uncompressed text data in PNG images.
Can be used in combination with [png_chunks_extract](https://github.com/FlutterFans/png_chunks_extract)
and [png_chunks_encode](https://github.com/FlutterFans/png_chunks_encode) for adding and reading custom
metadata in PNG images.

## Features

Create or parse a PNG tEXt chunk for storing uncompressed text data in PNG images.

## Getting started

In the pubspec.yaml of your flutter project, add the following dependency:

```yaml
dependencies:
...
png_chunk_text: ^1.0.0
```

Import it:
```dart
import 'package:png_chunk_text/png_chunk_text.dart' as text;
```

## Usage

Please see the usage in `test/png_chunk_text_test.dart`.

```dart
import 'package:png_chunk_text/png_chunk_text.dart' as text;

final map = text.encode('Author', 'Lorem Ipsum');

final result = text.decode(textChunkData);
```