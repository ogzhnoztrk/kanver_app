import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  ///register with [email] and [password]
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Kullanıcı oluşturma hatası: $e");
      // Hata durumunu yönetme (örneğin, kullanıcı zaten varsa)
    }
  }

  ///login with [email] and [password]
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Giriş hatası: $e");
      // Hata durumunu yönetme (örneğin, hatalı şifre)
    }
  }

  ///sign out
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Çıkış hatası: $e");
      // Hata durumunu yönetme
    }
  }

  ///reset password
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Şifre sıfırlama hatası: $e");
      // Hata durumunu yönetme
    }
  }

  ///get Current User
  ///giriş yapan kullanıcının kontrolü
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
