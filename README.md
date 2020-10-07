# msgraph

A new Flutter package project for Microsoft Graph Api.

## Dependencies

This package depend on [msauth](https://pub.dev/packages/msauth)

## Usage

The easiest way to use this library is via the top-level functions.

### Currently only support limited function

```flutter
import 'package:msgraph/msgraph.dart'

var msGraph = MsGraph(token);
var me=await msGraph.me.get(); //get me
print('Me: $me');
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
