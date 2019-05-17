library msgraph;

import 'package:flutter/material.dart';

import 'Models/graphme.dart';
import 'package:http/http.dart' as http;

class MsGraph {
  static String _accessToken;
  static final me = 'https://graph.microsoft.com/v1.0/me';
  Map<String, String> _headers;
  static MsGraph _msGraph;
  factory MsGraph(token) {
    if (MsGraph._msGraph == null)
      MsGraph._msGraph = new MsGraph._internal(token);
    return _msGraph;
  }
  MsGraph._internal(token) {
    MsGraph._accessToken = token;
    this._headers = {
      'Authorization': '$_accessToken',
    };
  }
  Future<dynamic> getMe(
      String action, Map<String, String> headers) async {
    if (headers.length > 0) {
      _headers.addAll(headers);
    }
    String _uri;
    if (action.isNotEmpty) {
      _uri = '$me$action';
    } else {
      _uri = '$me';
    }
    var response = await http.get(_uri, headers: _headers);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }
}
