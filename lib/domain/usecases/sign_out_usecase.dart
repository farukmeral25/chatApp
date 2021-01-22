import 'package:flutter_chat_app/domain/repository/firebase_repository.dart';

class SignOutUseCase{
  final FirebaseRepository repository;

  SignOutUseCase({this.repository});

  Future<void> call()async{
    return await repository.SignOut();
  }
}