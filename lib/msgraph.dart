library msgraph;

import 'Component/graphme.dart';

export 'Models/PhotoSize.dart';
export 'Models/message.dart';

//import 'package:http/http.dart' as http;

class MsGraph {
  Me me;
  static MsGraph _msGraph;
  factory MsGraph(token) {
    if (MsGraph._msGraph == null)
      MsGraph._msGraph = new MsGraph._internal(token);
    return _msGraph;
  }
  MsGraph._internal(token) {
    this.me = new Me(token);
  }
}
