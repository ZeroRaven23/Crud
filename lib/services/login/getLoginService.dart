import '../../util/encrypt.dart';

final encrypt = Encrypt();

class GetLoginService {
  calls(headers) {
    //logicas super complexas de puxar usuario pela database :)
    final encry = encrypt.encrypted(headers['password']);
    return {
      'user': 'user',
      'e-mail': 'superinsano@bestmail.com',
      'password': encry,
    };
  }
}
