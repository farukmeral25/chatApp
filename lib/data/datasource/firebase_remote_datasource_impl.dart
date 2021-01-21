import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/data/model/user_model.dart';
import 'package:flutter_chat_app/domain/entities/user_entity.dart';

import 'firebase_remote_datasource.dart';

class FirebaseRemoteDatasourceImpl implements FirebaseRemoteDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;
  String _verificationId = "";

  FirebaseRemoteDatasourceImpl({this.auth, this.fireStore});

  @override
  Future<void> SignOut() async => await auth.signOut();

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = fireStore.collection("users");
    final uid = await getCurrentUID();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        name: user.name,
        profileUrl: user.profileUrl,
        status: user.status,
        uid: user.uid,
        isOnline: user.isOnline,
        phoneNumber: user.phoneNumber,
        email: user.email,
      ).toDocument();
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    });
  }

  @override
  Future<String> getCurrentUID() async => auth.currentUser.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser.uid != null;

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: smsPinCode);
    await auth.signInWithCredential(authCredential);
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    final PhoneVerificationCompleted phoneVerificationCompleted =
        (AuthCredential authCredential) {
      print("Phone Verified: Token ${authCredential.token}");
    };
    final PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException firebaseAuthException) {
      print(
          "Phone Failed: ${firebaseAuthException.message},${firebaseAuthException.code}");
    };
    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      this._verificationId = verificationId;
      print("Time Out: $verificationId");
    };

    final PhoneCodeSent phoneCodeSent =
        (String verificationId, [int forceResendingToken]) {};
    auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: phoneVerificationCompleted,
      verificationFailed: phoneVerificationFailed,
      timeout: const Duration(seconds: 10),
      codeSent: phoneCodeSent,
      codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
    );
  }
}
