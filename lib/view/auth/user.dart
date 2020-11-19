import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lika/view/auth/userModel.dart';
import 'package:lika/utils/user.dart';
//import 'package:sokoni/src/helpers/user.dart';
//import 'package:sokoni/src/models/user.dart';

enum Status {Uninitialized, Unauthenticated, Authenticating, Authenticated}

class AuthProvider with ChangeNotifier{
  // we're using the methods of the ChangeNotifier class in the AuthProvider class
  FirebaseAuth _auth;
  // ignore: deprecated_member_use
  User _user;
  Status _status = Status.Uninitialized;// initial status
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //getters => we can access the values of a class but we cannot modify the values

  Status get status => _status;
  UserModel get userModel => _userModel;

  // ignore: deprecated_member_use
  User get user => _user;

  

  // ignore: non_constant_identifier_names
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();




 AuthProvider.initialize(): _auth = FirebaseAuth.instance{
    //this listens to the user authentication state the we will do something about once a change is caught
    // ignore: deprecated_member_use
    _auth.onAuthStateChanged.listen(_onStateChanged);
 }

  Future<bool> signIn() async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      return true;
    }catch(e){

      return _onError(e.toString());
    }

  }
  Future signOut(){
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async{
   try{
      _status = Status.Authenticating;
    notifyListeners();
    await _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((user) {
      Map<String, dynamic> values = {
        "name": name.text,
        "email": email.text,
        "id": user.user.uid,

      };
      _userServices.createUser(values);
    });

    return true;

   }catch(e){
     return _onError(e.toString());
    
   }
   
  }
   
       // ignore: deprecated_member_use
    Future<void> _onStateChanged(User firebase_User) async{
     if(firebase_User == null){
       _status =  Status.Uninitialized;
     }else {
       _user = firebase_User;
       _status = Status.Authenticated;
       _userModel = await _userServices.getUserById(firebase_User.uid);
     }

     notifyListeners();
    }


    // my gen methods
    bool _onError(String error){
     _status = Status.Unauthenticated;
     notifyListeners();
     print("We got an error: $error");
     return false;
   }

   void cleanControllers (){
     email.text = " ";
     password.text = " ";
     name.text = " ";
   }
   }

