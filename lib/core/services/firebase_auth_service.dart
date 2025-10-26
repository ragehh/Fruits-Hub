import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جدًا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'يوجد حساب بالفعل لهذا البريد الإلكتروني.',
        );
      } else {
        throw CustomException(message: 'حدث خطأ. يُرجى المحاولة لاحقًا.');
      }
    } catch (e) {
      throw CustomException(message: 'حدث خطأ. يُرجى المحاولة لاحقًا.');
    }
  }
}
