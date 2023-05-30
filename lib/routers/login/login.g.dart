// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$LoginControllerRouter(LoginController service) {
  final router = Router();
  router.add(
    'GET',
    r'/login',
    service.Login,
  );
  router.add(
    'POST',
    r'/register',
    service.registerUser,
  );
  return router;
}
