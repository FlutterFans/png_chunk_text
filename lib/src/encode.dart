import 'dart:typed_data';

Map<String, dynamic> encode(String keyword, String content) {
  if (!RegExp('[\x00-\xFF]+').hasMatch(keyword) || !RegExp('[\x00-\xFF]+').hasMatch(content)) {
    throw UnsupportedError(
        'Only Latin-1 characters are permitted in PNG tEXt chunks.'
            ' You might want to consider base64 encoding and/or zEXt compression');
  }

  if (keyword.length >= 80) {
    throw UnsupportedError('Keyword "$keyword" is longer than the 79-character limit imposed by the PNG specification');
  }

  int totalSize = keyword.length + content.length + 1;
  Uint8List output =  Uint8List(totalSize);
  int idx = 0;
  int code;

  for (var i = 0; i < keyword.length; i++) {
    code = keyword.codeUnitAt(i);
    if (code == 0) {
      throw UnsupportedError('0x00 character is not permitted in tEXt keywords');
    }

    output[idx++] = code;
  }

  output[idx++] = 0;

  for (var j = 0; j < content.length; j++) {
    code = content.codeUnitAt(j);
    if (code == 0) {
      throw UnsupportedError('0x00 character is not permitted in tEXt content');
    }

    output[idx++] = code;
  }

  return {
    'name': 'tEXt',
    'data': output,
  };
}