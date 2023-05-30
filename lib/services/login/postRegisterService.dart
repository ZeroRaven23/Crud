import '../../util/encrypt.dart';

class PostRegisterService {
  final encrypt = Encrypt();
  calls(headers) {
    try {
      final user = _registerUser(headers);
      return user;
    } catch (e) {
      print(e);
      return e;
    }
  }

  _registerUser(headers) {
    try {
      //Aqui ficaria a logica do banco de dados usando o prisma.
      //String password = encrypt.encrypted(password);
      if (headers['password'] == headers['confirmPassword']) {
        String ok = "PARABENS SUA SENHA É IGUAL!!";
        return ok;
      }
      throw Exception("senha não conhecide!!");
    } catch (e) {
      throw Error();
    }
  }
}
