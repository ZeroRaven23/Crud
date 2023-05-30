import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8('t83iB51D6RPBByvmydA7x1ZEs5mP4TQJ'); // Chave gerada por comando
final iv = IV.fromLength(16);

class Encrypt {
  final encrypter = Encrypter(AES(key));
  encrypted(password) {
    final encry = encrypter.encrypt(password, iv: iv);
    return encry.base64;
  }

  decrypted(password) {
    //Viria do banco de dados encripitado
    final decryp = encrypter.encrypt(password, iv: iv);
    return decryp;
  }
}
