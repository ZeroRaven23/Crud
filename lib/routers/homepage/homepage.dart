import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../services/homepage/getHomeService.dart';
part 'homepage.g.dart';

class HomepageController {
  final getService = GetHomeService();
  @Route.get('/')
  Future<Response> testInGet(Request request) async {
    try {
      final res = getService.calls();
      Response response = Response.ok('Parabens voce acessou o ${res}');
      return response;
    } catch (e) {
      print(e);
      return Response.internalServerError();
    }
  }

  Router get router => _$HomepageControllerRouter(this);
}
