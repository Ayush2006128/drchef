import 'dart:convert';

import 'package:drchef/utils/json_parsing.dart';

class ResponseModel {
  String? text;
  ResponseModel({this.text});
  Map<String, dynamic> parseResponse() {
    assert(text != null);
    final validJson = cleanJson(text!);
    final jsonResponse = jsonDecode(validJson);
    return jsonResponse;
  }
}
