import 'package:flutter_chat_app/domain/entities/user_entity.dart';
import 'package:flutter_chat_app/domain/repository/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({this.repository});

  Future<void> call(UserEntity user) async {
    return await repository.getCreateCurrentUser(user);
  }
}
