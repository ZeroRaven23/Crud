import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../services/login/getLoginService.dart';
import '../../services/login/postRegisterService.dart';
import '../../util/headers.dart';
part 'login.g.dart';

class LoginController {
  final getService = GetLoginService();
  final postService = PostRegisterService();
  final clear = Headers();

  @Route.get('/login')
  Future<Response> Login(Request request) async {
    try {
      final headers = request.headers;
      final clearHeaders = clear.calls(headers);
      final res = getService.calls(clearHeaders);
      Response response = Response.ok('Login feito com sucesso! \n ${res}');
      return response;
    } catch (e) {
      print(e);
      return Response.internalServerError();
    }
  }

  @Route.post('/register')
  Future<Response> registerUser(Request request) async {
    try {
      final headers = request.headers;
      final clearHeaders = clear.calls(headers);
      final res = postService.calls(clearHeaders);
      Response response = Response.ok('Cadastrado com sucesso ! \n ${res}');
      return response;
    } catch (e) {
      print(e);
      return Response.internalServerError();
    }
  }

  Router get router => _$LoginControllerRouter(this);
}
