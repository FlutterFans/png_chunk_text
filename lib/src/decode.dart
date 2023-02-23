Map<String, String> decode(List<int> data) {
  bool naming = true;
  String text = '';
  String name = '';

  for (var i = 0; i < data.length; i++) {
    var code = data[i];

    if (naming) {
      if (code != 0) {
        name += String.fromCharCode(code);
      } else {
        naming = false;
      }
    } else {
      if (code != 0) {
        text += String.fromCharCode(code);
      } else {
        throw UnsupportedError('Invalid NULL character found. 0x00 character is not permitted in tEXt content');
      }
    }
  }

  return {
    'keyword': name,
    'text': text
  };
}