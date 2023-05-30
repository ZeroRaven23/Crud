import 'dart:io';

import 'package:args/args.dart';
import 'package:main/routers/homepage/homepage.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/routers/login/login.dart';

const _hostname = 'localhost';
void main(List<String> args) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);
  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '7070';
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    exitCode = 64;
    return;
  }
  final router = Router();
  router.mount('/', HomepageController().router);
  router.mount('/cadastre', LoginController().router);

  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(router);

  var server = await io.serve(handler, _hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
