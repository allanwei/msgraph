library msgraph;

import 'package:msauth/Model/token.dart';

import 'Component/graphme.dart';

export 'Models/PhotoSize.dart';
export 'Models/message.dart';

//import 'package:http/http.dart' as http;

class MsGraph {
  Me me;
  static MsGraph _msGraph;
  factory MsGraph(Token token) {
    if (MsGraph._msGraph == null)
      MsGraph._msGraph = new MsGraph._internal(token.accessToken);
    return _msGraph;
  }
  MsGraph._internal(String accessToken) {
    this.me = new Me(accessToken);
  }
}
