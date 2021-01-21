import 'package:flutter_chat_app/domain/repository/firebase_repository.dart';

class IsSignInUseCase{
  final FirebaseRepository repository;

  IsSignInUseCase({this.repository});

  Future<bool> call() async{
    return await repository.isSignIn();
  }

}