import 'package:http/http.dart' as http;
import '../Models/PhotoSize.dart';
import '../Models/message.dart';
import 'dart:convert';

class Me {
  String uri = 'https://graph.microsoft.com/v1.0/me';
  String events = 'https://graph.microsoft.com/v1.0/me/events';
  Map<String, String> _headers;
  static Me _me;
  factory Me(String token) {
    _me = new Me._(token);
    return _me;
  }
  Me._(String token) {
    this._headers = {
      'Authorization': '$token',
    };
  }

  Future<dynamic> _getresponse(
      String action, Map<String, String> headers) async {
    if (headers.length > 0) {
      _headers.addAll(headers);
    }
    String _uri;
    if (action.isNotEmpty) {
      _uri = '$uri$action';
    } else {
      _uri = '$uri';
    }
    var response = await http.get(_uri, headers: _headers);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }

  Future<dynamic> _postresponse(
      String action, Map<String, String> headers, dynamic body) async {
    if (headers.length > 0) {
      _headers.addAll(headers);
    }
    String _uri;
    if (action.isNotEmpty) {
      _uri = '$uri$action';
    } else {
      _uri = '$uri';
    }
    var response = await http.post(_uri, headers: _headers, body: body);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }

  Future<dynamic> get() async {
    return await _getresponse('', {'responseType': 'application/json'});
  }

  Future<dynamic> photo() async {
    return await _getresponse(
        '/photo/\$value', {'responseType': 'arrayBuffer'});
  }

  Future<dynamic> profilePhotobySize(photoSize size) async {
    String psize = PhotoSize.sizeValue[size];
    return await _getresponse('$psize/photo/\$value',
        {'responseType': 'arrayBuffer', 'Content-Type': 'image/jpg'});
  }

  Future<dynamic> getMessages({String folderId}) async {
    folderId ??= '';
    if (folderId.isNotEmpty) {
      return await _getresponse('/mailFolers/$folderId/messages',
          {'Content-Type': 'application/json'});
    } else {
      return await _getresponse(
          '/messages', {'Content-Type': 'application/json'});
    }
  }

  Future<dynamic> createMessage(Message message) async {
    return await _postresponse(
        '/messages',
        {'Accept': 'application/json', "Content-Type": "application/json"},
        json.encode(message.toJson()));
  }
}
