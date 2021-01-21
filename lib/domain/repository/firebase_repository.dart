import 'package:flutter_chat_app/domain/entities/user_entity.dart';

abstract class FirebaseRepository{
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> signInWithPhoneNumber(String smsPinCode);
  Future<bool> isSignIn();
  Future<void> SignOut();
  Future<String> getCurrentUID();
  Future<void> getCreateCurrentUser(UserEntity user);
}