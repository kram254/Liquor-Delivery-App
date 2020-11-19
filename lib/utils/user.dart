import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lika/view/auth/userModel.dart';

class UserServices {
  String collection = "users";
  // ignore: deprecated_member_use
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    // ignore: deprecated_member_use
    _firestore.collection(collection).document(id).setData(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    // ignore: deprecated_member_use
    _firestore.collection(collection).document(values["id"]).updateData(values);
  }

// ignore: deprecated_member_use
  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}