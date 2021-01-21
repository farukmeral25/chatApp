import 'package:flutter_chat_app/data/datasource/firebase_remote_datasource.dart';
import 'package:flutter_chat_app/domain/entities/user_entity.dart';
import 'package:flutter_chat_app/domain/repository/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final FirebaseRemoteDatasource remoteDatasource;

  FirebaseRepositoryImpl({this.remoteDatasource});

  @override
  Future<void> SignOut() {
    // TODO: implement SignOut
    throw UnimplementedError();
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      await remoteDatasource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUID()async => await remoteDatasource.getCurrentUID();

  @override
  Future<bool> isSignIn() async => await remoteDatasource.isSignIn();

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async => await remoteDatasource.signInWithPhoneNumber(smsPinCode);

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async => await remoteDatasource.verifyPhoneNumber(phoneNumber);
}
